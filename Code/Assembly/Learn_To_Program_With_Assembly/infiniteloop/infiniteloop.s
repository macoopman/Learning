.globl _start
.section .text

_start:
	movq $60, %rax		# move 60 to rax for system call

another_location:
	movq $8, %rdi		# move 8 to rdi for exit code

	jmp another_location	# jump back up (inifinite loop)

	# This never gets called
	syscall
