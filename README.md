# emscripten implib generator

This repository heavyly depends on <https://github.com/yugr/Implib.so>

## Overview

This repository aims to introduce delayed loading of side modules into emscripten.
Incoming emscripten 2.0.26 are ready to download side modules on-demand using dlopen and asyncify.

## Benefits

* may reduce payloads significantly for all-in-one tools or libraries.
* resolve the probrems of using GPL-licensed library (this is the benefits of side modules)

## Requirements

* emscripten
* wabt

## Basic Usage

```sh
./implib-gen.py zlib.wasm

emcc -c -Os -o zlib.wasm.tramp.o zlib.wasm.tramp.S -s SIDE_MODULE=2
emcc -c -Os -o zlib.wasm.init.o zlib.wasm.init.c -s SIDE_MODULE=2

emar qc zlib.stub.a zlib.wasm.tramp.o zlib.wasm.init.o
```
