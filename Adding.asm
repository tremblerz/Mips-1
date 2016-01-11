.data
	prompt1: .asciiz "Enter number 1: "
	prompt2: .asciiz "Enter number 2: "
	answer:   .asciiz "The answer is: "
		
.text
	li $v0, 4		#print first prompt
	la $a0, prompt1
	syscall
	
	li $v0,	5		#get input and save number into $t0
	syscall
	move $t0, $v0
	
	li $v0, 4		#print second prompt
	la $a0, prompt2
	syscall
	
	li $v0, 5		#get second input and save first + second to $t1
	syscall
	add $t1, $v0, $t0
	
	li $v0, 4		#print answer text
	la $a0, answer
	syscall
	
	li $v0, 1		#print answer
	la $a0, ($t1)
	syscall
	
	li $v0, 10		#quit
	syscall
