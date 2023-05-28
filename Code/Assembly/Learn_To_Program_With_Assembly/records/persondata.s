.section .data

.globl people, numpeople

numpeople:
	# Calcultate the number of people in array
	.quad (endpeople - people) / PERSON_RECORD_SIZE
people:
	# Array of people
	.quad 200, 2, 74, 20
	.quad 280, 2, 72, 44
	.quad 150, 1, 68, 30
	.quad 250, 3, 75, 24
	.quad 250, 2, 70, 11
	.quad 180, 5, 69, 65
endpeople:		# mark the end of the array for calculation purposes

# Describe the componts of the stuct
.globl WEIGHT_OFFSET, HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ WEIGHT_OFFSET, 0
.equ HAIR_OFFSET, 8
.equ HEIGHT_OFFSET, 16
.equ AGE_OFFSET, 32

# Total SIZE OF THE STUCT
.globl PERSON_RECORD_SIZE
.equ  PERSON_RECORD_SIZE, 32

