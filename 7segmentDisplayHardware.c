#include <LPC214x.H> // Header file for LPC2148 microcontroller, includes register definitions

void delay_led(unsigned long int count1); // Function declaration for delay

int main(void) {
    IO0DIR = 0x000007FC; // Configures pins P0.2 to P0.10 as output

    while(1) { // Infinite loop to keep the LED pattern running
        IO0CLR = 0x00000FFF; // Clear (turn off) the lower 12 bits of Port 0 (P0.0 - P0.11)
        
        IO0SET = 0x00000604; // Set pattern 1 on output pins
        delay_led(150000);   // Delay to hold pattern

        IO0CLR = 0x00000FFF;
        IO0SET = 0x000007E4; // Set pattern 2 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000648; // Set pattern 3 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000618; // Set pattern 4 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000730; // Set pattern 5 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000690; // Set pattern 6 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000680; // Set pattern 7 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x0000063C; // Set pattern 8 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000600; // Set pattern 9 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000630; // Set pattern 10 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000620; // Set pattern 11 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000780; // Set pattern 12 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x000006C4; // Set pattern 13 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x00000708; // Set pattern 14 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x000006C0; // Set pattern 15 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF;
        IO0SET = 0x000006E0; // Set pattern 16 on output pins
        delay_led(150000);

        IO0CLR = 0x00000FFF; // Clear all pins at the end of the loop
    }
}

void delay_led(unsigned long int count1) {
    while(count1 > 0) {
        count1--; // Simple loop-based delay
    }
}
