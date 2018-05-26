##########
#  data  #
#########
		.data
buffer: .word 0
input:  .word 0
ask:    .asciiz"Choose a number: "
fibOf:  .asciiz"Fibonacci of: "
result: .asciiz"is: "
endl:   .asciiz"\n"

##########
#  text  #
##########
		.text
		.globl main
main:
    li $v0, 4
    la $a0, ask
    syscall ### print ask
    li $v0, 5
    syscall ### get input

    add $s0, $zero, $v0 ### Number to find fib of
    addi $t0, $zero, 1 ### start number
    addi $t1, $zero, 1 ### n - 1
    addi $t2, $zero, 1 ### n - 2

Loop:
    beq $s0, $t0, Exit
    addi $t0, $t0, 1
    add $t3, $t2, $t1
    add $t2, $t1, $zero
    add $t1, $t3, $zero
    j Loop

Exit:
    li $v0, 4
    la $a0, fibOf
    syscall ### print fibOf
    li $v0, 1
    sw $s0, buffer
    lw $a0, buffer
    syscall ### print before
    li $v0, 4
    la $a0, endl
    syscall
    la $a0, result
    syscall ### print result
    li $v0, 1
    sw $t1, buffer
    lw $a0, buffer
    syscall ### print fibonacci
    li $v0, 4
    la $a0, endl
    syscall

    li $v0, 10
    syscall
