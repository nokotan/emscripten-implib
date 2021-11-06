//-----------------------------------------------
//
//	Copyright (c) 2021 kamenokonyokonyoko
//
//	Licensed under the MIT License.
//
//-----------------------------------------------

.section .text,"",@

.globl $sym

$sym:
  .functype $sym $sig

$push_stack

  global.get  ${sym}_name@GOT
  i32.const $number
  call _${lib_suffix}_tramp_resolve

  call_indirect $sig
  end_function

  .section  .data.${sym}_name,"",@

${sym}_name:
  .string "${sym}"
  .size ${sym}_name,${sym_len}
