.data
# Local variables
a: .word 2        # 'a' value
b: .word 1       # 'b' value

.text
.globl main

main:
    # Load values of 'a' and 'b' into $s0 and $s1
    lw $s0, a         # Load value of 'a' into $s0
    lw $s1, b         # Load value of 'b' into $s1

    # Compare 'a' and 'b' values using slt
    slt $t1, $s0, $s1 # $t1 = 1 if $s0 < $s1, otherwise $t1 = 0

    # Branch based on comparison result
    bne $t1, $zero, bgreater # If $t1 = 1, branch to 'bgreater'
    j agreater              # Otherwise, go to 'agreater'

bgreater:
    # Print the value of 'b'
    move $a0, $s1           # Move $s1 ('b') into $a0 for printing
    li $v0, 1               # Print integer syscall
    syscall
    j exit                  # Jump to program exit

agreater:
    # Print the value of 'a'
    move $a0, $s0           # Move $s0 ('a') into $a0 for printing
    li $v0, 1               # Print integer syscall
    syscall
    j exit                  # Jump to program exit

exit:
    # Exit the program
    li $v0, 10              # Exit syscall
    syscall
