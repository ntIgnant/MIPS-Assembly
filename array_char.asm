.data

    # -Local Variables for the Game-
    # I'll probably run out of registers, but for now it's ok, othwerise I'll just harcode the load-immediate values
    hash_char: .asciiz "#"
    newline_char: .asciiz "\n"
    space_char: .asciiz " "

    # save space for the array (7x7 bytes)
    grid: .space 49 # save 49 bytes of memory for the array/grid

.text
.globl main


main:
    # load the base address of the grid into a temp-register
    la $t0, grid    # now, t0 has the base address of the array

    li $t1, 0   # load '0' in temp-type register | this will work as the array index
    li $t2, 7   # load '7' in  temp-type register | this will work as the total number of rows (7) and the number of values per row

    li $t3, hash_char   # load the "#" character into t3 temp-register


build_grid_row:
    sw $t3, 0($t1)  # store the value '#' inside the iterable location of the array memory address

    addi $t1, $t1, 1    # add +1 to t1 (array index) to go to the next cell at memory level (+1 byte)
    
    bne $t1, $t2, build_grid_row    # while t1(array index) not equal to t2(number of characters per row), jump to build_grid_row
    #else:

    # reset the value of the index to 0 for the print function to start from 0 index
    li $t1, 0   # t1(array index) re-set to 0

    j print_row # jump to print_row

print_row:
    
    lw $t4, 0($t1)  # load the value of the array address at position (t1)
    
    move $a0, $t4   # move the value of t4('#') into an argument-type register
    li $v0, 1   # load '1' into return-type register to print out the value of the array
    sysycall

    bne $t1, $t2, print_row # while t1(array index) not equal to t2(number of characters per row), jump to print_row
    #else:

    j exit  # jumpt to exit function

exit:
    li $v0, 10
    syscall
