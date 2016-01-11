.data
	prompt1: .asciiz "Enter number 1: "
	prompt2: .asciiz "Enter number 2: "
	answer:   .asciiz "The answer is: "
.text
	li $v0, 4		#print prompt1
	la $a0, prompt1
	syscall
	
	li $v0, 5		#get input 1
	syscall
	move $t0, $v0
	
	li $v0, 4		#print prompt2
	la $a0, prompt2
	syscall
	
	li $v0, 5		#get input 2
	syscall
	move $t1, $v0
	
	addi $t6, $zero, 2
	addi $t5, $zero, 1
	
	#t3 will contain our answer
	
	beq $t1, $zero, exit
	beq $t0, $zero, exit
	
	add $t3, $zero, $t0
	
loop:
	beq $t1, $t5, exit
	add $t3, $t0, $t0
	div $t1, $t6
	mflo $t1
	mfhi $t4
	beq $t4, $zero, first
	add $t7, $t7, $t0
	
first:
	add $t0, $zero, $t3
	j loop

exit:
	add $t3, $t3, $t7
	
	li $v0, 4		#print answer text
	la $a0, answer
	syscall
	
	li $v0, 1		#print the answer
	la $a0, ($t3)
	syscall	
	
	li $v0, 10
	syscall
