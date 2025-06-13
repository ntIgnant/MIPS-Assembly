.data #space for the local static variables
	msg: .asciiz "DONE!\n"

.ktext # space for the code tthat will be executed in kernel space

.globl main # space for 'globaly visible' functions/lables, used when working with multiple files (link needed)
.text # space for the code that will be executed (functionality, flow, etc)

main:
	# laod the static variables into registers
	la $s0, msg # load the address of the message into the store type registers s0

	# set up the register values before enter to the loop
	li $t0, 1 # load the immediate value '1' into the register s0
	

	jal loop # jump and link to the label 'loop'
	j exit # jump to 'exit'

loop:

exit:
	li $v0, 10 # load '10' into the return type register the value 10 for systcall 10 (exit)
	syscall
