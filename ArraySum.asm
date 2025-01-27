.data   # place for local variables (stored in stack)
array: .word 0, 1, 2, 3, 4  # array of 5 values


.text
.globl main

main:   # 'main' label
# main code goes here

# set the register values
la $s0, array   # load address of array into saved-register s0

#counter for the nubers of the array 
# to go over the memory, each memory block for a it, is 4 bytes, next_adrrss = base_addrss + (index * 4)????? wtf

#temp values:
li $t0, 0   #current sum of ints
li $t1, 1   #loop counter (like i in C...) counts from 1 to 5
li $t2, 5   #length of the array (5 elements)

loop:   # label for the for loop
bne $t1, $t2, increment

#else


increment:
addi $t1, 1 #increment the value of s1 by one (i++)

j loop  #jump back to loop
    
exit:   # exit label | code to exit the program
li $v0, 10  # set return-register 'v0' to value 10 t exit
syscall

