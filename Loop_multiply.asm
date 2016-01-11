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
	
	#t2 is our counter variable
	#t3 is our answer
		
loop:				#multiplication loop
	beq $t2, $t1, exit
	addi $t2, $t2, 1
	add $t3, $t0, $t3	
	j loop
	
exit:
	li $v0, 4		#print answer text
	la $a0, answer
	syscall
	
	li $v0, 1		#print the answer
	la $a0, ($t3)
	syscall
	
	li $v0, 10		#exit
	syscall
