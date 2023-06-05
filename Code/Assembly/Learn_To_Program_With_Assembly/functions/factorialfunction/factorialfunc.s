.globl factorial
.section .text

factorial:
	# Reserve space for 1 var - the value we were called with (aligned to 16 bytes)
	enter $16, $0

	# if the arg is 1, then return the result as 1
	cmpq $1, %rdi
	jne continue

	# Return 1
	movq $1, %rax
	leave
	ret

continue:
	movq	%rdi, -8(%rbp)			# save the arg into our stack storage

	# Call factorial with %rdi decreased by 1
	decq %rdi
	call factorial

	# The result will be in %rax. Multiply the rsult by our first arg we stored on the stack
	mulq -8(%rbp)

	# Rusult is in %rax, which is what is needed for the the return value
	leave
	ret
