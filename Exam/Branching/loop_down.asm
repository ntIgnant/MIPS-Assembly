.data
msg: .asiiz "Looping Down...\n" 

.text
.globl main

main:
la $a0, msg
li $s1, 8
li $s2, 0

j loop

loop:
blt $s1, $s2, exit
subi $s1, $s1, 4

move $a0, $s0

li $v0, 4
syscall

j loop

exit:
li $v0, 10
syscall

