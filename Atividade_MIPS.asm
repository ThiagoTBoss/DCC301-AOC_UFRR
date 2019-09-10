.data
arry: .word 3 2 5 1
.text
.globl main
main:
	li $t2, 3
	blt $t2,$t1,end_loop 
	loop:	
		li $v0,5
		syscall	
		add $t7,$v0,$zero
		
		addi $s0,$t7,0
		sw $s0,arry($t0)
		add $t0,$t0,4
		add $t1,$t1,1
		blt $t2,$t1,end_loop 
		j loop
	end_loop:
	
	li $t1,0
	li $t2,2
	
	blt $t2,$t1,end_loop1
	loop1:
		li $t3,0
		li $t6,0
		li $t0,0
		li $t7,0
		li $t4,0
		
		sub $t5,$t2,$t1
		blt $t5,$t4,end_loop2
		loop2:	
			
			la $s0,arry
			add $t6,$t4,$zero
			add $t6,$t6,$t6
			add $t6,$t6,$t6
			add $t8,$t6,$s0
			
			
			lw $t0,0($t8)
			lw $t7,4($t8)
			
			
			blt $t0,$t7,end_if
			if:
				add $t9,$t6,4
				add $t3,$t0,$zero
				addi $s4,$t7,0
				sw $s4,arry($t6)
				addi $s3,$t3,0
				sw $s3,arry($t9)
				li $t9,0
				
			end_if:
			addi $s0,$s0,4
			
			add $t4,$t4,1
			blt $t5,$t4,end_loop2
			j loop2
		end_loop2:
		
		
		add $t1,$t1,1
		blt $t2,$t1,end_loop1
		j loop1
	end_loop1:
	li $t2,3
	li $t1,0
	li $t6,0
	li $t8,0
	li $t0,0
	blt $t2,$t1,end_for
	for_loop:
		la $s0,arry
		add $t6,$t1,$zero
		add $t6,$t6,$t6
		add $t6,$t6,$t6
		add $t8,$t6,$s0
		lw $t0, 0($t8)
		
		li $v0,1
		add $a0,$t0,$zero
		syscall
		
		add $t1,$t1,1
		blt $t2,$t1,end_for
		j for_loop
	end_for:
	
	li $v0,10
	syscall