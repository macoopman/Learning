
.globl _start
.section .text

_start:
	movq $7, %rdi	# move literal 7 to rdi for exit status
	jmp nextplace

	# these two instructions are skipped
	movq $8, %rdx
	addq %rbx, %rdi

nextplace:
	movq $60, %rax
	syscall
