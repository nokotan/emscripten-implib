#!/bin/bash

emcc -c -Os -o libz.wasm.tramp.o libz.wasm.tramp.S -s SIDE_MODULE=2
emcc -c -Os -o libz.wasm.init.o libz.wasm.init.c -s SIDE_MODULE=2

emar qc libz.stub.a libz.wasm.tramp.o libz.wasm.init.o
