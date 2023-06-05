# C - Notes
--------------------------------------------------

## PreReqs

### Debian Build Packages
* sudo apt-get install build-essential -y



-------------------------------------------------

## Compile

### Basic Compile
```
// produces a.out file
cc program.c 
```



------------------------------------------------
## Types

### Integer Types (Specific)

Starting in C99 you can specifiy integer of an exact type
* int<n>_ t or uint<n>_t				-> Forms for exact width integer types
* Int_least<n>_t> or uint_least<n>_t	-> Forms for the smallest width of an integer
* Int_fast<n>_t	or uint_fast<n>_t		-> Forms for the fastest width for an integer
	**n** is either 8, 16, 32, or 64

### Floating Point
Original version is base on base2 (can cause issus for very large and very small values)
* float			-> 4 bytes
* double		-> 8 bytes
* long double	-> 16 bytes

As of C23 - base10 representation
* _Decimal32		-> 4 bytes
* _Decimal64		-> 8 bytes
* _Decimal128		-> 16 bytes

### Complex Numbers
Introduced in C99
* Library -> complex.h

* float _Complex			-> 8 bytes
* double_Complex			-> 16 bytes
* long double _Complex		-> 32 bytes
* float _Imaginary			-> 4 bytes
* double _Imaginary			-> 8 bytes
* double _Imaginary			-> 16 bytes


### Boolean
* libary -> **stdbool.h**

### Types Size Limit Libraries
* Integers	-> **limits.h**
* Fload		-> **float.h**
