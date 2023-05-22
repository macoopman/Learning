.globl _start
.section .text

_start:
	movq $25, %rax		#(1)rax=25
	jmp thelabel				

somewhere:
	movq %rax, %rdi		#(7) rax=15, rdi=15
	jmp anotherlabel

label1:
	addq %rbx, %rax		# (4) rax=75, rbx=50
	movq $5, %rbx		# (5) rax=75, rbx=5
	jmp here

labellabel:
	syscall

anotherlabel:
	movq $60, %rax		# rax=60 rdi=15
	jmp labellabel

thelabel:
	movq %rax, %rbx		#(2) rax=25, rbx=25
	jmp there

here:
	divq %rbx			# (6) rax=15, rbx=5
	jmp somewhere

there:
	addq $25, %rbx		#(3) rax=25, rbx=50
	jmp label1

anywhere:
	jmp thelabel
	


