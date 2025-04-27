	.data
	# any static variables go here
	n_num: .word 10	# assign the value '10' to the variable 'n_num'
	counter: .word 1	# assign the value '1' to the counter (count starting from 1)
	
	.text
	.globl main
	
	
	main:
	# your code goes here	# your comments go over here
	lw $s0, n_num	#load the value of n_num into store-register s0
	lw $s1, counter	#load the value of counter to the store-register s1
	
	loop:
	#if s1 < s0, then set t0 to 1, else set t0 to 0
	slt $t0, $s1, $s0		#'c-like...' if(s1 < s0,){t0 = 1}else{t0=1}
	beq $t0, $zero, exit	# if t0 == 0, (meaning that s1 >= s0), then jump to exit:
	
	#print the current value of the counter 's1'
	move $a0, $s1
	li $v0, 1
	syscall
	
	addi $s1, $s1, 1	# add immediate value '1' to the register 'counter' s1
	
	j loop	# if this point is reached, jump back to loop to repeat the process
	
	exit:	#Exit branch/label
	li	$v0, 10 	#] exit
	syscall		#]
	
