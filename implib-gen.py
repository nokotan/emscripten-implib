#!/usr/bin/python3

# Copyright 2017-2020 Yury Gribov
#
# The MIT License (MIT)
#
# Use of this source code is governed by MIT license that can be
# found in the LICENSE.txt file.

import sys
import os.path
import re
import argparse
import string
from tools import wasmtool 

me = os.path.basename(__file__)
root = os.path.dirname(__file__)



def create_stack_stub(syms):
  def map_args(i):
    index, x = i
    return "  local.get {}".format(index)

  def map_sigs(s):
    sig = s['sig']
    argspart = re.match(r'\(([^\)]*)\) -> ([^\)]*)', sig).group(1).replace(" ", "")

    if argspart != "":
      args = argspart.split(",")
      s['push_stack'] = "\n".join(list(map(map_args, enumerate(args))))
    else:
      s['push_stack'] = ""

    return s

  return list(map(map_sigs, syms))



def main():
  parser = argparse.ArgumentParser(description="Generate wrappers for shared library functions.",
                                   formatter_class=argparse.RawDescriptionHelpFormatter,
                                   epilog="""\
Examples:
  $ python3 {0} /usr/lib/x86_64-linux-gnu/libaccountsservice.so.0
  Generating libaccountsservice.so.0.tramp.S...
  Generating libaccountsservice.so.0.init.c...
""".format(me))

  parser.add_argument('library',
                      metavar='LIB',
                      help="Library to be wrapped.")
  parser.add_argument('--verbose', '-v',
                      help="Print diagnostic info",
                      action='count',
                      default=0)
  parser.add_argument('--dlopen-callback',
                      help="Call user-provided custom callback to load library instead of dlopen",
                      default='')
  parser.add_argument('--dlopen',
                      help="Emit dlopen call (default)",
                      dest='dlopen', action='store_true', default=True)
  parser.add_argument('--no-dlopen',
                      help="Do not emit dlopen call (user must load library himself)",
                      dest='dlopen', action='store_false')
  parser.add_argument('--library-load-name',
                      help="Use custom name for dlopened library (default is LIB)")
  parser.add_argument('--lazy-load',
                      help="Load library lazily on first call to one of it's functions (default)",
                      dest='lazy_load', action='store_true', default=True)
  parser.add_argument('--no-lazy-load',
                      help="Load library eagerly at program start",
                      dest='lazy_load', action='store_false')
  parser.add_argument('--vtables',
                      help="Intercept virtual tables (EXPERIMENTAL)",
                      dest='vtables', action='store_true', default=False)
  parser.add_argument('--no-vtables',
                      help="Do not intercept virtual tables (default)",
                      dest='vtables', action='store_false')
  parser.add_argument('--symbol-list',
                      help="Path to file with symbols that should be present in wrapper (all by default)")
  parser.add_argument('--symbol-prefix',
                      metavar='PFX',
                      help="Prefix wrapper symbols with PFX",
                      default='')
  parser.add_argument('-q', '--quiet',
                      help="Do not print progress info",
                      action='store_true')
  parser.add_argument('--outdir', '-o',
                      help="Path to create wrapper at",
                      default='./')
  args = parser.parse_args()

  input_name = args.library
  verbose = args.verbose
  dlopen_callback = args.dlopen_callback
  dlopen = args.dlopen
  lazy_load = args.lazy_load
  load_name = args.library_load_name if args.library_load_name is not None else os.path.basename(input_name)
  target = 'wasm32'
  quiet = args.quiet
  outdir = args.outdir

  # Collect target info

  target_dir = os.path.join(root, 'arch', target)

  syms = wasmtool.collect_syms(input_name)


  def filter_funs(syms):
    if args.symbol_list is None:
      funs = None
    else:
      with open(args.symbol_list, 'r') as f:
        funs = []
        for line in re.split(r'\r?\n', f.read()):
          line = re.sub(r'#.*', '', line)
          line = line.strip()
          if line:
            funs.append(line)
    
    all_funs = map(lambda s: s['name'], syms)

    if funs is None:
      funs = sorted(list(all_funs))
      if not funs and not quiet:
        util.warn("no public functions were found in %s" % input_name)
    else:
      missing_funs = [name for name in funs if name not in all_funs]
      if missing_funs:
        util.warn("some user-specified functions are not present in library: %s" % ', '.join(missing_funs))
      funs = [name for name in funs if name in all_funs]

    return [sym for sym in syms if sym['name'] in funs]


  syms = filter_funs(syms)
  syms = wasmtool.collect_sig_from_syms(input_name, syms)
  syms = create_stack_stub(syms)

  # Generate assembly code

  suffix = os.path.basename(load_name)
  lib_suffix = re.sub(r'[^a-zA-Z_0-9]+', '_', suffix)

  def generate_assembly_code(tramp_file):
    with open(os.path.join(outdir, tramp_file), 'w') as f:
      with open(target_dir + '/table.S.tpl', 'r') as t:
        table_text = string.Template(t.read()).substitute(
          lib_suffix=lib_suffix)
      f.write(table_text)

      with open(target_dir + '/trampoline.S.tpl', 'r') as t:
        tramp_tpl = string.Template(t.read())

      for i, sym in enumerate(syms):
        tramp_text = tramp_tpl.substitute(
          lib_suffix=lib_suffix,
          sym=args.symbol_prefix + sym["name"],
          sig=sym["sig"],
          sigindex=sym["sigindex"],
          push_stack=sym["push_stack"],
          number=i)
        f.write(tramp_text)
  
  generate_assembly_code('%s.tramp.S' % suffix)

  # Generate C code
  def generate_c_code(init_file):
    with open(os.path.join(outdir, init_file), 'w') as f:
      with open(os.path.join(root, 'arch/common/init.c.tpl'), 'r') as t:
        if syms:
          sym_names = ',\n  '.join('"%s"' % sym['name'] for sym in syms) + ','
        else:
          sym_names = ''
        init_text = string.Template(t.read()).substitute(
          lib_suffix=lib_suffix,
          load_name=load_name,
          dlopen_callback=dlopen_callback,
          has_dlopen_callback=int(bool(dlopen_callback)),
          no_dlopen=not int(dlopen),
          lazy_load=int(lazy_load),
          sym_names=sym_names,
          table_size=(len(syms) + 1)
          )
        f.write(init_text)

  generate_c_code('%s.init.c' % suffix)



if __name__ == '__main__':
  main()
