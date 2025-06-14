.data
msg: .asciiz "Frizz\n"

.ktext

.globl main

.text

main:
la $s0, msg
li $s1, 1
li $s2, 3
li $s3, 10
li $s4, 0

j loop

loop:
beq $s1, $s3, exit
#else:

li $t0, 0

rem $t0, $s1, $s2

addi $s1, $s1, 1

bne $t0, $s4, loop
#else:

move $a0, $s0
li $v0, 4
syscall

j loop

exit:
li $v0, 10
syscall

