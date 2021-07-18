#!/bin/sh

# Copyright 2017-2019 Yury Gribov
#
# The MIT License (MIT)
# 
# Use of this source code is governed by MIT license that can be
# found in the LICENSE.txt file.

# This is a simple test for Implib.so functionality.
# Run it like
#   ./run.sh ARCH
# where ARCH stands for any supported arch (arm, x86_64, etc., see `implib-gen -h' for full list).
# Note that you may need to install qemu-user for respective platform
# (i386 also needs gcc-multilib).

set -eu

cd $(dirname $0)

CFLAGS="-Os $CFLAGS"

# Build shlib to test against
$CC $CFLAGS -s SIDE_MODULE=1 interposed.c -o libinterposed.wasm

# Standalone executables

for ADD_CFLAGS in ''; do
  for ADD_GFLAGS in ''; do
    echo "Standalone executable: GFLAGS += '$ADD_GFLAGS', CFLAGS += '$ADD_CFLAGS'"

    # Prepare implib
    python3 ../../implib-gen.py -q libinterposed.wasm $ADD_GFLAGS

    # Build app
    $CC $CFLAGS $ADD_CFLAGS -o a.js -s MAIN_MODULE=2 -s EXPORTED_FUNCTIONS="['_main','___small_printf','_iprintf']" --pre-js main.pre.js main.c test.c libinterposed.wasm.a

    node ./a.js > a.out.log
    diff test.ref a.out.log
  done
done

echo SUCCESS
