# Assembly x86-64

## Assembler 
Run the assembler with the command ```as``` (The portable GNU assembler)

**Assemble a basic file**
```as file.s -o file.o```
* This takes the assembly source code ".s", run assembler, and outputs as file.o (object file)

## Linker
Object files from the assembler can not be directly executed. Multiple files need to be **linked** together to form an executable

**Running Linkder**
```ld file.o -o myexit``


## Directives
Anything with a "." prefix.

### .globl
Instructs the assembler to not discard symbols that are listed with it.
`` .globl _start `` 
* _start symbol with not b e removed by assembler

### .section
Instructs the assembler to place the newxt part of the listing in the code section of the program

### _start
The label that specifies where the program should start.

### Constants
Contants can be defined using the ```.equ`` directive


-------------------------------------------------------------------------------------------------------------------

## Instructions

### MOV
**movq**		-> move quadword

### Add / Subtract
**addq {src} {dest}**
	* Add the src to the dest and store in dest
	* src 
		* register
		* constant (i.e. $25)
**subq**		-> subtract

### Increment / Decrement
**incq**		-> Increment 
	* Add 1 to destination 
**decq**		-> Decrement
	* Subtract 1 from destination

### Multipication / Division
* Destination as assumed to be **%rax**. Never list **%rax** in the instruction (it is implicit)

**mulq**
	* Multiple src by %rax
	* %rax is destination for the least significate bits. Only need if no overflow
	* %rdx is destionation for most significated bits if there is overflow
	* src must be register

**divq**
	* Divide **%rax** by src
	* Src must be from register or memory
	* Remainder set to **%rdx** (set to zero before using divide instruction
	* rax is the destination

### Jump

**jmp**
	* jump with out conditions

**jz**
	* *Jump if Zero* 
	* jump if the zero flag is set to 1

**jnz**
	* *Jump if Not Zero*
	* Jump if the zero flage is set to 0

**jc**
	* *Jump if Carry**
	* Jump if the carry flag is set to 1

**jnc**
	* *Jump if No Carry*
	* Jump if the carry flag is set to 0

**je**
	* Jump if ARG2 equals ARG1

**jne**
	* Jump if ARG2 *does not* equal ARG1

*Unsigned Jumps*
	* Unsigned jumps usally checkt he carry flag and zero flag

	**ja**
		* Jump if ARG2 is *greater than* ARG1
	
	**jae**
		* Jump if ARG2 if *greater than* or *equal to* ARG1
	
	**jb**
		* Jump if ARG2 is *less than* ARG1
	
	**jbe**
		* Jump if ARG2 is *less than* or *equal to* ARG1

*Signed Jumps*
	* Singed jumps check the carry, zero, signed, and overflow flag

	**jl**
		* Jump if ARG2 is less than ARG1
	
	**jle**
		* Jump if ARG2 is less than or equal to ARG1
	
	**jg**
		* Jump if ARG2 is greater than ARG1
	
	**jge**
		* Jump if ARG2 is greatere than or equal to ARG1

**jo**
	* Jump of overflow

**jno**
	* Jump if NOT overflow

**js**
	* Jump if signed

**jns**
	* Jump if NOT signed

### Bit Manipulation

**rol**
	* Rotate Left

**ror**
	* Rotate Right

**shr**
	* Shift Right

**shl**
	* Shift Left

### Other Conditionals

**loopq**
	* Combines several actions into one.
		1. Decrement %rcx (counter register)
		2. Jump to the speified label if the result of the decrement is not zero.
	* The idea behind theis instruction is that it jumps if it is still in the loop and oes't jump if you exit the loop.
	* Usally at th tail end of a loop.

**loopeq**
	* uses EFLAGs
	* Will only continue the loop if the previous comparision resulted in equality (ZF=1)

**loopneq**
	* use EFLAGs
	* Will only jump if the previous comarision resulted in inquality (ZF=0)

### Compare

**cmp**
	* Versions: cmpq, cmpb, cmpw, and cmpl
	* Compares two number to tell which one is larger or if they are both equal. Ddiscarding the result and sets the eflags.
	* Usage: ```cmpq %rbx, %rax```
		* Comparision can be:
			* register with register
			* register with specific value
				* NOTE: specific value must be first arg
			* register with val from memory

### Working with memory

**leaq**
	* Load Effictive Adress
	* Will calculate the final address an store the address itself into the destination register
	* Example: ```leaq mynumbers, %rbx```
		* load the address of mynumbers into rbx
	

-------------------------------------------------------------------------------------------------------------------
## Addressing Modes

### General Addressing Mode Syntax
``` VALUE( BASEREG, IDXREG, MULTIPLIER) ```
	* VALUE -> fixed value
	* BASREG -> register (Base)
	* IDXREG -> register (Index)
	* MULTIPLIER -> fixed multiplier
		* 1,2,3,8 (1 if left out)
* Address caluclated as --> address = VALUE + BASEREG + IDXREG * MULTIPLIER
* If anything is left out it is 0 (zero) except the multiplier (1)j

### Modes

* *Immediate Mode:** This is when we put the value of interest directly in the instruction
	* ``` movq $5, %rax ``` ($5 part)

* **Register Mode:** This is when we are referring to a register to find or store a value
	* ```movq $5, %rax ``` (using %rax is register mode)

* **Direct memory mode:** This is when we are reffering to a value by its address.
	* ``` movq first_value, %rbx``` (first_value is a direct memory address)
* General syntax: VALUE

* **Register Indirect:** The register holds the value of the address to access
	* ``` movq (%rbx), %rax ``` ( (%rbx) is referring to the address that is held in rbx)

-------------------------------------------------------------------------------------------------------------------

## Registers

|-------------------------------------------------------------------------------|
                                                         |    %ah   |   %al     | (8 bits | 8 bits)
	                                                     |         %ah          | ( 16 bits )
									| ------------  %eax ---------------------  | ( 32 bits )
| ------------------------------- %rax -----------------------------------------| ( 64 bits )

### General-Purpose - Computational Registers
Computational registes can be divided up in 64, 32, 16, and 8 bits

**rax** (accumplator)
	* Most widely used general-purpose register 

**rbx** (base register)
	* Often used for indexed addresing

**rcx** (counter register)
	* Historically used for counts when doing repetitive code (loops)

**rdx** (data register)
	* Used for arithmitic ops and i/o.

### General-Purpose 
Can be divided into 64, 32, and 16 bit but cannot access individual bytes. Generally used for **pointers**.

**rsi** (source index)
	* uUes for working with longer spans of memory

**rdi**	(destionation index)
	* Often used in conjuction with **rsi** for working with longer spans of memory.

**rbp** (base pointer)
	* Chapter 11

**rsp** (stack pointer)
	* Points to the endo of the memory region containing the stack 

### Other General-Purpose
**r7 - r15**
	* Sizes:
		* r11	 = 64 bits
		* r11d	 = 32 bits
		* r11w	 = 16 bits
		* r11b	 =  8 bits
		
### EFLAGS
Special-purpose register where each bit is a flag.

**ZF**
	* Zero flag
	* 1 -> if result of the last arithmetic op was zero
	* 0 -> if result of the last arithmetic op was non-zero

**CF**
	* Carry Flag
	* 1 ->  if the result of the last arithmetic operatio resulted in a **carry**
	* 0 ->  if no carry

**OF**
	* Overflow Flag

**SF**
	* Signed Flag


-------------------------------------------------------------------------------------------------------------------

## Data

### Fixed Length Data Section

Marked using ```.section .data``` command
* name the memory storage for our data using *labels*
* write the initial values that will be stored in tha memory

```as
.section .data
first_val:
	quad 4

```


-------------------------------------------------------------------------------------------------------------------

## System Call Numbers

* **systemcall**
	* command that tells the processor to transfer control to the operating system.
	* system call number must be moved in to **%rax** register before calling.

* 60 -> exit
	* In the **exit** system call, the **%rdi** register holds the exit status


-------------------------------------------------------------------------------------------------------------------

## Bit Mask

### AND
An *AND* bit mask is useful when trying to find what bits are are turned on (i.e. find the bits that are 1)
* The idea is that you are **masking** out all the values that you dont care about
```
	 1 0 1 0  (binary value to check)
AND	 0 0 1 0  (Bit Mask - determin if the second bit it on)
-------------
	 0 0 1 0 
```

### OR
An **OR** operation is used to set a bit

```
	0 0 1 0
OR	0 0 0 1 (Bit Mask to turn on the first bit)
------------
	0 0 1 1
```


-------------------------------------------------------------------------------------------------------------------

## Stack

* **REMEMBER** The stack grows towards lower memory addresses

### Stack Pointer (%rsp)
* Points tot he end of the memory region containing the stack

### PUSH
* Used to push items onto the stack
* Performs two tasks:
	1. Decrements %rsp to point to the next location on the stack
	2. Copies the value to the location specified by %rsp

### POP
* Get values off of the stack 
* Perform:
	1. Returns value that is pointed to by %rsp
	2. Increments the %rsp pointer to the previous location on the stack
	


-------------------------------------------------------------------------------------------------------------------

## Functions Calling Conventions

### Application Binary Interface (ABI)

* Used in Linux systems

**Preservation of Registers**
	* The following registers must always be preserved and returned back to original state prior to exiting the function. All other 
	registers can be clobbered
	
	* Registers to Preserve
		* %rbp	(base pointer)
		* %rbx  (base register)
		* %r12 -> %r15
	
**Passing Input Parameters**
	* Order:
		1. %rdi
		2. %rsi
		3. %rdx
		4. %rcx
		5. %r8
		6. %r9
		7... All additional get pushed to the statck

**Return Value**
	* %rax

**Stack Frame**
	* The section of the stack the belongs to the function is called the **stack frame**

	* Setting up and tearing down (Full Version)
	```
	# set up
	pushq	%rbp						# Save the pointer to the previous stack frame
	movq	%rsp, %rbp					# Copy the stack pointer to the base pointer for a fixed reference point
	subq	$NumberOfBytesToReserve		# Reserve how ever much memory on the stack as needed

	# tear down
	movq	%rbp, %rsp					# Restore the stack pointer
	popq	%rbp						# restore teh base pointer
	```

	* Setting Up and Tearing Down (Simple Version)
		* note: **enter** is slower than the above full version while **leave** is faster
		* Only need first arg for enter. Seconds is for closers and not often used
		```
		enter $NUMBYTES, $0
		leave
		```
	
**Invoking and Returning**
	* **Call**
		```call thefunction```
	* **ret**
	






























































































