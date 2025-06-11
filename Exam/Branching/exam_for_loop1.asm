.data # space for the static variables
msg: .asciiz "Done\n" # ascii variables are zero terminated strings

num1: .word 10 # .word variables are 4 bytes each (almost sure ngl)

.ktext # space for the executable code (for kernel space)

.text # space for the executable code with registers

# load the message into a register
la $s0, msg # load the address because it is like an 'array' actually
lw $s1, num1 # load the word (number) into register s1

li $t0, 10
li $t1, 100

jal loop
j exit

loop:

# print the number (10, 20, 30, ...)

move $a0, $t0
li $v0, 1 # load 1 t the return type register to print an int
syscall

addi $t0, $t0, 10 # it will be adding up 10, so 10, 20, 30, ... till 100

blt $t0, $t1, loop # wile t0 < t1 (100), jump to loop
#else:

jr $ra # jump back to the register return address (caller main)

exit:
li $v0, 10 # load 10 to the return type regsyer to syscall 10 (terminate program)
syscall
