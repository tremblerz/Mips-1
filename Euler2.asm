.data
	ans: .asciiz "The answer is : "
	fib1: .word 1
.text
	#la $t0, n
	#lw $t0, 0($t0)
	#addi $t0, $t0, -1 		#we want to find the 10th fib number
	la $t1, fib1
	lw $t1, 0($t1)			#contains 1st fib num
	add $t2, $zero, $t1		#contains 2nd fib num
	
	add $t0, $zero, 4000000
	
	add $t7, $zero, 2
	
loop:
	add $t3, $t1, $t2
	add $t1, $t2, $zero
	add $t2, $t3, $zero
	bgt $t2, $t0, exit
	div $t2, $t7
	mfhi $t4
	beq $t4, $zero, even
	j loop

even:
	add $t5, $t5, $t2
	j loop	
	
exit:
	li $v0, 4			#print answer text
	la $a0, ans
	syscall
	
	li $v0, 1			#print the answer
	la $a0, ($t5)
	syscall
	
	li $v0, 10			#exit
	syscall
	
