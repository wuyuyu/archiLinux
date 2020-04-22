#include <stdio.h>

int main(int argc, char *argv[]){
	printf("Hello, girls run the world!\n");
	char inputText[20];
	while(fgets(inputText,20,stdin)){

		printf("text = %s", inputText);
	}
	return 0;
}
