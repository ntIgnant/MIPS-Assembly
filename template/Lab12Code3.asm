	.data
	# any static variables go here
	j: .word 4
	i: .word 0
			
	.text
	.globl main
	# your code goes here	# your comments go over here
	
	lw $s0, j		# Load word (value) of j to the store-register s0
	lw $s1, i		# Load word (value) of i to the temp-register t0
	
	# This loop will go over until s1 is not less than s0 (C-like 'int i = 0; i < j; i++')
	loop:
    	bgt $s0,$s1,exit	# will compare 'bigger than for the s0 and t0', else, will jump to label exit
    	add $s0,$s0,$s1	# Will add (+1 immediate val) to store-register s0
    	j loop	# will jump back to the label 'loop'

	exit:
	move $a0, $s1	#'move/set' the value of s1 register to the argument-type register a0
	li 
	
	
	li	$v0, 10 	#] exit
	syscall		#]
	
