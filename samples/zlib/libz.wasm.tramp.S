//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl _libz_wasm_tramp_resolve
.functype _libz_wasm_tramp_resolve (i32) -> (i32)

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl adler32_z
adler32_z:
  .functype adler32_z (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 0
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl adler32
adler32:
  .functype adler32 (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 1
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl adler32_combine64
adler32_combine64:
  .functype adler32_combine64 (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 2
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl compress2
compress2:
  .functype compress2 (i32, i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3
  local.get 4

  i32.const 3
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateInit_
deflateInit_:
  .functype deflateInit_ (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 4
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflate
deflate:
  .functype deflate (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 5
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateEnd
deflateEnd:
  .functype deflateEnd (i32) -> (i32)

  local.get 0

  i32.const 6
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl compress
compress:
  .functype compress (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 7
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl compressBound
compressBound:
  .functype compressBound (i32) -> (i32)

  local.get 0

  i32.const 8
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl get_crc_table
get_crc_table:
  .functype get_crc_table () -> (i32)



  i32.const 9
  call _libz_wasm_tramp_resolve

  call_indirect () -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl crc32_z
crc32_z:
  .functype crc32_z (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 10
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl crc32
crc32:
  .functype crc32 (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 11
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl crc32_combine64
crc32_combine64:
  .functype crc32_combine64 (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 12
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateInit2_
deflateInit2_:
  .functype deflateInit2_ (i32, i32, i32, i32, i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3
  local.get 4
  local.get 5
  local.get 6
  local.get 7

  i32.const 13
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32, i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl zcalloc
zcalloc:
  .functype zcalloc (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 14
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl zcfree
zcfree:
  .functype zcfree (i32, i32) -> ()

  local.get 0
  local.get 1

  i32.const 15
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> ()
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateReset
deflateReset:
  .functype deflateReset (i32) -> (i32)

  local.get 0

  i32.const 16
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateResetKeep
deflateResetKeep:
  .functype deflateResetKeep (i32) -> (i32)

  local.get 0

  i32.const 17
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateSetDictionary
deflateSetDictionary:
  .functype deflateSetDictionary (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 18
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateGetDictionary
deflateGetDictionary:
  .functype deflateGetDictionary (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 19
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateSetHeader
deflateSetHeader:
  .functype deflateSetHeader (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 20
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflatePending
deflatePending:
  .functype deflatePending (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 21
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflatePrime
deflatePrime:
  .functype deflatePrime (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 22
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateParams
deflateParams:
  .functype deflateParams (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 23
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateTune
deflateTune:
  .functype deflateTune (i32, i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3
  local.get 4

  i32.const 24
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateBound
deflateBound:
  .functype deflateBound (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 25
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl deflateCopy
deflateCopy:
  .functype deflateCopy (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 26
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzclose
gzclose:
  .functype gzclose (i32) -> (i32)

  local.get 0

  i32.const 27
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzclose_r
gzclose_r:
  .functype gzclose_r (i32) -> (i32)

  local.get 0

  i32.const 28
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzclose_w
gzclose_w:
  .functype gzclose_w (i32) -> (i32)

  local.get 0

  i32.const 29
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzopen64
gzopen64:
  .functype gzopen64 (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 30
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzdopen
gzdopen:
  .functype gzdopen (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 31
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzbuffer
gzbuffer:
  .functype gzbuffer (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 32
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzrewind
gzrewind:
  .functype gzrewind (i32) -> (i32)

  local.get 0

  i32.const 33
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzseek64
gzseek64:
  .functype gzseek64 (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 34
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzseek
gzseek:
  .functype gzseek (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 35
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gztell
gztell:
  .functype gztell (i32) -> (i32)

  local.get 0

  i32.const 36
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzoffset
gzoffset:
  .functype gzoffset (i32) -> (i32)

  local.get 0

  i32.const 37
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzeof
gzeof:
  .functype gzeof (i32) -> (i32)

  local.get 0

  i32.const 38
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzerror
gzerror:
  .functype gzerror (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 39
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzclearerr
gzclearerr:
  .functype gzclearerr (i32) -> ()

  local.get 0

  i32.const 40
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> ()
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzread
gzread:
  .functype gzread (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 41
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzfread
gzfread:
  .functype gzfread (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 42
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzgetc_
gzgetc_:
  .functype gzgetc_ (i32) -> (i32)

  local.get 0

  i32.const 43
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzungetc
gzungetc:
  .functype gzungetc (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 44
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzgets
gzgets:
  .functype gzgets (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 45
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzdirect
gzdirect:
  .functype gzdirect (i32) -> (i32)

  local.get 0

  i32.const 46
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateInit2_
inflateInit2_:
  .functype inflateInit2_ (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 47
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateReset
inflateReset:
  .functype inflateReset (i32) -> (i32)

  local.get 0

  i32.const 48
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateEnd
inflateEnd:
  .functype inflateEnd (i32) -> (i32)

  local.get 0

  i32.const 49
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflate
inflate:
  .functype inflate (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 50
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzwrite
gzwrite:
  .functype gzwrite (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 51
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzfwrite
gzfwrite:
  .functype gzfwrite (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 52
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzputc
gzputc:
  .functype gzputc (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 53
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzputs
gzputs:
  .functype gzputs (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 54
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzflush
gzflush:
  .functype gzflush (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 55
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl gzsetparams
gzsetparams:
  .functype gzsetparams (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 56
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateResetKeep
inflateResetKeep:
  .functype inflateResetKeep (i32) -> (i32)

  local.get 0

  i32.const 57
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateReset2
inflateReset2:
  .functype inflateReset2 (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 58
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateInit_
inflateInit_:
  .functype inflateInit_ (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 59
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflatePrime
inflatePrime:
  .functype inflatePrime (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 60
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateGetDictionary
inflateGetDictionary:
  .functype inflateGetDictionary (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 61
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateSetDictionary
inflateSetDictionary:
  .functype inflateSetDictionary (i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2

  i32.const 62
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateGetHeader
inflateGetHeader:
  .functype inflateGetHeader (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 63
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateSync
inflateSync:
  .functype inflateSync (i32) -> (i32)

  local.get 0

  i32.const 64
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateSyncPoint
inflateSyncPoint:
  .functype inflateSyncPoint (i32) -> (i32)

  local.get 0

  i32.const 65
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateCopy
inflateCopy:
  .functype inflateCopy (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 66
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateUndermine
inflateUndermine:
  .functype inflateUndermine (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 67
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateValidate
inflateValidate:
  .functype inflateValidate (i32, i32) -> (i32)

  local.get 0
  local.get 1

  i32.const 68
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateMark
inflateMark:
  .functype inflateMark (i32) -> (i32)

  local.get 0

  i32.const 69
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateCodesUsed
inflateCodesUsed:
  .functype inflateCodesUsed (i32) -> (i32)

  local.get 0

  i32.const 70
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateBackInit_
inflateBackInit_:
  .functype inflateBackInit_ (i32, i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3
  local.get 4

  i32.const 71
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateBack
inflateBack:
  .functype inflateBack (i32, i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3
  local.get 4

  i32.const 72
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl inflateBackEnd
inflateBackEnd:
  .functype inflateBackEnd (i32) -> (i32)

  local.get 0

  i32.const 73
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl uncompress2
uncompress2:
  .functype uncompress2 (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 74
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl uncompress
uncompress:
  .functype uncompress (i32, i32, i32, i32) -> (i32)

  local.get 0
  local.get 1
  local.get 2
  local.get 3

  i32.const 75
  call _libz_wasm_tramp_resolve

  call_indirect (i32, i32, i32, i32) -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl zlibVersion
zlibVersion:
  .functype zlibVersion () -> (i32)



  i32.const 76
  call _libz_wasm_tramp_resolve

  call_indirect () -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl zlibCompileFlags
zlibCompileFlags:
  .functype zlibCompileFlags () -> (i32)



  i32.const 77
  call _libz_wasm_tramp_resolve

  call_indirect () -> (i32)
  end_function

//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl zError
zError:
  .functype zError (i32) -> (i32)

  local.get 0

  i32.const 78
  call _libz_wasm_tramp_resolve

  call_indirect (i32) -> (i32)
  end_function

