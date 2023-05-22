#include <stdio.h>
#include <math.h>

double celsusToFahrenheit(double degreesC);

double fahrenheitToCelsius(double degreesF);

int main()
{
	int c = 0;
	int f = 32;

	printf("%4d Celsius	is %4d Fahrenheit\n", c, (int) celsusToFahrenheit(c));
	printf("%4d Fahrenheit is %4d Celsius\n\n", f, (int)fahrenheitToCelsius(f));
	
	c = 100;
	f= 212;
	
	printf("%4d Celsius	is %4d Fahrenheit\n", c, (int) celsusToFahrenheit(c));
	printf("%4d Fahrenheit is %4d Celsius\n\n", f, (int)fahrenheitToCelsius(f));
	
	return 0;
}

double celsusToFahrenheit(double degreesC)
{
	return (degreesC * 9.0 / 5.0) + 32;
}

double fahrenheitToCelsius(double degreesF)
{
	return (degreesF - 32) * 5.0 / 9.0;
}




