.data
# Declare static variables
num1: .word 5
num2: .word 10

.text
.globl main

main:
    lw $s0, num1          # Load value of num1 into $s0
    lw $s1, num2          # Load value of num2 into $s1

    add $s0, $s0, $s1     # Add num1 and num2, store result in $s0

    move $a0, $s0         # Move the result (sum) to $a0 for printing
    li $v0, 1             # Set $v0 to 1 for the print integer syscall
    syscall               # Print the integer in $a0

    li $v0, 10            # Exit syscall
    syscall

