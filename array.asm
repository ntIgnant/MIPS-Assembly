.data
    num_array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9   # Array of 10 integers
    newline: .asciiz "\n"

.text
.globl main

main:
    la $t0, num_array  # Load base address of array
    li $t1, 0          # Initialize index (counter)
    li $t2, 10         # Total elements in the array

print_loop:
    bge $t1, $t2, exit  # If index >= 10, exit

    lw $a0, 0($t0)      # Load array element into $a0
    li $v0, 1           # Print integer syscall
    syscall

    la $a0, newline     # Print newline
    li $v0, 4
    syscall

    addi $t0, $t0, 4    # Move to next element (next 4 bytes)
    addi $t1, $t1, 1    # Increment index (count elements)
    j print_loop        # Repeat

exit:
    li $v0, 10          # Exit syscall
    syscall
