lw $1 $0 65408
sqrt $30 $1
addi $29 $0 0
addi $30 $30 -10
sra $28 $30 31
bne $28 $0 2
addi $29 $29 1
j 3
addi $30 $30 10
sll $30 $30 2
lw $27 $30 0
sw $27 $0 65280
sll $29 $29 2
lw $27 $29 0
sw $27 $0 65296
j 0