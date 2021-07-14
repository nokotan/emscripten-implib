//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.globl $sym
$sym:
  .functype $sym $sig

  i32.const $number
  call _${lib_suffix}_tramp_resolve

$push_stack

  call_indirect $sig
  end_function

