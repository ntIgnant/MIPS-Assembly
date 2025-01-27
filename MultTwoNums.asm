.data
num1: .word 5
num2: .word 10

.text
.globl main

main:
lw $s0, num1
lw $s1, num2

j multip  # jump to 'mult' label/function

multip:
mul $s0, $s0, $s1  # this will be num1 = num1 * num2

j print #jump to print label/function shit

print:
move $a0, $s0
li $v0, 1   # set retur-register as 1 to print a float
syscall

j exit  # jumpt to exit label


exit:
li $v0, 10  # set the return-register v0 to 10 to exit the program
syscall
