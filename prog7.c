#include <lpc21xx.h> 

// Declare global variables
int a = 6;      
int b = 2;      
int sum;        
int sub;        
int mul;        
int div;        
int and_result;   
int or_result;    
int xor_result;   
int not_result;

int main(void)
{
    sum = a + b;    
    sub = a - b;    
    mul = a * b;    
    div = a / b;    

    and_result = a & b;  
    or_result = a | b;   
    xor_result = a ^ b;  
    not_result = ~a;    

    // Infinite loop
    while (1) { }
}
