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
    addi $sp, $sp, -4   # allocate 4 bytes in stack
    sw $ra, 0($sp)  # save ra of main into those 4 bytes

    # create a copy of the value of s0
    li $s1, $s0

    li $t0, 1   # create a 'counter'
    
    slt %a0, $t0, $s0   # it's like a0 = 1 IF t0 < s0, otherwise a0 = 0 
    
    


exit:
    li $v0, 10
    syscall
