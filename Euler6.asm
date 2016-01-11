.data
	ans: .asciiz "The answer is: "

.text
	add $t0, $zero, 1		# counter variable
					# $t7 will be the answer
	
loop:
	mult $t0, $t0
	mflo $t1
	add $t7, $t7, $t1
	add $t2, $t2, $t0
	
	
	beq $t0, 100, exit
	add $t0, $t0, 1	
	j loop	
	
exit:
	mult $t2, $t2
	mflo $t2
	sub $t7, $t2, $t7
	
	li $v0, 4
	la $a0, ans
	syscall
	
	li $v0, 1
	la $a0, 0($t7)
	syscall
	
	li $v0, 10
	syscall
