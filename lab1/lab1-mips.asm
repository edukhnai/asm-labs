 .data
num0: .word -2 # first number
num1: .word 27 # second number
num2: .word -1 #fird number
head1: .asciiz "number num0 is the biggest one \n"
head2: .asciiz "number num1 is the biggest one\n"
head3: .asciiz "number num2 is the biggest one \n"

.text
 li $t0, 0 # load immidiate zero to register $t0
 la $t1, num0 # load address of the first number to register $t1
 lw $t1, 0($t1) # load the first number to register $t1
 la $t2, num1 # load address of the second number to register $t2
 lw $t2, 0($t2) # load the second number to register $t2
 la $t3, num2
 lw $t3, 0($t3)
 li $t4, 0
 
 sub $t4, $t1, $t2
 bgtz $t4, L0
 bltz $t4, L1
 L0:
 sub $t4, $t1, $t3
 bgtz $t4, L2
 bltz $t4, L4
 L2:
 la $a0, head1
 j exit
 L4:
 la $a0, head3
 j exit
 L1:
 sub $t4, $t2, $t3
 bgtz $t4, L3
 bltz $t4, L4
 L3:
 la $a0, head2
 j exit
 exit:
 li $v0, 4
 syscall

