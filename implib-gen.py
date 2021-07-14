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
import subprocess
import argparse
import string

me = os.path.basename(__file__)
root = os.path.dirname(__file__)

def run(args, input=''):
  """Runs external program and aborts on error."""
  env = os.environ.copy()
  try:
    del env["LANG"]
  except KeyError:
    pass
  p = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                       stderr=subprocess.PIPE, env=env)
  out, err = p.communicate(input=input.encode('utf-8'))
  out = out.decode('utf-8')
  err = err.decode('utf-8')
  if p.returncode != 0 or err:
    error("%s failed with retcode %d:\n%s" % (args[0], p.returncode, err))
  return out, err



def collect_types(f):
  """Collect function signiture."""

  out, err = run(['wasm-objdump', '-x', '--section=type', f])

  toc = None
  types = []

  for line in out.splitlines():
    line = line.strip()
    m = re.match(r'- type\[([0-9]+)\] (.+) -> (.+)', line)

    if m:
      typeindex = m.group(1)
      argsig = m.group(2)
      resultsig = m.group(3)

      resultsig = resultsig.replace("nil", "")
      typesig = "{} -> ({})".format(argsig, resultsig)

      types.append({ 'index': int(typeindex), 'sig': typesig })

  return types



def collect_functions(f):
  """Collect function types."""

  out, err = run(['wasm-objdump', '-x', '--section=function', f])

  toc = None
  functions = []

  for line in out.splitlines():
    line = line.strip()
    m = re.match(r'- func\[([0-9]+)\] sig=([0-9]+) <([^>]+)>', line)

    if m:
      functionindex = m.group(1)
      functionsigindex = m.group(2)

      functions.append({ 'index': int(functionindex), 'sig': int(functionsigindex) })

  return functions



def collect_sig_from_syms(f, syms):
  """Collect wasm sig"""

  types = collect_types(f)
  functions = collect_functions(f)

  def filter_by_index(searchIndex):
      def cb(t):
        return t['index'] == searchIndex     
      return cb

  def map_sigs(s):
    index = s['index']
    sigindex = list(filter(filter_by_index(index), functions))[0]['sig']
    sig = list(filter(filter_by_index(sigindex), types))[0]['sig']

    return { 'name': s['name'], 'sigindex': sigindex, 'sig': sig }
    
  return list(map(map_sigs, syms))





def collect_syms(f):
  """Collect wasm exports."""

  out, err = run(['wasm-objdump', '-x', '--section=export', f])

  toc = None
  syms = []
  syms_set = set()

  excluded = [ '__wasm_call_ctors' ]

  for line in out.splitlines():
    line = line.strip()
    m = re.match(r'- func\[([0-9]+)\] <([^>]+)> -> "([^"]+)"', line)

    if not m:
      continue
    
    symindex = m.group(1)
    symname = m.group(2)

    if symname in syms_set:
      continue

    if symname in excluded:
      continue

    if symname.startswith("orig$"):
      continue

    syms_set.add(symname)
    syms.append({ 'index': int(symindex), 'name': symname })

  return syms



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
  parser.add_argument('--library-load-name',
                      help="Use custom name for dlopened library (default is LIB)")
  parser.add_argument('--symbol-prefix',
                      metavar='PFX',
                      help="Prefix wrapper symbols with PFX",
                      default='')
  parser.add_argument('--outdir', '-o',
                      help="Path to create wrapper at",
                      default='./')
  args = parser.parse_args()

  input_name = args.library
  load_name = args.library_load_name if args.library_load_name is not None else os.path.basename(input_name)
  target_dir = os.path.join(root, 'arch', 'wasm32')
  outdir = args.outdir

  syms = collect_syms(input_name)
  syms = collect_sig_from_syms(input_name, syms)
  syms = create_stack_stub(syms)

  # Generate assembly code

  suffix = os.path.basename(load_name)
  lib_suffix = re.sub(r'[^a-zA-Z_0-9]+', '_', suffix)

  tramp_file = '%s.tramp.S' % suffix
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

  # Generate C code

  init_file = '%s.init.c' % suffix
  with open(os.path.join(outdir, init_file), 'w') as f:
    with open(os.path.join(root, 'arch/common/init.c.tpl'), 'r') as t:
      if syms:
        sym_names = ',\n  '.join('"%s"' % sym['name'] for sym in syms) + ','
      else:
        sym_names = ''
      init_text = string.Template(t.read()).substitute(
        lib_suffix=lib_suffix,
        load_name=load_name,
        sym_names=sym_names,
        table_size=(len(syms) + 1)
        )
      f.write(init_text)



if __name__ == '__main__':
  main()
