.globl _start

.section .data

mystring:
	.ascii "Hello there!\n"
mystring_end:
	.equ mystring_length, mystring_end - mystring

.section .text
_start:
	### Display string

	movq $1, %rax		# system call number for write
	movq $1, %rdi		# file descriptor (1 = stdout)
	movq $mystring, %rsi	# pointer to string

	movq $mystring_length, %rdx
	syscall


	#exit
	movq $0x3c, %rax
	movq $0, %rdi
	syscall
