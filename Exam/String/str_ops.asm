.data # space for static variables
    
    # Assign some string variables
    str1: .asciiz "Hello " # .asciiz are for strings (null terminated arrays of chars) | 'Hello' is invalid, '' are for single char
    str2: .asciiz "Amigo"

    # Assign character variable | .byte is 8-bit (1 byte) so for small numbers or characters (whch is the same in ASCII)
    char1: .byte '\n'

.text # the actual code (functionality, flow) will start from here

main:
    la $t0, str1 # 'la' to load the pointer to the starting address of the string, as a str is an array of chars with \0
    la $t1, str2 # load the pointer pointint to the initial position of the base address
    
    # Print First string "Hello"
    move $a0, $t0 # move the value of t0 "Hello " into the argument-type register
    li $v0, 4 # load 4 into the return-type register to print a string 
    syscall

    # Same for the second string "Amigo"
    move $a0, $t1
    li $v0, 4
    syscall

    # Print the newline-character (stored as a char | byte)
    lb $t2, char1 # load byte char1 into $t2 temp-type register
    
    move $a0, $t2 # move the value of $t2 into the argument type register
    li $v0, 11 # load 11 into the reutnr-type register to print character
    syscall

    # jump to the 'exit' function (label) to terminate the program
    j exit

exit:
    # load 10 into $v0 return-type register for syscall 10 (terminat the program)
    li $v0, 10
    syscall
