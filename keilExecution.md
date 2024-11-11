Keil uVision 4 can still work for programming the LPC2148 microcontroller, as it supports ARM7 devices like the LPC2148. Here’s how you can use Keil uVision 4 for your project:

### 1. Setting Up Keil uVision 4 for LPC2148
1. Open **Keil uVision 4**.
2. Go to **Project > New uVision Project**.
3. Choose a location and give your project a name, then click **Save**.
4. In the device selection window, find **NXP (Philips)**, and then select **LPC2148**. Click **OK**.

If it prompts to add the **Startup.s** file, select **Yes**. This file initializes the microcontroller.

### 2. Adding and Configuring Project Files
1. In the Project window, right-click on **Source Group 1** and select **Add New Item to Group 'Source Group 1'**.
2. Choose **C File (.c)**, name it (e.g., `main.c`), and click **Add**.
3. Open `main.c` and paste your code.

### 3. Configure the Target Settings
1. Go to **Project > Options for Target 'Target 1'**.
2. Set **XTAL (MHz)** to 12.0 (or the correct value for your hardware).
3. Under the **Output** tab, check **Create HEX File**.

### 4. Building and Testing
1. Click **Project > Build Target** or press **F7** to compile.
2. If there are no errors, go to **Debug > Start/Stop Debug Session** to simulate the program in uVision 4.

### 5. Run and Check Output Using the Watch Window
Set up the Watch Window:

In Debug mode, open the Watch window by going to View > Watch Window > Watch 1.
This window lets you track the values of variables during code execution.
Add Variables to the Watch Window:

In Watch 1, click on an empty row and type the name of the variable you want to watch (e.g., sum, sub, mul, and div).
Press Enter to add each variable. You should now see a, b, sum, sub, mul, and div listed in the Watch window.

### Optional: Flashing to LPC2148
Since Keil uVision 4 doesn't have a direct flashing option, you may need to use external tools like **Flash Magic** to upload the generated `.hex` file to your LPC2148 board.

Keil uVision 4 should work well for your LPC2148 project, even though Keil 5 is more current. Let me know if you have questions about using Keil 4 for specific features.
