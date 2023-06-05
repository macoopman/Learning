.globl _start

.section .data

value:
	.quad 5			# value for the factoral 5! = 5*4*3*2*1

.section .text
_start:
	pushq $0			# push the sentinel value
	movq value, %rax	# grab the value for the start of the factorial

# Push all the values from 1 to current value to the stack
pushvalues:
	pushq	%rax
	decq	%rax
	jnz		pushvalues		# Going from 5 down to 0 and pushing values onto the stack

	movq	$1, %rax		# Prepare for multiplying

multiply:
	popq	%rcx			# Get the next value from the stack

	cmpq	$0, %rcx		# if we have reached zero then we have covered all of the values
	je		complete

	mulq	%rcx			# multiply by what we ave accumlated so far

	jmp	multiply			# repeat

complete:
	movq	%rax, %rdi
	movq	$60, %rax
	syscall


