	.data
	.text
		
	
	li 	$s0, 1		# f = 1
	li 	$s1, 2		# g = 2
	li 	$s2, 3		# h = 3
	li 	$s3, 4    	# i = 4
	li 	$s4, 5    	# j = 5


	beq 	$s3, $s4, L1	# if (i == j) goto L1
	add 	$s0, $s1, $s2	# f = g + h
L1:	sub 	$s0, $s0, $s3	# f = f - i

	or	$a0, $zero, $s0 #] 
	li 	$v0, 1 		#] print $s0
	syscall			#]
	
	li 	$v0, 10		#]
	syscall			#] exit
	