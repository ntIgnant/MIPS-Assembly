# The idea of this simple program is to sum up two numbers and then multiply the resultant number by itself

.data
    # I'll load specific values to the variables (FOR FUN OMAGAAAAA)

    #local variables num1 ad num2
    num1: .word 11
    num2: .word 33 

.text

.globl main

main:
    # load word/data of num1 and num2 into s0 and s1 registers
    lw $s0, num1
    lw $s1, num2

    jal sum

    j exit  # jump to exit function to terminate the program


sum:
    # save the position of the address of the caller 'main' in the stack    REFERENCE type shiii
    
    # like 'set the stack position shifted -4' to have a gap of 4 bytes between the next addres and the address to go back to main

    addi $sp, $sp, -4   # shift -4 downwards
    sw $ra, 0($sp)  # save the address to 'main' in the stack
    
    add $s0, $s0, $s1   # new value of $s0 will be s0 + s1 register (s0 + s1 = 44)

    move $a0, $s0   # move/assig the value of s0 to the argument-type register a0

    # print the current value of a0 (44)
    li $v0, 1
    syscall

    jal mult  # jump to the next function

    # go back to the stack possition where the addres to main remains (+4 in stack location)
    lw $ra 0($sp)   #load the returned address from 'mult' into ra
    # shift stack pointer to +4 to go back to where the address to 'main' is stored
    addi $sp, $sp, 4    #shift it +4 to go back to main address

    jr $ra  # jump back to main yessirrrr
        

mult:
    mul $v0, $v0, $v0   # multiply the value of the returning-val ree
    move $a0, $v0   # move the value of v0 to agument-type register a0

    # print the current value of a0
    li $v0, 1   # this should be 44 * 44
    syscall

    jr $ra # jump back to caller 'sum'


exit:
    # exit ;p
    li $v0, 10
    syscall
