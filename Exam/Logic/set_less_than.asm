.data # data segement will contian the static variables
    # Assign static variables

    # All these are  .word variables (4-byte long values)
    num1: .word 4
    num2: .word 10
    num3: .word 1

    # Assign string static variable

    # .asciiz are null terminated arrays of characters
    msg: .asciiz "Thhe smalles value is: "
    newline: .asciiz "\n"

.ktext # space for the code that will be executed in kernel space
    # No clue what I should do here but ouke


.text # the actual code will start from here (functionality, flow, etc)

main:
    # Assig the values of the static variables to the registers

    # Set up the number-values registers
    lw $t0, num1
    lw $t1, num2
    lw $t2, num2

    # Set up the string-value registers
    la $s0, msg # load the pointer pointing to the base address of the string variable 'msg'
    la $s1, newline # same for the newline character

    # The function comp should compare all the values using slt and find the smalles value among all of them
    # Shoul store the smalles found value in the $t3 register

    # Assign an initial value for the 'smallest value'
    move $t3, $t0

    jal comp

    # jump to exit to terminate the program
    j exit

comp:
    # First assign a temp variable for the assignation of the logical comparision
    slt $t4, $t0, $t1 # test t0 < t1 (0 or 1 will be stored in t4)
    
    beqz $t4, print_all # so if the result o f t4 == 0, jump to print_all
    #else:
    
    # Assign the smalles found value
    move $t3, 

    slt $t4, 

    print_all:
        
    

exit:
    # set the return-type register to 10 for syscall 10 (exit program)
    li $v0, 10
    syscall
