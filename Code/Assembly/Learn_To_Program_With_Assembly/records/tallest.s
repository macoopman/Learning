.globl _start

.section .text
_start:
	### Init Registers ###

	# Pointer to first record
	leaq people, %rbx

	# Record count
	movq numpeople, %rcx

	# Tallest value found
	movq $0, %rdi

	### Check Preconditions ###
	cmpq $0, %rcx
	je finish

mainloop:
	# %rbx is the pointer to the whole struct
	# This instruction grabs teh height field
	# and stores it in %rax
	movq HEIGHT_OFFSET(%rbx), %rax

	# If it is less than or equal to our current tallest, go to the next one
	cmpq %rdi, %rax
	jbe endloop

	# Copy this value as the tallest value
	movq %rax, %rdi

endloop:
	# Move %rbx to point to the next record
	addq $PERSON_RECORD_SIZE, %rbx

	loopq mainloop  # remember here that %rcx is the loop counter and we loaded the total number of records to %rcx

finish:
	movq $60, %rax
	syscall
