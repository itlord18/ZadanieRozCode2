#include <stdio.h> 
#include <stdlib.h>
#include "szescian.h"
#include "kwadrat.h"

int main(void){
	double a;
	printf("Podaj argument: ");
	scanf("%le", &a);
	printf("\n\n");
	printf("Pole kwadratu: %f\n", obszar(a));
	printf("Objetosc szescianu: %f\n", objetosc(a));
	return 0; //OK
}
