.data
    msg: .asciiz "Please enter a Number: "
    msg2: .asciiz "Your Number is "

.text
.globl main


main:

    # print the message "Please enter a Number: "
    la $a0, msg
    li $v0, 4   # load 4 into return-register to print a string
    syscall

    # Get the Number
    li $v0, 5   # load '4' into return-type register to read an int
    syscall

    # store the number (store the retunr-value of the syscall)
    move $t0, $v0   # store the value of the return-type register into the t0 temp-type register

    # print the final message (msg2) with the prompted number
    la $a0, msg1
    li $v0, 4   # load '4' to print out a string
    syscall

    # print the number
    move $a0, $t0   # move the stored number in t0, into an argument-type register
    li $v0, 1   # load '1' to print out the integer

    j exit  # jump to exit to terminate the program


exit:
    li $v0, 10  # load '10' to the return-register to terminate the program
    syscall
