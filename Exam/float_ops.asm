.data # space for (static) variables
    int1: .word 30 # word variable = 32 bit long (4 bytes)
    int2: .word 11 # another static variable | .word = 32 bit long (4 bytes)

# Assign floating points | 32 bit long (4 bytes)
    float1: .float 3.987
    float2: .float 11.8783
    
.text # actuall codestarts here | functionality and control flow

main:
    # Load the float points into registers with 'l.s' (load single precission point)

    l.s $f0, float1 # load the value of float1 into the FLOAT-TYPE register $f0 | for IEEE754 format
    l.s $f1, float2 # load the value of float2 into the FLOAT-TYPE register $f1 | for IEEE754 format

    # Use 'add.s' to perform addition for floating points single precission
    add.s $f2, $f0, $f1 # store the result of float1 + float2 in float-type register $f2

    # Assign the value of the float sum into the argument-type register $a0
    
    # The way of 'moving' flating points is with (mov.s -> move single precission point) or (mov.d -> move double precision point)
    # mov.s -> floats and mov.d -> double basically

    # To print floating points (float or double), the syscall will take as argument the value in ($f12 for float) or ($f13 for double)
    mov.s $f12, $f2 # move single precission point (the flot result) to the argument-type register $a0

    # load '2' into the return-type register for syscall 2 (print single precission flting point)
    li $v0, 2
    syscall

    j exit # jump to exit to terminate the program



exit:
    li $v0, 10 # load 10 to the return-type register for syscall 10 (terminate program)
    syscall

