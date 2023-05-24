.globl _start

.section .data
numberofnumbers:
	.quad 7

mynumbers:
	.quad 5, 20,33, 80, 52, 10, 1

.section .text
_start:
	movq numberofnumbers, %rcx
	movq $0, %rbx				# index
	movq $0, %rdi				# largest value

	cmp $0, %rcx
	je endloop

myloop:
	movq mynumbers(,%rbx,8), %rax		# take the current location (mynumbers) and add the (index * 8) 
	
	cmp %rdi, %rax
	jbe loopcontrol

	movq %rax, %rdi						# update rdi with bigger value

loopcontrol:
	incq %rbx
	loopq myloop				# here we are ending when rcx is zero but then also using rbx as the index. not the best way. can this be combined :)

endloop:
	movq $60, %rax
	syscall

