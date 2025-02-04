# factorial of a number using recursion

.data
num1: .word 5   # assign '5' to local variable num1

.text
.globl main

main:
    lw $a0, num1    # load word/data from num1 into a0 argument-register
    
    li $v0, 1	# load 1 into arg type register v0 to print the integer
    syscall


    jal factorial
    
    # code after returning from factorial function...

    
    j exit	# jump to exit to termiante the program
	

factorial:

    li $v0, 1   # set the default return value to 1
    ble $a0, 1, return  # if a0 <= 1, jump to return
    
    # Store return address of 'main' before recursion
    addi $sp, $sp, -4   # allocate 4 bytes in stack
    sw $ra, 0($sp)  # save the current sp point with 0 shift in ra

    # use recursion to get the factoria
    addi $a0, $a0, -1   # if the value of a0 is 5, the new bal is gonna be 5 - 1 so 4
    jal factorial   # jump and link to factorial function


    # restore the sp (+4 bytes)
    lw $ra, 0($sp)  # load the value of the stack pointer (0 shift) into the return address register
    addi $sp, $sp, 4    #add '+4' to the stack pointer (+4 bytes in the stack to go back to the original address to go to 'main')

    # multiply n * fact(n-1) | the register a0 was decremented by 1 before being called
    mul $v0, $a0, $v0
    

return:
    jr $ra  # jump to register-return-address (address to go back to main)    


exit:
    li $v0, 10
    syscall
