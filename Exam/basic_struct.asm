.data


.text
  

main:

exit:
    li $v0, 10 // Load '10' into the return-type register
    syscall // Exit the program with syscall 10

