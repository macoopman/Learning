#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

void printSizes(void);

int main(){
	printSizes();

	return 0;
}


void printSizes(){
	printf("Size of C data types\n\n");
	
	printf("Type			Bytes\n\n");
	
	printf("char			%lu\n", sizeof(char));

	printf("int8_t			%lu\n", sizeof(int8_t));

	printf("unsigned char		%lu\n", sizeof(unsigned char));

	printf("uint8_t			%lu\n", sizeof(uint8_t));

	printf("short			%lu\n", sizeof(short));
}

