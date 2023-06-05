.globl _start

.section .data

currentTime:
	.quad 0

.section .text

_start:
	### Init ###

	# Get initial time
	movq $0xc9, %rax			#0xc9 (201) == get time call
	movq $currentTime, %rdi		# GetTime will used the address of currentTime (that is stored in rdi) to store the time

	syscall

	# Store it in %rdx
	movq currentTime, %rdx

	# Add 5 seconds
	addq $5, %rdx

timeloop:
	# Check Time
	movq $0xc9, %rax
	movq $currentTime, %rdi
	syscall

	# if have not reached the time specified in rdi, repeat
	cmpq %rdx, currentTime
	jb timeloop

timeFinish:
	# Exit
	movq $0x3c, %rax
	movq $0, %rdi
	syscall
