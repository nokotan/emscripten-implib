#!/bin/bash

emcc -c -Os -o main.o main.c -s MAIN_MODULE=2 -I../EmscriptenLibraries/include
emcc -o main.js -Os main.o libz.stub.a -s MAIN_MODULE=2 -lnodefs.js --pre-js=main.pre.js
