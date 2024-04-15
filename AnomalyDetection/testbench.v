`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 23:55:24
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench();

reg clk;
reg rst;
reg [7:0] original_pixel;
reg [7:0] anomaly_pixel;
wire [7:0] modified_pixel;
reg [7:0] expected_modified_pixel;
reg [7:0] file_input_original_pixel;
reg [7:0] file_input_anomaly_pixel;
reg [7:0] file_output_modified_pixel;
integer file_original;
integer file_anomaly;
integer file_modified;
integer i;

anomaly_removal uut(
    .clk(clk),
    .rst(rst),
    .original_pixel(original_pixel),
    .anomaly_pixel(anomaly_pixel),
    .modified_pixel(modified_pixel)
);

initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;

    // Reset
    rst = 1;
    #10 rst = 0;

    // Open input files
    file_original = $fopen("D:\\.vscode\\py\\outputoriginal.txt", "r");
    file_anomaly = $fopen("D:\\.vscode\\Python Scripts\\anomalyimage.txt", "r");

    // Read input files and compare with expected output
    for (i = 0; i < 100; i = i + 1) begin
        $fscanf(file_original, "%h", file_input_original_pixel);
        $fscanf(file_anomaly, "%h", file_input_anomaly_pixel);

        original_pixel = file_input_original_pixel;
        anomaly_pixel = file_input_anomaly_pixel;

        // Calculate expected output (for demonstration purposes)
        expected_modified_pixel = (original_pixel == anomaly_pixel) ? 8'h00 : anomaly_pixel;

        // Wait for some time to observe output
        #10;

        // Compare with expected output
        if (modified_pixel !== expected_modified_pixel) begin
            $display("Test failed at time %0t. Expected: %h, Actual: %h", $time, expected_modified_pixel, modified_pixel);
            $finish;
        end
    end

    // Close files
    $fclose(file_original);
    $fclose(file_anomaly);
    $finish;
end

always #5 clk = ~clk;

endmodule
