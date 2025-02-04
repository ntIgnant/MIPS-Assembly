.data
    arr: .word 1, 2, 3, 4, 5    # arra of 5 integers (C like, arr = [1, 2, 3, 4, 5])
    size: .word 5   # array lenght
    sum: .word 0    # initial sum of the elements

.text

.globl main

main:
    lw $s0, arr # load the information of arr in the saved register $s0, now $s0 = [1, 2, 3, 4, 5]
    lw $s1, size # load the information/value of size into s1 register
    lw $s3, sum

    # to go over each value of the array, fist we need to load the base of the array and then add (index * 4) to that base
    
    # Address = Base Address + (index * 4)  ('* 4' because each value in the array 'each int' is 4 bytes of memory)

    jal doublarray

    # code after jump back to mai...

    j exit  # jump to exit for code termination


doublrray:
    # load BASE address
    la $t0, $s1
    li $t1, 1   # create a 'counter' for the for loop

    #loop starts
    bge $t1, $s1, end_loop  # if counter >= arr_size, end_loop

    #else...
    addi $s3, $s3,


    
end_loop:
    # here load the value of the final array sum to be printed


exit:
    li $v0, 10
    syscall
