.data
	prompt1: .asciiz "Enter number 1: "
	prompt2: .asciiz "Enter number 2: "
	answer:   .asciiz "The answer is: "
	
.text
	li $v0, 4		#print prompt 1
	la $a0, prompt1
	syscall
	
	li $v0, 5		#get input
	syscall
	move $t0, $v0
	
	li $v0, 4		#print prompt 2
	la $a0, prompt2
	syscall
	
	li $v0, 5		#get input and multiply the 2 numbers
	syscall
	mult $v0, $t0
	mflo $t1	
	
	li $v0, 4		#print answer text
	la $a0, answer
	syscall
	
	li $v0, 1		#print the answer
	la $a0, ($t1)
	syscall
	
	li $v0, 10		#exit
	syscall
	
