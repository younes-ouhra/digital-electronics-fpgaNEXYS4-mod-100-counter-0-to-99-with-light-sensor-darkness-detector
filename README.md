# Digital Electronics - FPGA NEXYS4 MOD-100 Counter (0 to 99) with Light Sensor / Darkness detector
## About
<p>This project was built along with the Laboratory Digital Electronics at the Technical University of Applied Sciences of Regensburg (OTH Regensburg), Bavaria, Germany. It is about programming the FPGA-Board as a MOD-100 counter und controlling the tempo of its counter by using an extern signal.<br>This signal is the output of a darkness sensor.</p>

## TESTS - MOD-10 Counter (0 to 9) with a Push-button and a Switch from the FPGA-Board (internal signal)
<p>This was about testing and verifying the logic of the VHDL-Code and see if the results are matching the expectations.</p>
<p>In the following video, you can see the result of the first test and how the number on the 7-segment display increment when the I pushed the the butten. However the counting was not regularly because of the glitches on the push-button.</p>

<div align="center">
  <video src="https://github.com/user-attachments/assets/b5ce4728-0fd7-4697-904e-a23f70b88978">
</div>

<b>Button glitches on development board:</b>
<p>Push buttons and toggle switches are all subject to bouncing. Bouncing occurs when the switch is toggled or flipped. It happens in all switches as a result of the metal contacts coming together and apart quickly before they have time to settle out.</p>
<br>
<div align="center">
  <img src="https://github.com/user-attachments/assets/1dcc6e03-3993-4f39-8f01-4e17bee6f4d6"><sub>(1)</sub>
</div>
<br>
<p>To do this in an FPGA, the simplest thing to do is to create a process (in VHDL) or an always block that samples the switch input. Once the switch input has been stable for enough time, the input is stable and can be sent to the rest of your code. A good amount of time for this is several milliseconds at a minimum.</p>

<p>In my case I did not choose to fix the glitches of the push-button and I just tried with a switch. The results was as expected.</p>

<div align="center">
  <video src="https://github.com/user-attachments/assets/f6da9d67-7d8d-4a7f-b1b9-60c3bffefa3c">
</div>

## TEST - MOD-100 Counter (0 to 99) with a selfmade Light Sensor (external signal)
### The Light Sensor
<p>For this project, I employed a photoresistor sensor that has sensitivity to all wavelengths of visible light, even infrared and ultraviolet wavelengths. A photoresistor (also known as a light-dependent resistor, LDR) is a passive component that decreases its resistance as the luminosity (light) on it increases.<br>
</p>

<div>
    Components Required:<br>
      <ul>
        <li>1 x LDR (Light Dependent Resistor)</li>
        <li>1 x NPN-Transistor (BC547)</li>
        <li>2 x Resistors (470Ohm and 1K)</li>
        <li>Power Supply 3-12V (I used the Power Supply from the Analog Discovery 2)</li>
        <li>Few breadboard connectors</li>
      </ul>
</div>

<div align="center">
    <img src="https://github.com/user-attachments/assets/2ab5a190-199e-4e00-b30c-5c4a55ea187a" width="450"><sub>(2)</sub>
</div>

<p></p>








