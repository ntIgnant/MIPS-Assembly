# Data segment for static variables
.data
    msg: .asciiz "hello world\n" # static variable msg = "hello world\n" (.asciiz is a null temrinated char array)


.text # The actual code will start form here (functionality, flow, etc)

main:

    # load the address of the string
    la $s0, msg # Now, the base address of msg is in s0 register

    li $t0, 1 # load 1 to t0 register | this will work as a counter for the 'print_loop' function
    li $t3, 2 # the number which the index is gnna be divide by


    jal print_loop # jump and link to print_loop function
    j exit # jump to exit to termante the program

print_loop:
    div $t0, $t3 # divide the value of t0 into 2 to calculate the decimal reminder
    mfhi $t1 # move from hi to $t1 (the remonder part of the division)

    # add +1 to the counter '$t0'
    addi $t0, $t0, 1

    bnez $t1, print_loop # if t1 (the reminder part) != 0, jump to print_loop again
    #else

    # print the string (base address stored in s0 rn)
    move $a0, $s0 # move the pointer to the base address of the string into a0 argument-type register

    li $v0, 4 # load 4 to use syscall 4 (print string)
    syscall

    # Check if the counter is within the range (1 - 14)
    blt $t0, 15, print_loop # if the counter is less than 15, jump back to print_loop
    #else:

    # return to the caller (main)
    jr $ra # jump to the register address stored in $ra

exit:
    # Load 10 for to the return-type register for syscal 10 (terminate the program)
    li $v0, 10
    syscall
