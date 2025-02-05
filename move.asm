.data
    num1: .word 10  # val of num1 = 10

.text

.globl main

main:
    lw $t0, num1
    move $a0, $t0   # move the value of t0 to an argument-type register

    li $v0, 1   # load value 1 to return-type regster to print the integer
    syscall

    j exit  # jump t exit to termiante the program


exit:
    li $v0, 10
    syscall
