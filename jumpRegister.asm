.data
    #for local variables

.text
.globl main


main:
    li $s0, 10
    li $s1, 11

    jal sumVars  #jump and link (to jump back to the caller, and use $ra "return address" the jal is needed, because it jumps to the label and saves/links the return address n $ra register)

    #now the flow should continue after jumping back from sumVars 1 time
    addi $s0, $s0, 10    # now the value of s0 should be the value of the sumVars (21) plus 10, so (31)

    #print the value of s0 again to verify the changes
    move $a0, $s0
    
    li $v0, 1   # load immediate value '1' to print an integer
    syscall

    j exit  # jump to the eit label to terminate the program

sumVars:
    add $s0, $s0, $s1   # now, register s0 should have the value 21

    move $a0, $s0

    li $v0, 1   # load '1' to the return-val register v0 to print out the value of the argument-register a0
    syscall

    jr $ra  # return to caller (main in this case)

exit:
    #terminate the program
    li $v0, 10
    syscall

