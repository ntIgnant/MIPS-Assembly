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
	li $t1, 6 # load immediate value | this will be the max value to compare the beq to

	jal loop # jump and link to the label 'loop'
	j exit # jump to 'exit'

loop:
	# load the value of the current number (stored in t0 register)
	move $a0, $t0 # move the value of t0 into the the argument type register
	
	# load 1 to the regurn type register for syscall 1 (print int)
	li $v0, 1
	syscall

	# add '+1' to the result of t0
	addi $t0, $t0, 1 # add immediate '1' to the register t0
	
	# verify the value of t0, if it is equal to '6', then brek the loop (because 1 ... 5 already printed)
	blt $t0, $t1, loop # while t0 < t1, jump to loop
	#else:

	# print the message
	move $a0, $s0
	
	# load 4 to the return type register for syscall 4
	li $v0, 4
	syscall

	# jump bac to the caller 'main'
	jr $ra # jump to the return address 

exit:
	li $v0, 10 # load '10' into the return type register the value 10 for systcall 10 (exit)
	syscall
