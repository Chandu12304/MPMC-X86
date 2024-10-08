//7a
#include <lpc21xx.h>  // Include the LPC2148 specific header file

// Main function
int main(void)
{
    // Variable declaration
    int a = 6;      // First operand
    int b = 2;      // Second operand
    int sum;        // Variable to store the sum
    int sub;        // Variable to store the difference
    int mul;        // Variable to store the product
    int div;        // Variable to store the quotient

    // Arithmetic operations
    sum = a + b;    // Perform addition
    sub = a - b;    // Perform subtraction
    mul = a * b;    // Perform multiplication
    div = a / b;    // Perform division

    // Infinite loop to keep the program running
    while (1)
    {
        // Optional: Implement code to display results or wait here
    }

    return 0;       // Return statement (not reachable)
}

//7b
#include <lpc21xx.h>  // Include the LPC2148 specific header file

// Main function
int main(void)
{
    // Variable declaration
    int a = 3;        // First operand
    int b = 7;        // Second operand
    int and_result;   // Variable to store the AND result
    int or_result;    // Variable to store the OR result
    int xor_result;   // Variable to store the XOR result
    int not_result;    // Variable to store the NOT result of 'a'

    // Logical operations
    and_result = a & b;  // Perform bitwise AND operation
    or_result = a | b;   // Perform bitwise OR operation
    xor_result = a ^ b;  // Perform bitwise XOR operation
    not_result = ~a;     // Perform bitwise NOT operation on 'a'

    // Infinite loop to keep the program running
    while (1)
    {
        // Optional: Implement code to display results or wait here
    }

    return 0;           // Return statement (not reachable)
}