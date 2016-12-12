.data

	vetor1: .space 40
	vetor2: .space 40
	vetorsoma: .space 40
	
	msg1: .asciiz "Digite um valor para o primeiro vetor: "
	msg2: .asciiz "Digite um valor para o segundo vetor: "
	msg3: .asciiz "O vetor soma é: "
	
	pular:  .asciiz  "\n"
	espaco: .asciiz  " " 

.text
	 
	la $t0, vetor1	# carrega o endereço do vetor1 para t0
	la $t1, vetor2	# carrega o endereço do vetor2 para t1
	#------------------------------#
	li $t6, 10
	li $t7, 0
	
	loop1:
	
        li $v0,4
	la $a0,msg1
	syscall 
	li $v0,5		# Recebe o elemento
	syscall 
	sw $v0, 0($t0)	# Adiciona o valor ao array
	        
       addi $t0,$t0,4
       addiu $t6, $t6, -1
        
       bne $t6, 0, loop1
       
       li $t6, 10
	
	loop2:
        
        li $v0,4
	la $a0,msg2
	syscall 
	li $v0,5		# Recebe o elemento
	syscall 
	sw $v0, 0($t1)		# Adiciona o valor ao array
	
        addi $t1,$t1,4
        
        addiu $t6, $t6, -1
        bne $t6, 0, loop2
        
	
	la $t2, vetorsoma	# carrega o endereço do vetorsoma para t2
	
	li $v0,4
	la $a0,msg3
	syscall 
	la   $a0, pular       # chama a rotina para pular uma linha  
        li   $v0, 4          
        syscall 
        
        li $t6, 10
        
        loop3:# Decremento os valores de memória
        
        addi $t0,$t0,-4
        addi $t1,$t1,-4
        
        addiu $t6,$t6, -1
        bne $t6, 0, loop3
        
        li $t6, 10
        
	while:
	lw $t4, 0($t0)
	lw $t5, 0($t1)
	
	add $t3,$t4,$t5
	
	sw $t3,0($t2)
	
	lw $a0, ($t2)      # carrega primeiro elemento de vetor para syscall
        li $v0, 1             # 1 especifica que vai imprimir um inteiro 
        syscall  
        
        la   $a0, espaco       # chama a rotina para pular uma linha  
        li   $v0, 4          
        syscall 
        
        addi $t0,$t0,4
        addi $t1,$t1,4
        addi $t2,$t2,4
        
        addiu $t6,$t6, -1
        bne $t6, 0, while
       
1