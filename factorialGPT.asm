.data
    arr:  .word 1, 2, 3, 4, 5   # Array of 5 integers
    size: .word 5               # Array length
    sum:  .word 0               # Variable to store the sum

.text
.globl main

main:
    la $s0, arr    # Load base address of array into $s0
    lw $s1, size   # Load size of array into $s1
    li $s3, 0      # Initialize sum to 0

    jal doublearray  # Call function to double array values

    # Print final sum
    move $a0, $s3   # Load sum value into $a0
    li $v0, 1       # Syscall for print integer
    syscall

    j exit          # Jump to exit

doublearray:
    li $t1, 0       # Counter i = 0 (index)

loop:
    bge $t1, $s1, end_loop  # If i >= size, exit loop

    # Compute address: Base + (i * 4)
    sll $t2, $t1, 2         # Multiply i by 4 (shift left)
    add $t3, $s0, $t2       # Address = base + offset

    # Load current element from array
    lw $t4, 0($t3)          # $t4 = arr[i]

    # Double the value
    add $t4, $t4, $t4       # arr[i] = arr[i] * 2

    # Store updated value back in array
    sw $t4, 0($t3)          # Store new value in memory

    # Add to sum
    add $s3, $s3, $t4       # sum += arr[i]

    # Increment counter i
    addi $t1, $t1, 1        # i++

    j loop                  # Repeat loop

end_loop:
    jr $ra                  # Return to main

exit:
    li $v0, 10              # Exit syscall
    syscall
