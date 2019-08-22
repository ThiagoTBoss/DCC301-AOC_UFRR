.data
mg1:.asciiz "O Maximo e "
mg2:.asciiz " O Minimo e "
vet:.word 1 21 13 14 50 0
.text
.globl main
main:
	li $t2,0
	loop:
	la $s2,vet
	add $t5,$t2,$zero
	add $t5,$t5,$t5
	add $t5,$t5,$t5
	add $t3,$t5,$s2
	lw $t0,0($t3)
	
	
	bge $t6,$t0,if
	j se_n
	
	if:
	add $t6,$t0,$zero
	se_n:
	ble $t7,$t0,if2
	j se_n2
	
	if2:
	add $t7,$t0,$zero
	se_n2:
		
	add $t2,$t2,1	
	ble $t2,5,loop
	
	
	la $a0,mg1 #mensagem 1
	li $v0,4
	syscall

	li $v0,1
	add $a0,$t7,$zero # imprimir var_int1
	syscall
	
	la $a0,mg2 # mensagem 2
	li $v0,4
	syscall
	
	li $v0,1
	add $a0,$t6,$zero #imprimir var_int2
	syscall	
	
	li $v0,10  #fechar programa
	syscall