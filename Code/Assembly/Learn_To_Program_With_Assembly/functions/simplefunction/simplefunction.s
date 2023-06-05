.globl exponent 
.type exponent, @function


.section .text
exponent:
	# %rdi has the base (Based on the convention for the reg -> 1st arg)
	# %rsi has the exponent (Same as above reg -> 2nd arg)

	# Create the stack frame with one 8-byte local variable
	# which will be referred to using -8(%rbp).
	# This will store the current value of the exponent as we iterate through it. 
	# We are allocating 16 bytes so that we maintain 16-byte alignemnt
	enter $16, $0

	movq $1, %rax		# Accumlated value in %rax
	movq %rsi, -8(%rbp)	# Store the exponent

mainloop:
	mulq %rdi			# 
	decq -8(%rbp)
	jnz mainloop

complete:
	leave	# result is already in %rax
	ret
