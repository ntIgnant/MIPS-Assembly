.data
    newline: .asciiz "\n"
    done: .asciiz "Done\n"

    num1: .word 10

.text

.globl main

main:
    lw $t0, num1    # load the value of num1 into t0, so t0 = 10
    li $t1, 1   # not, the value of t1is '1', this will be where the loop starts
    j loop

loop:
    move $a0, $t1
    li $v0, 1   # print the current value
    syscall

    la $a0, newline # load the address (la) of newline in v0, we need to load the address because ti's an array of characters
    li $v0, 4   # load 4 in return-rgister to print a string
    syscall

    addi $t1, $t1, 1    # add +1 to t1 (counter of the loop)

    # if t1 > t0
    bgt $t1, $t0, is_done
    #else...
    

    j loop


is_done:
    la $a0, done    # load the address of 'done' in argument-type register
    li $v0, 4   # load '4' in the retunr-type register to rpint a string
    syscall

    j exit  # jumpt to exit to terminate the program




exit:
    # terminate the program
    li $v0, 10
    syscall
