# a library for a linked list in MIPS

.data
    head: .word 0

.text


# each node of LinkedList is two words allocated by sbrk (sbrk is the operator fo the heap)
# first word contains the data
# second word contains the address of next node

new_node: # takes as argument a new value we want to add

    add $t0, $a0, $zero

    # sbrk (for memory allocation in heap) to store two words in the heap (for the value and the address to the next node)
    li $v0, 9
    li $a0, 8 
    syscall
    
    # store old head value in second word from sbrk
    lw $t1, head
    sw $t1, 4($v0)

    # head should contain the address of the new memory block (i.e the return value of sbrk)
    sw $v0, head

    # save $a0 in the first word returned by sbrk
    sw $t0, 0($v0)
    jr $ra

