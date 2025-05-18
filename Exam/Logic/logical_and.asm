.data
    num1: .word 10 # Assign '10' to num1 as (byte) | .word variables are (4-bytes) long (32 bits) like ints in C
    num2: .word 3 # Assign '3' to num2 as (byte) type variable | .word variables are  (4-bytes) long, like ints in C

.text

main:
    lw $s0, num1 # 'load the word (val) of num1 into $s0 register'
    lw $s1, num2 # 'load the word (val) of num2 into $s1 register'

    # Logical comparision - AND
    and $s2, $s0, $s1 # So this will store the 0 or 1 bit (true/false for the AND op)

    move $a0, $s2
    
    # jump and link to the other functions (labels)
    jal print_logical_res
    jal exit

print_logical_res:
    li $v0, 1 # load '1' to the return-type register to print and integer
    syscall # This syscall will me in 'mode' print integer, and will take an argument ($a0), which is the int to print

    # Return to the caller
    jr $ra # to go back to main

exit:
    li $v0, 10 # Load 10 to the return-type register (for exit syscall)
    syscall # Syscall 10 (with return-type register = 10)
    
    # Don't jump back to main cuz it finished
