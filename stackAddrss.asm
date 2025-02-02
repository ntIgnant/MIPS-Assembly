.data

.text

.globls main

main:
    li $s0, 10  # load immediate value '10' to the stored-register s0
    li $s1, 5   # load immediate value '5' to the stored-register s1

    jal sum # jump and link to the function/label 'sum' (this will be waiting until the function finishes, then the following code will be execute)

    j exit  # jump to exit function to terminate the program

sum:
    # store the caller-pointer in the stack to jump back at the end of the function:

    addi $sp, $sp, -4   # move stack pointer '-4' because it's an integer (1 integer = 4 bytes)
                        # sp stands for 'stack pointer'
    sw $ra, 0($sp)  # 'store word'/save value of 'stack pointer with offset 0' in the 'return address' register

    add $s0, $s0, $s1   # now, the result should be 10 + 5 = 15, so s0 = 15

    # print out the values up to this point this will print out '15'

    move $a0, $s0
    li $v0, 1   # load immediate value '1' to print out the value of an integer
    syscall

    jal doubleSum   # jump and link to function doubleSum (this will be waiting until the function terminates it's execution and then it will execute the following code)

    lw $ra, 0($sp)    # move the stack pointer '+4' to set te pointer to the initial one, the address to go back to 'main'    
    addi $sp, $sp, 4  # 'store-word'/save the value of 'stack-pointer offset 0' in return-address register ra (to go back to main)

    jr $ra  # jump register (go back to the current address stored in ra, that is the address of main)
        


doubleSum:

    add $v0, $a0, $a0   # store the value of the sum of argument-type register a0, into v0 return-type register
    
    # move/assign the value of v0 to a0 to have it as arrgument to print the vaue with a syscall
    # print the current value of v0, so it will be '30'
    move $a0, $v0
    li $v0, 1
    syscall

    jr $ra  # jump back to the current address stored in 'return-address register', this will go back to 'sum' function

exit:
    li $v0, 10  # load '10' to terminate the program
    syscall
