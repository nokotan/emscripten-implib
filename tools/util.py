import os
import sys
import subprocess

me = os.path.basename(__file__)

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

def warn(msg):
  """Emits a nicely-decorated warning."""
  sys.stderr.write('%s: warning: %s\n' % (me, msg))

def error(msg):
  """Emits a nicely-decorated error and exits."""
  sys.stderr.write('%s: error: %s\n' % (me, msg))
  sys.exit(1)