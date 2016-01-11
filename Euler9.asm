.data

.text
	addi $t0, $zero, 1000
	
	addi $t1, $zero, 1

loopOuter:
	addi $t1, $t1, 1
	addi $t2, $zero, 1
	mult $t1, $t1
	mflo $t4
	loopInner:
		sub $t3, $t0, $t1
		sub $t3, $t3, $t2
		mult $t2, $t2
		mflo $t5
		mult $t3, $t3
		mflo $t6
		add $t7, $t4, $t5 
		beq $t7, $t6, exit
		
		addi $t2, $t2, 1
		beq $t2, $t1, loopOuter
		
		j loopInner
		
		
exit:
	mult $t1, $t2
	mflo $t1
	mult $t1, $t3
	mflo $t1
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 10
	syscall
