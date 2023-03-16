.data	
Result:	.word 	0
N:	.word	21

	.text
	.globl main
main:
	la	$t0, N		#loads address of argument N into t0
	lw	$t0, 0($t0)	#sets t0 to value of n
	addi	$s0, $zero, 0	#sets s0 to zero, will be used to set result value
	
	slti	$t1, $t0, 2 	#checks if t0 is less than 2 (see 1.a)
	bnez	$t1, fin	#goes to end if less tan 2 so value of result will be 0
	
	addi 	$t2, $t0, 0	#sets t2 to be temp workable value eq to t0 to check neg/ pos in checkev
	addi	$t3, $zero, 1	#basically const of 1 for comparison in checkev
	
checkev:
	addi	$t2, $t2, -2	#incrrements down 2
	beqz 	$t2, fori	#if its 0, its alr even so just go to fori
	beq	$t2, $t3, makev	#if its eq to 1 its not even number so go to makev to get to first even number below
	j checkev 		#basically loops back to checkev, value isnt low enough for comparison yet

makev:
	addi $t0, $t0, -1	#makes number be first even number below it

fori:	
	add 	$s0, $s0, $t0	#adds current t0 value to total
	addi 	$t0, $t0, -2	#increments down 2
	bnez	$t0, fori	#if its eq to 0 its done so go to end of program, if not loop

fin:
	la	$t5, Result	#load address of global variable Result
	sw	$s0, 0($t5)	#save s0 value to result varibale
	
	li	$v0, 10		#set terminate code 
	syscall			#execute program termination
