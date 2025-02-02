.data
    num1: .word 11       # First number
    num2: .word 33       # Second number

.text
.globl main

main:
    # Load num1 and num2 into $s0 and $s1
    lw $s0, num1
    lw $s1, num2

    # Call the sum function
    jal sum

    # Exit the program
    j exit

sum:
    # Save $ra to the stack (to return to main)
    addi $sp, $sp, -4    # Allocate 4 bytes on the stack
    sw $ra, 0($sp)       # Save $ra to the stack

    # Add $s0 and $s1, store result in $t0
    add $t0, $s0, $s1    # $t0 = $s0 + $s1 (11 + 33 = 44)

    # Print the result of the sum
    move $a0, $t0        # Move the result to $a0 for printing
    li $v0, 1            # Syscall for print integer
    syscall

    # Call the mult function with the result of the sum
    move $a0, $t0        # Pass the result of the sum to $a0
    jal mult             # Call mult function

    # Restore $ra from the stack and return to main
    lw $ra, 0($sp)       # Restore $ra from the stack
    addi $sp, $sp, 4     # Deallocate 4 bytes from the stack

    jr $ra               # Return to main

mult:
    # Multiply $a0 by itself, store result in $v0
    mul $v0, $a0, $a0    # $v0 = $a0 * $a0 (44 * 44 = 1936)

    # Print the result of the multiplication
    move $a0, $v0        # Move the result to $a0 for printing
    li $v0, 1            # Syscall for print integer
    syscall

    jr $ra               # Return to sum

exit:
    # Exit the program
    li $v0, 10           # Syscall for exit
    syscall