#include <stdio.h>


int feetToInches(double);
void printCal(double);

int main(){
	int aValue = 8;
	int aLength = 0;

	aLength = 5 + aValue + feetToInches(3.5);

	printCal(aLength);
	aLength = 5;

	aLength = aLength + aValue;

	aLength = aLength + feetToInches(3.5);
	
	printCal(aLength);
	
	return 0;
}


int feetToInches(double feet){
	return feet * 12;
}


void printCal(double val){
	printf("Calculated length = %d\n",(int) val);
}

