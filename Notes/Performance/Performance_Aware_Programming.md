# Performance-Aware Programming
-----------------------------------------------------------------------------------


--------------------------------
## Helper Stuff 

Doing Homework
	* Download asm files
	* Run though assembler to create assembled version
	* Use assembled version as an input to program
	* dump results of program to file -> results.asm
	* Assemble output file
	* Compare output with input
	
### Complier Explorer
* Go to [godbolt.org](https://godbolt.org)
* See how code get converted to assembly

### Assembler
* Downoaded NASM assembler	-> sudo apt install nasm -y

** Usage**
```nasm {file}.asm```

--------------------------------
## 8086/8088

### MOV

**Moving Register to Register**
* Instruction Manual: page 160
mov ax, bx		
* mov	-> mnemomic for move instruction
* ax	-> ax is a register (dest)
* bx	-> bs is a register (src)

|     8 bits      |     8 bits      |
| 1 0 0 0 1 0 D W | 0 0 0 0 0 0 0 0 |
			      | mod  reg  r/m   |

**Instruction**
	* 100010	 
	* move instruction (binary)
	* Most significant 6 bits

**D**			
	* Determines which of the *reg* or *r/m* is the src or dest
	* 0 = reg is src
	* 1 = reg is dest
	
**W**			
	* Encode is is wide. 
	* 0 = 8 bits
	* 1 = 16 bits (Wide)

**mod**
	* 2 bits
	* Determines if is a memory or register operation

**reg**
	* 3 bit
	* Encode a register

**r/m**
	* 3 bit
	* Encode a register or memory
