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

    li $t4, 0   # row counter

    # Load '#' character (byte)
    li $t3, '#'  

build_grid:
    # Store '#' in the current cell of the array
    sb $t3, 0($t0)  
    
build_grid_row:
    # Move to the next cell
    addi $t0, $t0, 1  
    addi $t1, $t1, 1  
    
    # Loop until 7 characters are stored
    blt $t1, $t2, build_grid_row  

    # add +1 to the row counter (should be 7 rows at the end)
    addi $t4, $t4 1

    # reset the index for the newxt row
    li $t1, 0

    # berify if there are rows missing
    bneq $t4, $t2, build_grid_row   # while t4(row counter) not equal to t2(total rows), jump to build_grid_row function
    # else:
    
    # if the program reaches this point, it means that all the 7 rows had been filled (7x7 grid)
    # reset the base address adn the index of the array for the printing 
    li $t0, 0
    la $t0, grid    # load the base address of the array into the temp-register t0

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

    # at this point, one row should have been printed

    addi $t4, $t4, 1    # add +1 to temp-register t4(counter for number of rows)

    # check if there are rows missing
    bneq $t4, $t2, print_row    # while t4(row counter) not equal to t2(total rows), jump to print_row function
    #else:

    j exit  

exit:
    li $v0, 10  
    syscall  
