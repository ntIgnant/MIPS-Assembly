.data # variable segment

    # initialize a static array with a fixed buffersize

    # Initialize array for 4 integers
    int_array: .space 16 # .space reserves memory in bytes, so for 4 ints -> 4 * (4bytes) = 16 bytes of memo


.text # Here starts the actual code segment (functionality, flow, etc)

main:

    # Assign values to the array (manual way)
    # Load the pointer to the base address of the initialized array
    la $s0, int_array

    li $t0, 0 # load immediate value '0' to the temp-type register
    sw $t0, 0($s0) # store the 'word | +4bytes value' in the array address at '0 shift / 0 offset' possition

    li $t1, 1 # load immediate value 1 into the temp-type register
    sw $t1, 4($s0) # store the value in the array address at '4 shift / 4 offset' possition bc each int is 4 bytes

    li $t2, 2 # load immediate value 2 to temp-type register
    sw $t2, 8($s0) # store the value in the array address ait '8 shift / 8 offset' possition

    li $t3, 3 # load immedate value into temp-type register
    sw $t3, 12($s0) # store the value into the array address at '12 shift / 12 offset' possition

    # Create an index (counter) for the loop to use it in 'print_array'
    li $t4, 0 # If this reaches 4, then the function will jump back to main

    jal print_array # jump and link to print_array function
    j exit # jump to exit function to terminate the program

print_array:
    la $t6, int_array     # pointer to start of array
    li $t7, 0             # loop counter

print_loop:
    lw $a0, 0($t6)        # load current int value
    li $v0, 1
    syscall

    # print newline
    li $v0, 11
    li $a0, 10
    syscall

    addi $t6, $t6, 4      # move pointer to next int (no sll needed)
    addi $t7, $t7, 1      # increment counter
    blt  $t7, 4, print_loop

    jr $ra


exit:
    # Load 10 into the return-type register for syscall 10 (terminate the program)
    li $v0, 10
    syscall
