.globl _start
.section .text

_start:
	movq $2, %rbx		# rbx will hold the base
	movq $5, %rcx		# rcx will hold the current exponent
	movq $1, %rax		# store the accumulated value in rax

mainloop:
	addq $0, %rcx		# ading zero will allow to use the flas to determin if rcx has zero to begin with
	jz complete			# if the add is 0 the jump to complete label
	mulq %rbx
	decq %rcx
	jmp mainloop

complete:
	movq %rax, %rdi		# move solution to rdi as return val
	movq $60, %rax
	syscall
