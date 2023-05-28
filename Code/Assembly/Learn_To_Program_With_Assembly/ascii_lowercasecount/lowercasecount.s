.globl _start
.section .data

mytest:
	.ascii "This is a string of characters.\0"

.section .text
_start:
	movq $mytest, %rbx	# move a pointer tot he string into rbx
	movq $0, %rdi		# count starts at zero

mainloop:
	movb (%rbx), %al		# get teh next byte
	
	cmpb $0 , %al			# quiat if we hit the null char
	je finish

	cmpb $'a', %al			# go to the next byte if the value isn't between a and z
	jb loopcontrol

	cmpb $'z', %al		
	ja loopcontrol

	incq %rdi				# if is lower than incr count

loopcontrol:
	incq %rbx				# next byte
	jmp mainloop			# repeat

finish:
	movq $60, %rax	
	syscall
	
