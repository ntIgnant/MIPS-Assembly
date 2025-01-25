##  example code demonstrating C-style 'ifs':
## if (i < j) {f = g + h;} else {f = g - h;} 


	.text
	li   $s0, 1        	# f = 1
	li   $s1, 2		# g = 2
	li   $s2, 3		# h = 3
	li   $s3, 4             # i = 4
	li   $s4, 4		# j = 5

		
	
	slt $t0, $s3, $s4         # test i < j
	beq $t0, $zero, Else      # if false, goto Else
	add $s0, $s1, $s2         # f = g + h
	j Endif                   # goto Endif
Else: 
	sub $s0, $s1, $s2         # f = g - h 
Endif: 


	or $a0, $s0, $zero 	#] 
	li $v0, 1		#] print f
	syscall			#]
	
	li $v0, 10		#] exit
	syscall			#]
