	.data
	# any static variables go here
	i: .word 0
    j: .word 4



	.text
    .globl main
	# your code goes here	# your comments go over here
	
    main:
        lw $s0, i   # value of variable i will be loaded in store-register t0
        lw $s1, j   # value of variable j will be loaded in store-register t1
	
        slt $t0, $s0, $s1   # The temp-register t0 will take '1' as value if s0 < s1

        # this is like the 'if statement'
        #if...
        beq $t0, $zero, else # If the temp-register t0 is branch-equal to register zero ($zero == 0), jump to else label
        
        addi $s0, $s0, 1    #Set saved register to saved-register0 PLUS 1 immediate value ($s0 + 1(imm))
        
        else:   #else label to jump to if the if statement is 'false'
        move $a0, $s0   # move the value of s0 to a0 (argumen type register)
        li $v0, 1           # Syscall code for printing an integer
        syscall
        

	li	$v0, 10 	#] exit
	syscall			#]
	
