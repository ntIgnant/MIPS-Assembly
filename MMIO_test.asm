.data

.text
.globl main

main:
    j loop

loop:
    # get the character
    li $v0, 12  # load '12' in the return-type register to read a character from the user
    syscall
    move $t0, $v0   # store the return-value in t0 temp register
    addiu $a0, $v0, 1  # (addiu "add unsigned") $a0 gets the next char
    
    li $v0, 11  # load '11' to print out a character
    syscall
    
    j loop

exit:
    li $v0, 10
    syscall
