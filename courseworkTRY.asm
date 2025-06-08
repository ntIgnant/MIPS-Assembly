.data
    # variables for the board
    grid_buff: .word 56    # Number of bytes to allocate | 7x7 (grid size) | (49 'characters' + 7 (newline chars)) * 1(bytes per char) = 56 BYTES total for the board
    border_char: .asciiz "#"    # character for the borders of the 'game-board'
    nline: .asciiz "\n"
    blank: .asciiz " "  # blank for the empty places of the game-board
    player: .asciiz "P" # character to represent the player
    reward: .asciiz "R" # character to represent the reward

.text
.globl main

main:
    # allocate memory for the game-board 7x7 = (49 + 7(for newline chars)) x 1(bytes) = 56 bytes
    lw $t0, grid_buff
    move $a0, $t0   # move the value of t0 (buffer size for the grid) to the argument-type register

    # Use sbrk syscall to request for dynamic memory allocation
    li $v0, 9
    syscall

    move $s0, $v0   # Store the dynamicaly allocated memory address in store-register s0
    # now, $s0 contains the BASE ADDRESS for the game-board 


make_board:
    # $s0 = DYNAMICALLY ALLOC BASE ADDRRS | 56 bytes TOTAL
    li $t0, 1   # load immediate value '0' for grid index   | $t0 = 1 (grid index)

    lb $t1, border_char # load byte of border_char "#" into the temp-register t1   | $t1 = "#"
    lb $t2, nline   # load byte of nline "\n" into the temp-register t2    | $t2 = "\n"

make_row:
    beq $t0, 7, new_row # if the index (t0) is equal to 7, jump to the 'new_row' function | otherwise continue 


    sb $t1, 0($s0)  # store byte = char("#") in the dynamically allocated base position

    # move to the next position of the grid (byte + 1 in memo)
    addi $s0, $s0, 1
    # increment the value of the index by 1 (index++) to go to the next grid index
    addi $t0, $t0, 1

    j make_row


new_row:
    sb $t2, 0($s0)  # store the newline character '/n' in the current location of the dynamically allocated address
    li $t0, 1   # reset the index value to 1 for the new row
    j make_row  # jump back to make_row function


exit:
    li $v0, 10 # load '10' termiante the program
    syscall
