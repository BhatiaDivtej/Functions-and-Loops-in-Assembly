# Write the assembly code for the main of the compare program


.global main

.text

main:
  # we are using callee-save registers to preserve information when calling printf
  push %r12
  push %r13
  push %r14
  push %r15
  enter $8, $0

  mov %rdi, %r12   # number of arguments
  mov %rsi, %r13   # argument addresses
  movq $1, %r14     # counter
  mov $1, %r15

  cmp $3, %r12
  jne error


loop:

  cmp %r12, %r14
  jge loop2

  movq (%r13, %r14, 8), %rdi

  call atol

  push %rax

  inc %r14
  jmp loop


loop2:

  pop %rdi
  pop %rsi

  call compare

  cmp $0, %rax
  je equal
  jg less
  jl greater

  call end 
  

greater:

    mov $format, %rdi

    mov $message1, %rdi

    movq $0, %rsi

    mov $0, %al
    call printf
    call end 


less:

    mov $format, %rdi

    mov $message2, %rdi

    movq $0, %rsi
    
    mov $0, %al
    call printf
    call end 

equal:

    mov $format, %rdi

    mov $message3, %rdi

    movq $0, %rsi
    
    mov $0, %al
    call printf
    call end 

error:
    mov $format, %rdi

    mov $message4, %rdi

    movq $0, %rsi
    
    mov $0, %al
    call printf
    call end 


end:

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


