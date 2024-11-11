#include <LPC214X.h>  // Include the header file for the LPC2148 microcontroller

void delay();  // Declare delay function for timing between steps

// Delay Function
void delay() {
    int i, j;
    for (i = 0; i < 0xff; i++)
        for (j = 0; j < 0x25; j++);
}

int main() {
    IO0DIR = 0x000F0000;  // Set pins P0.16, P0.17, P0.18, and P0.19 as output pins

    while (1) {
        // Step sequence for anticlockwise rotation
        IO0PIN = 0x00080000;  // Set P0.19 high, all others low
        delay();
        IO0PIN = 0x00040000;  // Set P0.18 high, all others low
        delay();
        IO0PIN = 0x00020000;  // Set P0.17 high, all others low
        delay();
        IO0PIN = 0x00010000;  // Set P0.16 high, all others low
        delay();
    }
}
