# factorial of a number using recursion

.data
num1: .word 5   # assign '5' to local variable num1

.text
.globl main

main:
    lw $s0, num1    # load word/data from num1 into s0 register

    jal factorial
    
    # code after returning from factorial function...


factorial:
    


exit:
    li $v0, 10
    syscall
