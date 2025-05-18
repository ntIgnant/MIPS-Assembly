.data

# .asciiz values are char arrays (NULL TERMINATED) '\0'
res_msg: .asciiz "Result of OR operation (bitwise): " # message to print before the result

# word values are 32-bits long (4 bytes) | integers, floating points, long numbers
val1: .word 10
val2: .word 11

char1: .byte '?' # .byte are values 8-bits long (1 byte) | normally for single characters or small ints (e.g ascii vals for chars)
char2: .byte '!'
char3: .byte '\n' # newline character

.text # .text is the 'start' of the instruction segment (actuall functionality of the program)


# Here are all the functions (labels) | actual code and instructions
main:
    # okay, here I'll use the OR logical operator (bitwise) to compare two numbers (bit by bit)
    lw $s0, val1 # load the value of val1 into s0 register
    lw $s1, val2 # load the value of val2 into s1 register

    # Compare both values of the registers with OR logic operator (bitwise)
    or $s2, $s0, $s1

    # This will be Like:
    
    
    #00000000 00000000 00000000 00001010 | value of 10 in 32-bit representation
    #OR (logic comp bit-per-bit)
    #00000000 00000000 00000000 00001011 | value of 11 in 32-bit representation
    #-------------------------------------
    #00000000 00000000 00000000 00001011 | the result is 11 (DECIMAL)

    #So, that result will be stored in $s2 register

    
    jal print_msg # jump and link to print_res to print the int value
    jal print_res
    jal print_nl
    

    j exit # jump without linking to 'exit' to terminate the program

print_msg:
    la $t0, res_msg # load the address of the message 'Result: ' into $t0 temp-register

    # First, print the first message 'Result: '
    move $a0, $t0
    li $v0, 4 # load 4 into the return-type register (to print a string)
    syscall

    # return to the caller (main)
    jr $ra

print_nl:
    lb $t1, char3 # load the value of the newlinecharacter (assigned as char, not str)
    
    # print the character
    move $a0, $t1 # move (copy) the content of $t1 into $a0 (argument-type register)
    li $v0, 11 # load 11 int the return-type register (to print a char)
    syscall

    # Return to the caller (main)
    jr $ra
   

print_res:
    move $a0, $s2 # move the result of $s2 (11 decimal) to $a0 (argument-type register)
    
    li $v0, 1 # load '1' to $v0 (return-type register) for syscall 1 (print integer)
    syscall

    # Go back to the caller (main)
    jr $ra # jump back to the caller || 'jump to address stored in register (actuall return-stored address)'

exit:
    li $v0, 10 # load '10' in the return type register for syscall 10 (exit code)
    syscall
