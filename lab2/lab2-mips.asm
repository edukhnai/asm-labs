 .data
  arr: .word -1 -2 -3 -4 1 2 0 4 2000 4096 65535 0 # "array" of 12 words separated by spaces
# arr: .word 0 0 0 0 0 0 0 0 0 0 0 0
 size: .word 12 # size of "array"
 head: .asciiz "Diff: "
 all_eq_msg: .asciiz "All elements are equal"
.text
 addi $s1, $0, 0 # $s1 = i = 0
 la $t0, arr # load address of array  initial index [i]
 la $s2, arr # $s2 = min = 0
 lw $s2, 0($s2) # $s2 = arr[0]
 la $s3, arr # $s3 = max = 0
 lw $s3, 0($s3) # s3 = arr[0]
 la $t5, size # load address of size variable
 lw $t5, 0($t5) # load array size in the same register
loop: 
 slt $t1, $s1, $t5 # if (i < arr.size) $t1 = 1 else $t1 = 0
 beq $t1, $0, done # if $t1 = 0 - end of for loop has been reached
 sll $t1, $s1, 2 # $t1 = i * 4, byte offset
 add $t1, $t1, $t0 # address of arr[i]
 lw $t2, 0($t1) # $t2 = arr[i]
 addi $s1, $s1, 1
 bgt $t2, $s3, upd_max
 blt $t2, $s2, upd_min
 j loop
upd_max:
 addi $s3, $t2, 0
 j loop
upd_min:
 addi $s2, $t2, 0
 j loop
done:
 beq $s2, $s3, all_eq
 sub $t3, $s3, $s2
 li  $v0, 4
 la  $a0, head
 syscall
 li  $v0, 1
 move $a0, $t3
 syscall
 j exit
all_eq:
 la $a0, all_eq_msg # load address of print heading
 li $v0, 4 # specify Print String service
 syscall # print heading
exit: 

