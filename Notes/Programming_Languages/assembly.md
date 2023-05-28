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
	* %rax is destination
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

**ja**
	* Jump if ARG2 is *greater than* ARG1

**jae**
	* Jump if ARG2 if *greater than* or *equal to* ARG1

**jb**
	* Jump if ARG2 is *less than* ARG1

**jbe**
	* Jump if ARG2 is *less than* or *equal to* ARG1

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
	* Chapter 11

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








































