# Write the assembly code for the array_max function
.global array_max

.text

array_max:
  # we are using callee-save registers to preserve information when calling printf
  push %r12
  push %r13
  push %r14
  push %r15
  enter $8, $0

  mov %rdi, %r12   # number of arguments
  mov %rsi, %r13   # argument addresses

  mov $0, %r14


  # Take first argument as largest
  # Iterate through the list

  movq (%r13, %r14, 8), %r15     # temp largest stored in r15
 

 # Using the logic of selection sort.(but only looping one)

  loop:
  cmp %r12, %r14
  je loop_end

  cmp %r15, (%r13, %r14, 8)
  jg swap
  jle continue_loop


  continue_loop:
  inc %r14
  jmp loop


  swap:
  movq (%r13, %r14, 8), %r15
  jmp continue_loop


  loop_end:
  movq %r15, %rax   
  leave
  pop %r15
  pop %r14
  pop %r13
  pop %r12
  ret

.data

format: 
  .asciz "%ld"

message1:
  .asciz "greater\n"

message2:
  .asciz "less\n"

message3:
  .asciz "equal\n"

message4:
  .asciz "Two arguments required.\n"


