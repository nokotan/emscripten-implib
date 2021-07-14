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

$push_stack

  i32.const $number
  call _${lib_suffix}_tramp_resolve

  call_indirect $sig
  end_function

