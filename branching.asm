.data
    # local variables (stack)
    num1: .word 10

    #ascii messages
    pos_msg: .asciiz "Possitive\n"
    neg_msg: .asciiz "Negative\n"
    zero_msg: .asciiz "Zero\n"

.text
.globl main

main:
    # load the values of the local variables into temp-type registers
    lw $t0, num1

    #if t0 == 0: jumpr to is_zero
    beq $t0, $zero, is_zero
    #else...

    #if t0 < 0: jump to is_negative 
    blt $t0, $zero, is_negative
    #else...
    
    # if t0 > 0: jump to is_possitive
    bgt $t0, $zero, is_possitive
    #else...


is_zero:
    lw $t1, zero_msg    # load the value of 'zero_msg' into temp-register t1
    move $a0, $t1   # move the value to an argument-type register
    li $v0, 4   # load 4 in retyrn-type register to print a string
    syscall

    j exit  # jumpt to exit to terminate the function


is_negative:
    lw $t1, neg_msg # load the value of 'neg_msg' into temp-type register t1
    move $a0, $t1   # move the value of t1 into the argument-type register a0
    li $v0, 4   # load '4' as value int the return-type register to print a string
    syscall

    j exit  # jump to exit


is_possitive:
    lw $t1, pos_msg # load the value of 'pos_msg' into the temp-type register t1
    move $a0, $t1   # move the value into an argument-type register
    li $v0, 4   # load '4' as value for the return-type register v0 to print out a string (the message declared in .data)
    syscall

    j exit  # jump to exit to termiante the program


exit:
    li $v0, 10  # load '10' to terminate the program
    syscall
