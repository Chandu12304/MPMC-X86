#include <LPC214x.h> // Include header file for LPC2148 microcontroller

void delay(unsigned long int count1); // Function declaration for delay

void main() {
    unsigned int number = 0x01000000; // Set number as 0x01000000 (binary 0001 0000 0000 0000 0000 0000 0000)
    IO1DIR = 0x0F000000; // Configure P1.24 - P1.27 as output pins

    while (1) { // Infinite loop to keep checking the input pin
        if (IO0PIN & 0x00008000) { // Check if P0.15 is high (input condition)
            while (!(IO0PIN & 0x00008000)); // Wait until the button is released
            IO1SET = number; // Set P1.24 high (turn on LED or output device)
            delay(200); // Delay to hold the output in ON state
            IO1CLR = number; // Clear P1.24 (turn off LED or output device)
            delay(200); // Delay to create a visible OFF state
        }
        else if (IO0PIN & 0x00008000) { // Redundant condition, can be removed
            while (IO0PIN & 0x00008000); // Wait until the button is released
            IO1CLR = number; // Ensure output is turned off
        }
    }
}

void delay(unsigned long int count1) {
    while (count1 > 0) {
        count1--; // Loop decreases counter to create delay
    }
}
