 .data
aa: .float -9906.24
bb: .float 12.1
dd: .float 2.0
Sum: .float 0.0
head_Sum: .asciiz "\n |A+B|/2 =\0"

.text
 addi $sp, $sp, -16 # allocating space for four elements in stack
 
 lwc1 $f1, aa # load to Coprocessor 1
 mfc1 $a0, $f1 # define argument aa, move from Coprocessor 1
 sw $a0,12($sp) # push aa onto stack
 lwc1 $f1, bb
 mfc1 $a0, $f1
 sw $a0,8($sp) # push bb onto stask
 lwc1 $f1, dd
 mfc1 $a0, $f1
 sw $a0, 4($sp) # push dd onto stask
 lwc1 $f1, Sum
 mfc1 $a0, $f1
 sw $a0, 0($sp) # push Sum onto stack
 
 jal abs_sum_half # 
 la $a0, head_Sum # load address of head_Sum
 li $v0, 4 # specify Print String service
 syscall # print head_Sunm
 li $v0, 2 # specify Print Float service
 syscall # print Sum number
 j stop_prog
 
abs_sum_half:
 lwc1 $f1, 12($sp) # load number aa from memory in register $f1
 lwc1 $f2, 8($sp) # load number bb from memory in register $f2
 lwc1 $f3, 4($sp) # load number dd from memory in register $f3
 lwc1 $f12, 0($sp) # load number Sum from memory in register $f4
 add.s $f12, $f1, $f2
 abs.s $f12, $f12
 div.s $f12, $f12, $f3
 addi $sp, $sp, 16
 jr $ra

stop_prog:
 nop
 
