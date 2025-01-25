	.data
msg:	.asciiz "hello\n"	# something to print out
	.text
	
	
	beq $zero, $zero, print	# branch if 0 == 0
	j end			# should never reach this
print:
	li $v0, 4		#]
	la $a0, msg		#] print "hello\n"
	syscall			#]
end:	
	li $v0, 10		#] exit
	syscall			#]
 