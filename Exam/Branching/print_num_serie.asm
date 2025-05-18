# Data segment, containing all the static variables
.data
    num1: .word 1 # static variable num1 = 1 (.word = 4bytes of memo)

.text # The code starts from here (functionality, flow, etc)

main:
    lw $t0, num1 # load the 'word / integer valaue' of num1 into the temp-type register $t0
    
    # Jump and Link to print_nums, to go back later to main
    jal print_nums

    # Jump to exit to termiante the program
    j exit


print_nums:
    # Function to print out a progression of numbers from 1 to 10

    move $a0, $t0 # move the value of $t0(integer value) to the argument type register

    li $v0, 1 # load 1 to the return-type register to use suscall 1 (print integer)
    syscall

    addi $t0, $t0, 1 # add +1 to the current value of $t0

    # Verify if the num is less than 11
    blt $t0, 11, print_nums # If $t0 < 11, jump to print_nums
    #else:

    # Jump back to the caller (main)
    jr $ra # jump to the return address stored in $ra

exit:

    # load 10 to the retunr-type register for syscall 10 (terminate the program)
    li $v0, 10
    syscall

