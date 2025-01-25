##  example code demonstrating C-style 'for' loop:
## for (i = 0; i < j; i++) { f++; }


	.text
	li   $s2, 0        	# f = 0
	li   $s4, 4		# j = 4
	
	# init stmt
	li   $s3, 0             # i = 0
Loop:				# i < j
	# cond:
	slt  $t0, $s3, $s4   	# test i < j
	beq  $t0, $zero, Exit   # if false, goto Exit

	# loop stmt	
	addi $s2, $s2, 1        # f = f + 1

End:	# end stmt
	addi $s3, $s3, 1        # i = i + 1
	j Loop                  # loop
Exit:

	or $a0, $s2, $zero 	#] 
	li $v0, 1		#] print f
	syscall			#]
	
	li $v0, 10		#] exit
	syscall			#]
