# Data segment, contains all the static variables
.data
    num1: .word 10 # static variable num1 = 10 (.word = 4bytes of memo)
    num2: .word 30 # static variable num2 = 30 (.word = 4bytes of memo)


.text # Text segment, the actual code will start fom here (functionality, flow, etc)

main:

    lw $t1, num1 # load the value of num1 into the temp-type register t1
    lw $t2, num2 # load the value of num2 into the temp-type register t2

    # SLT - set less than
    # slt $s0, $t1, $t2 | this is like: set 1 to s0 if t1 < t2, set 0 otherwise | like true false statement in s0

    slt $s0, $t1, $t2

    move $a0, $s0 # move the value of s0 to the argument-type register a0

    # load 1 to return-type register for syscall 1 (print integer)
    li $v0, 1
    syscall

    # Jump to exit to terminate the program
    j exit

exit:
    li $v0, 10 # load 10 to the return-type register for syscall 10 to terminate the program
    syscall
