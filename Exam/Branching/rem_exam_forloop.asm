.data # space for static variables

    num1: .word 1 # .word is 4 bytes (32 bits)
    num2: .word 11

    msg: .asciiz "hello world\n" # .asciiz variables are basically null termanted arrays of chars

.text # the actuial code is expected to start from here (fcuntionality, flow, etc)

main:
    # Load the static variables into registers
    la $s0, msg # load the pointer pointing to the address of msg
    lw $t1, num1 # load the value (word/4-bytes val) of num1 '1'

    # Assign the number to use as operator (%) so 2
    li $t2, 2

    # jump and link to the loop
    jal loop

    # jump to exit to termante the program
    j exit

loop:
    addi $t1, $t1, 1 # add 1 to the value of t1

    # check if the value has reached < 14 (should be 15 for the last check)
    beq $t1, 15, exit # if it has reached the value  15, then jump straight to exit to termante the code
    # else:

    # check for the remanent to print the message
    # using rem | rem a, b, c -> a = b % c
    rem $t3, $t1, $t2 # t3 will be either 0 OR 1

    bne $t3, $zero, loop # i can also use bnez but oke | if t3 == 0, then jump to loop
    # else:
    
    # print the string
    move $a0, $s0 # move the  value of the string (in s0) to argument type register

    li $v0, 4 # load 4 to  the return type register to print the string (expects a pointer to an address, base addrss)
    syscall

    # jump back to 'loop'
    j loop


exit:
    li $v0, 10 # load immediate value '10' into the return type register for syscall 10 (terminate program)
    syscall
