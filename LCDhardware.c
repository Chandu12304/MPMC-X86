#include <LPC214x.h>  // Include header file for LPC214x microcontroller

// Function prototypes
void cmd(unsigned char d);        // Function to send command to LCD
void datal(unsigned char t);      // Function to send data to LCD
void delay (int count);           // Function to create a delay

int main()
{
    int i;
    unsigned char name[] = {"ARM_LPC2148"};  // Array holding characters to display

    IO0DIR = 0x30403C00;           // Set Port 0 pins as output for controlling LCD
    delay(100);                     // Initial delay for LCD power-on stabilization

    cmd(0x02);                      // Initialize cursor to home position
    cmd(0x01);                      // Clear the LCD display
    cmd(0x28);                      // Set 4-bit mode for LCD (0x38 for 8-bit mode)
    cmd(0x06);                      // Set entry mode (cursor moves right)
    cmd(0x0C);                      // Display on, cursor off

    // Display the characters in 'name' array one by one on the LCD
    for (i = 0; i < 11; i++)
    {
        datal(name[i]);             // Send each character to LCD
    }

    while(1);                       // Infinite loop to keep program running
}

// Function to send a command to the LCD
void cmd(unsigned char d)
{
    int a = 0;
    a = d | 0xFFFFFF0F;             // Mask lower 4 bits to set command bits
    IO0CLR |= 0x00003C00;           // Clear LCD data lines
    a = a << 6;                     // Shift the data bits into position

    IO0CLR = 0x20400000;            // Clear RS and RW (command mode)
    IO0SET = 0x10000000;            // Set Enable pin to high
    IO0SET = (IO0SET | 0x00003c00) & a; // Send higher nibble to LCD
    delay(1000);                    // Delay for command to be processed
    IO0CLR = 0x10000000;            // Set Enable pin to low

    a = 0x0;
    d = d << 4;                     // Prepare lower nibble
    a = d | 0xFFFFFF0F;
    IO0CLR |= 0x00003C00;           // Clear LCD data lines
    a = a << 6;                     // Shift lower nibble into position

    IO0CLR = 0x20400000;            // Clear RS and RW (command mode)
    IO0SET = 0x10000000;            // Set Enable pin to high
    IO0SET = (IO0SET | 0x00003C00) & a; // Send lower nibble to LCD
    delay(1000);                    // Delay for command to be processed
    IO0CLR = 0x10000000;            // Set Enable pin to low
}

// Function to send data (character) to the LCD
void datal(unsigned char t)
{
    int b = 0;
    b = t | 0xFFFFFF0F;             // Mask lower 4 bits to set data bits
    IO0CLR |= 0x00003C00;           // Clear LCD data lines
    b = b << 6;                     // Shift data bits into position

    IO0SET = 0x10400000;            // Set RS (data mode) and Enable
    IO0SET = (IO0SET | 0x00003C00) & b; // Send higher nibble to LCD
    delay(1000);                    // Delay for data to be processed
    IO0CLR = 0x10000000;            // Set Enable pin to low

    b = 0x0;
    t = t << 4;                     // Prepare lower nibble
    b = t | 0xFFFFFF0F;
    IO0CLR |= 0x00003C00;           // Clear LCD data lines
    b = b << 6;                     // Shift lower nibble into position

    IO0SET = 0x10400000;            // Set RS (data mode) and Enable
    IO0SET = (IO0SET | 0x00003C00) & b; // Send lower nibble to LCD
    delay(1000);                    // Delay for data to be processed
    IO0CLR = 0x10000000;            // Set Enable pin to low
}

// Delay function for timing control
void delay(int count)
{
    int j = 0, i = 0;
    for (j = 0; j < count; j++)     // Outer loop to control delay duration
        for (i = 0; i < 35; i++);   // Inner loop for finer delay increments
}
