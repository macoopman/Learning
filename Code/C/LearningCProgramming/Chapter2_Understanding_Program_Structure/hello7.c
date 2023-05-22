#include <stdio.h>

// function prototypes
void printGreeting(char* aGreeting, char* aName);
void printAGreeting(char* greeting);
void printAnAddressee(char* aName);
void printAComma(void);
void printANewLine(void);

int main(){
	printGreeting("Hi", "Bub");
	return 0;
}

void printGreeting(char* greeting, char* who){
	printAGreeting(greeting);
	printAComma();
	printAnAddressee(who);
	printANewLine();
}

void printAGreeting(char* word){
	printf("%s", word);
}

void printAnAddressee(char* aName){
	printf("%s", aName);
}

void printAComma(void){
	printf(", ");
}

void printANewLine(){
	printf("\n");
}
