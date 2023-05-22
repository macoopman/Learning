
.globl _start
.section .text

_start:
	# Perform various arithmetic functions
	movq $3, %rdi		#rdi = 3
	movq %rdi, %rax		#rdi=3, rax=3
    addq %rdi, %rax		#rdi=3, rax=6
	mulq %rdi			#rdi=3, rax=18
	movq $2, %rdi		#rdi=2, rax=18
	addq %rdi, %rax		#rdi=2, rax=20
	movq $4, %rdi		#rdi=4, rax=20
	mulq %rdi			#rdi=4, rax=80
	movq %rax, %rdi		#rdi=80, rax=80

	# set the exit system call number
	movq $60, %rax

	# perform the system call
	syscall

