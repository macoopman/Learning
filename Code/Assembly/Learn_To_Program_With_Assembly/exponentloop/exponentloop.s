.globl _start

# This will calculate 2^3
# You can modify %rbx and %rcx to calculate
# another exponential.

.section .text

_start:
	movq $2, %rbx			# %rbx will hold the base
	movq $3, %rcx			# rcx will hold the current exponent count
	movq $1, %rax			# Store the accumulator in rax

	cmpq $0, %rcx			# if the wxponent is equal to zero, we are done
	je complete				

mainloop:
	mulq %rbx				# multiple the accumlated value by our base

	loopq mainloop			# decrement %rcx, go back to loop label if rex is not yet zero


complete:
	movq %rax, %rdi			# move the accumulated value to rdi so we can return the value
	movq $60, %rax			# call the "exit" system call
	syscall
