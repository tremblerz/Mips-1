.data
	ans: .asciiz "The sum of multiples of 3 or 5 from 1 to 1000 is: "
	three: .word 3
	five: .word 5
	max: .word 0
	newline: .asciiz "\n"
.text
	# $t0 will contain the index
	# $t1 will contain the answer
	# $t2 will contain the value of n%3
	# $t3 will contain the value of n%4
	# $t4 will contain 3
	# $t5 will contiain 5
	# $t6 will contain 1000-1
	
	addi $t4, $t4, 3
	addi $t5, $t5, 5
	addi $t6, $t6, 999
	
loop:
	beq $t0, $t6, exit
	addi $t0, $t0, 1
	div $t0, $t4
	mfhi $t2
	beq $t2, $zero, add3
	div $t0, $t5
	mfhi $t3
	beq $t3, $zero, add5
	j loop
	
	
add3:
	add $t1, $t1, $t0	
	j loop
	
add5:
	add $t1, $t1, $t0
	j loop
		
	
exit:
	li $v0, 4		#print answer text
	la $a0, ans
	syscall
	
	li $v0, 1		#print answer
	la $a0, ($t1)
	syscall
	
	li $v0, 10		#exit
	syscall
