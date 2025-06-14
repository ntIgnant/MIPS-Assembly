.data
msg: .asciiz "DONE!\n"

.text
.globl main

main:
la $s0, msg
li $s1, 5
li $s2, 0

j loop

loop:
beq $s1, $s2, exit

subi $s1, $s1, 1

move $a0, $s0

li $v0, 4
syscall

j loop

exit:
li $v0, 10
syscall
