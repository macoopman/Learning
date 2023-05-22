#include <stdio.h>

void printComma(void){
	printf(", ");
}

void printWord(char* word){
	printf("%s", word);
}

void printGreeting(char* greeting, char* addressee){
	printWord(greeting);
	printComma();
	printWord(addressee);
	printf("\n");
}

int main(){
	printGreeting("Hello", "World");
	printGreeting("Good day", "Your Royal Highness");
	printGreeting("Howdy", "John!. and Jane P. Doe");
	return 0;
}
