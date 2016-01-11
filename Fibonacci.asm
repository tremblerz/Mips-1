.data
	ans: .asciiz "The answer is : "
	n: .word 36
	fib1: .word 1
.text
	la $t0, n
	lw $t0, 0($t0)
	addi $t0, $t0, -1 		#we want to find the nth fib number
	la $t1, fib1
	lw $t1, 0($t1)			#contains 1st fib num
	add $t2, $zero, $t1		#contains 2nd fib num
	
loop:
	beq $t0, $t4, exit
	addi $t4, $t4, 1
	add $t3, $t1, $t2
	add $t1, $t2, $zero
	add $t2, $t3, $zero
	j loop
	
	
exit:
	li $v0, 4			#print answer text
	la $a0, ans
	syscall
	
	li $v0, 1			#print the answer
	la $a0, ($t2)
	syscall
	
	li $v0, 10			#exit
	syscall
