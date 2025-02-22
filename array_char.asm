.data
    # Characters
    hash_char: .asciiz "#"  
    newline_char: .asciiz "\n"
    
    # Grid (7x7 bytes)
    grid: .space 49  

.text
.globl main

main:
    # Load the base address of the grid
    la $t0, grid  # $t0 holds base address

    li $t1, 0     # Index counter
    li $t2, 7     # Number of characters per row

    # Load '#' character (byte)
    li $t3, '#'  

build_grid_row:
    # Store '#' in the current cell (1 byte)
    sb $t3, 0($t0)  
    
    # Move to the next cell
    addi $t0, $t0, 1  
    addi $t1, $t1, 1  
    
    # Loop until 7 characters are stored
    blt $t1, $t2, build_grid_row  

    # Reset index for printing
    li $t1, 0  
    la $t0, grid  # Reset base address

print_row:
    # Load character from grid
    lb $a0, 0($t0)  

    # Print character
    li $v0, 11  
    syscall  

    # Move to the next byte
    addi $t0, $t0, 1  
    addi $t1, $t1, 1  
    
    # Loop until we print 7 characters
    blt $t1, $t2, print_row  

    # Print newline
    li $a0, '\n'  
    li $v0, 11  
    syscall  

    j exit  

exit:
    li $v0, 10  
    syscall  