#!/bin/sh

# Copyright 2019-2020 Yury Gribov
#
# The MIT License (MIT)
# 
# Use of this source code is governed by MIT license that can be
# found in the LICENSE.txt file.

# This test checks that exceptions are successfully propagated
# through implib wrappers.

set -eu

cd $(dirname $0)

$CC $CFLAGS -s SIDE_MODULE=1 -fexceptions interposed.cpp -o libinterposed.wasm
$CC $CFLAGS main.cpp -o a.js -s MAIN_MODULE=1 -fexceptions -L. libinterposed.wasm
node ./a.js 2>&1 | tee ref.log

python3 ../../implib-gen.py -q libinterposed.wasm
$CC $CFLAGS -o a.js -Wno-deprecated -s MAIN_MODULE=1 -fexceptions main.cpp libinterposed.wasm.a libinterposed.wasm
node ./a.js 2>&1 | tee new.log

if ! diff ref.log new.log; then
  echo "Exceptions do NOT propagate through implibs"
  exit 1
fi

echo SUCCESS
