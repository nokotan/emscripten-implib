import re
from tools import util

def collect_types(f):
  """Collect function signiture."""

  out, err = util.run(['wasm-objdump', '-x', '--section=type', f])

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

  out, err = util.run(['wasm-objdump', '-x', '--section=function', f])

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

  out, err = util.run(['wasm-objdump', '-x', '--section=export', f])

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

  if syms:
    out, err = util.run(['c++filt'], '\n'.join((sym['name'] for sym in syms)))
    for i, name in enumerate(out.split("\n")):
      if i >= len(syms):
        break
      syms[i]['demangled'] = name

  return syms
