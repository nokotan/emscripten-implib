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
      fprintf(stderr, "implib-gen: $load_name: " fmt "\n", ##__VA_ARGS__); \
      assert(0 && "Assertion in generated code"); \
      exit(1); \
    } \
  } while(0)
# else
# define CHECK(cond, fmt, ...)
# endif

// TODO: convert to single 0-separated string
static const char *const sym_names[] = {
  $sym_names
  0
};

void *_${lib_suffix}_tramp_table[$table_size] = { 0 };

void *_${lib_suffix}_module = 0;

// Can be sped up by manually parsing library symtab...
void* _${lib_suffix}_tramp_resolve(int i) {
  assert((unsigned)i + 1 < sizeof(sym_names) / sizeof(sym_names[0]));

  CHECK(!is_lib_loading, "library function '%s' called during library load", sym_names[i]);

  if (_${lib_suffix}_tramp_table[i] == 0)
  {
    if (_${lib_suffix}_module == 0)
    {
      _${lib_suffix}_module = dlopen("$load_name", RTLD_LAZY | RTLD_GLOBAL);
    }

    // Dlsym is thread-safe so don't need to protect it.
    _${lib_suffix}_tramp_table[i] = dlsym(_${lib_suffix}_module, sym_names[i]);
    CHECK(_${lib_suffix}_tramp_table[i], "failed to resolve symbol '%s'", sym_names[i]);
  }

  return _${lib_suffix}_tramp_table[i];
}
