/*
 * Copyright 2018-2020 Yury Gribov
 *
 * The MIT License (MIT)
 *
 * Use of this source code is governed by MIT license that can be
 * found in the LICENSE.txt file.
 */

#include <dlfcn.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

# ifdef _DEBUG 
# define CHECK(cond, fmt, ...) do { \
    if(!(cond)) { \
      fprintf(stderr, "implib-gen: libz.wasm: " fmt "\n", ##__VA_ARGS__); \
      assert(0 && "Assertion in generated code"); \
      exit(1); \
    } \
  } while(0)
# else
# define CHECK(cond, fmt, ...)
# endif

// TODO: convert to single 0-separated string
static const char *const sym_names[] = {
  "adler32_z",
  "adler32",
  "adler32_combine64",
  "compress2",
  "deflateInit_",
  "deflate",
  "deflateEnd",
  "compress",
  "compressBound",
  "get_crc_table",
  "crc32_z",
  "crc32",
  "crc32_combine64",
  "deflateInit2_",
  "zcalloc",
  "zcfree",
  "deflateReset",
  "deflateResetKeep",
  "deflateSetDictionary",
  "deflateGetDictionary",
  "deflateSetHeader",
  "deflatePending",
  "deflatePrime",
  "deflateParams",
  "deflateTune",
  "deflateBound",
  "deflateCopy",
  "gzclose",
  "gzclose_r",
  "gzclose_w",
  "gzopen64",
  "gzdopen",
  "gzbuffer",
  "gzrewind",
  "gzseek64",
  "gzseek",
  "gztell",
  "gzoffset",
  "gzeof",
  "gzerror",
  "gzclearerr",
  "gzread",
  "gzfread",
  "gzgetc_",
  "gzungetc",
  "gzgets",
  "gzdirect",
  "inflateInit2_",
  "inflateReset",
  "inflateEnd",
  "inflate",
  "gzwrite",
  "gzfwrite",
  "gzputc",
  "gzputs",
  "gzflush",
  "gzsetparams",
  "inflateResetKeep",
  "inflateReset2",
  "inflateInit_",
  "inflatePrime",
  "inflateGetDictionary",
  "inflateSetDictionary",
  "inflateGetHeader",
  "inflateSync",
  "inflateSyncPoint",
  "inflateCopy",
  "inflateUndermine",
  "inflateValidate",
  "inflateMark",
  "inflateCodesUsed",
  "inflateBackInit_",
  "inflateBack",
  "inflateBackEnd",
  "uncompress2",
  "uncompress",
  "zlibVersion",
  "zlibCompileFlags",
  "zError",
  0
};

void *_libz_wasm_tramp_table[80];

// Can be sped up by manually parsing library symtab...
void* _libz_wasm_tramp_resolve(int i) {
  assert((unsigned)i + 1 < sizeof(sym_names) / sizeof(sym_names[0]));

  CHECK(!is_lib_loading, "library function '%s' called during library load", sym_names[i]);

  if (_libz_wasm_tramp_table[i] == 0)
  {
    void *h = 0;
    h = dlopen("libz.wasm", RTLD_LAZY | RTLD_GLOBAL);

    // Dlsym is thread-safe so don't need to protect it.
    _libz_wasm_tramp_table[i] = dlsym(h, sym_names[i]);
    CHECK(_libz_wasm_tramp_table[i], "failed to resolve symbol '%s'", sym_names[i]);
  }

  return _libz_wasm_tramp_table[i];
}
