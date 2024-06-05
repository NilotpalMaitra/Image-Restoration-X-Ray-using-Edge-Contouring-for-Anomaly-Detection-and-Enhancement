


Nilotpal Maitra-22ECB0F07 
Darsh Tibrewal-22ECB0F05 

Guided by: 
                                      Dr.P. Prithvi 

DEPARTMENT OF ELECTRONICS AND COMMUNICATION ENGINEERING NATIONAL INSTITUTE OF TECHNOLOGY, WARANGAL 
2023-2024



# Introduction

This project aims to design and implement an image restoration system using edge contouring on a Field Programmable Gate Array (FPGA). The system is designed to detect anomalies in images, such as a metal piece in a patient’s X-ray, and restore the image to its original form. The restoration process leverages the information from neighboring pixels and the edges detected in the image. The edge contouring technique helps in predicting the values of the corrupted or missing pixels, thereby restoring the image. The entire process, including image acquisition, preprocessing, edge detection, anomaly detection, image restoration, post processing, and display/storage, is implemented on an FPGA. The parallel processing capabilities of FPGAs make them well-suited for this kind of high-speed image processing task. The project uses Verilog, a hardware description language, for the design and implementation of the digital circuits on the FPGA. The effectiveness of the restoration process is validated through rigorous testing. This project represents a significant contribution to real-time image processing applications, particularly in the medical imaging field.

# Working 

2)Functionality of each sub-block in the block diagram: 
The Verilog code takes the pixel values of images stored in the text file and performs a set of operations that are required based on conditions to transform the set of pixel values.
The first module named Main that performs byte-level operations based on the select input and input values. 
Input Ports:
clk: Clock input signal.
select: 2-bit input used to select different operations.
value, threshold: 8-bit inputs used as comparison values.
in_byte: 8-bit input representing a byte value.
Output Port:
out_byte: 8-bit output representing the result of operations based on the select input.
Internal Signal:
parser: 8-bit register used to store intermediate computation results.
Behavior:
The module has an always block sensitive to the positive edge of the clock (posedge clk). Inside this block, it performs different operations based on the value of the select input.
The select input determines which operation to perform:
select = 00: Adds the value to in_byte. If the result exceeds 255 (maximum 8-bit value), it saturates at 255 (8'b11111111).
select = 01: Subtracts the value from in_byte. If the result is negative, it saturates at 0 (8'b00000000).
select = 10: Checks if in_byte is greater than threshold. If true, outputs 255 (8'b11111111); otherwise, outputs 0 (8'b00000000).
select = 11: Performs a bitwise inversion of in_byte. It calculates the two's complement of in_byte by subtracting it from 255 (8'b11111111).
The output out_byte is assigned the value of parser, which holds the result of the selected operation.

The next Module just performs an extra operation of comparison between the anomaly pixel values and the threshold_anomaly pixel values.
If the values are the same, it replaces it with black color, otherwise it keeps it the same as the pixel values of the anomaly image.
Since it is difficult to process an image directly on Vivado Xilinx, therefore it is necessary to convert the image into its respective pixel values.
So, this was fulfilled by the usage of python and its library called OpenCV.

3)Process: 

First we took a sample image(X-ray) of a hand from Google, with size 256x382 giving us around 97992 pixels to process.
We created our own dataset by creating an anomaly in the image. After that we performed the image enhancement to refine the image to process it further.


After this the image was transformed using the threshold operation.
The original(anomaly) image and the converted threshold images pixel values were compared to detect the anomaly pixel values which were then restored back to the original values.
