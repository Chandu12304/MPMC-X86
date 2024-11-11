#include <lpc21xx.h> 

// Declare global variables
int a = 6;      
int b = 2;      
int sum;        
int sub;        
int mul;        
int div;        
int and_result;   // Variable to store the AND result
int or_result;    // Variable to store the OR result
int xor_result;   // Variable to store the XOR result
int not_result;   // Variable to store the NOT result of 'a'

int main(void)
{
    // Arithmetic operations
    sum = a + b;    
    sub = a - b;    
    mul = a * b;    
    div = a / b;    

    // Logical operations
    and_result = a & b;  // Perform bitwise AND operation
    or_result = a | b;   // Perform bitwise OR operation
    xor_result = a ^ b;  // Perform bitwise XOR operation
    not_result = ~a;     // Perform bitwise NOT operation on 'a'

    // Infinite loop
    while (1) { }
}
