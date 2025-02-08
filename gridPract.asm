.data
    grid: .asciiz "#", "#", "#", "#", "\n",
    	"#", " ", " ", "#", "\n"
    	"#", " ", " ", "#", "\n"
    	"#", " ", " ", "#", "\n"
    	"#", "#", "#", "#", "\n"

.text
.globl main

main:
    la $a0, grid
    li $v0, 4   # lad '4' for the return-type register to print out a string
    syscall

    j exit



exit:
    li $v0, 10  # load '10' in return-type register to terminate the program
    syscall
