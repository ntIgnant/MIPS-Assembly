.data # space for the static variables
msg: .asciiz "Done\n" # ascii variables are zero terminated strings

num1: .word 10 # .word variables are 4 bytes each (almost sure ngl)

.ktext # space for the executable code (for kernel space)

.text # space for the executable code with registers

# load the message into a register
la $s0, msg # load the address because it is like an 'array' actually
lw $s1, num1 # load the word (number) into register s1

jal loop
j exit

loop:


exit:


