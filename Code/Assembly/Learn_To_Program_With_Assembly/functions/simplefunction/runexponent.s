.globl _start

.section .text
_start:
	# Call exponent with 3 and 2 -> exponent(3,2)
	movq	$3, %rdi
	movq	$2, %rsi
	call exponent

	# Results in %rax
	movq	%rax, %rdi	# rdi is the return value
	movq	$60, %rax
	syscall

