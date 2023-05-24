.globl _start

.section .data

# Total values in array
numberofnumbers:	
	.quad 7	

mynumbers:
	.quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
	### Init Registers ###
	movq numberofnumbers, %rcx		# Put the number of elements of the array in %rcx
	movq $mynumbers, %rbx			# Puth the *address* of the first element in %rbx
	movq $0, %rdi					# use %rdi to hold the cuurent-high value


	### check Preconditions ###
	cmp $0, %rcx
	je endloop						# Since we are counting down (index) when this hits zero we are done


	### Main Loop ###
myloop:
	movq (%rbx), %rax				# Get the value from the address that rbx points to and put in rax
	
	cmp %rdi, %rax
	jbe loopcontrol					# rdi holds the largest value, If rax is not bigger than jump over the update of rdi

	movq %rax, %rdi					# found a bigger value, update rdi

loopcontrol:
	addq $8, %rbx					# add 8 (quad word) to the memory address to get the next value
	loopq myloop					# decrement %rcx and keep going until %rcx is zero

endloop:
	movq $60, %rax
	syscall
