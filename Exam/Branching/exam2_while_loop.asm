.data # data space to assign static variables
    num1: .word 0 # assign static variable num1 = 0 (.word = 4-byte variable)
    num2: .word 4

    msg: .asciiz "hello world\n" # assign static varibale msg = "hello world\n" | .asciiz vars are for null termanted arrys of chars

.ktext # this shoudl be the space for 'kernel text' which is code that will execute in kernel space (privileged exec)
    # I ain't gonna fuck with da kernel no way

.text # the actual code starts from here (functionality, flow, etc)

main:
    # Assign the static variable values ot the registers
    lw $t0, num1 # load num1 val to register t0
    
    la $s0, msg # load the pointer pointing to the base address of the string 'msg'
    
    # assing a variable


    # Jump and link to the loop
    jal loop # jump adn link is not necesary in this case but oke

    # Jump to exit to terminate the program
    j exit

loop:

    # like while 't0' < 4
    beq $t0, 4, exit # if the number is equal to 4, jump to exit
    # else:

    move $a0, $s0 # copy the value of s0 into the argument-typer register

    li $v0, 4 # load the value 4 into the return-type register for syscall 4 (print string)
    syscall

    # Increment 1 to the number in $t0
    addi $t0, $t0, 1 # t0 += 1

    # jumpt back to continue the loop
    j loop


exit:
    li $v0, 10 # laod 10 to the return-type register for syscall 10 (terminate the program)
    syscall


