.globl _start
.section .text

_start:
	### Init Registers ###

	leaq people, %rbx		# pointer to the first record
	movq numpeople, %rcx	# toatl record count. Used as loop counter
	movq $0, %rdi			# Brown hair count

	### Check Preconditions ###
	cmpq $0, %rcx
	je finish

mainloop:
	cmpq $2, HAIR_OFFSET(%rbx)

	jne endloop		# No? Go to next record

	incq %rdi		# yes? Increment the count

endloop:
	addq $PERSON_RECORD_SIZE, %rbx
	loopq mainloop

finish:
	movq $60, %rax
	syscall
