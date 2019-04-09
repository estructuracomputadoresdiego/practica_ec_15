	.data

cad1: .asciiz "\nIntroduce un numero: "	
cad2: .asciiz "\nEl resultado es: "

	.globl main
	.text
	
main:
	li $v0, 4
	la $a0, cad1 #Imprimo la cadena
	syscall
	
	li $v0, 5 #Leo el numero
	syscall
	
	move $a0, $v0 #Cargo el numero en a0
	
	jal factorial #Llama a la funcion faccotrial
	
	move $t0, $v0 #Carga lo que ha devuelto la funcion factorial en t0
	
	li $v0, 4
	la $a0, cad2 #Imprime la cadena 2
	syscall
	
	li $v0, 1
	move $a0, $t0 #imprime el resultado
	syscall
	
	li $v0, 10 #finaliza el programa
	syscall
	
factorial:
	move $t0, $a0 #Cargo el numero en t0 y lo uso como contador
	li $t1, 1 #Inicializo el resultado a 1
	
	bucle: #Comprueba si el contador es 0, si no lo es multiplica el resultado por n-1, si no salta a la etiqueta fin
		beqz $t0, fin
		mul $t1, $t1, $t0
		sub $t0, $t0, 1
		j bucle #Si beqz no se cumple salta al principio del bucle
	
	fin:
	
		move $v0, $t1 #carga el resultado en v0 oara devolverlo 
	
		jr $ra #acaba la ejecucion de la funcion factorial
	