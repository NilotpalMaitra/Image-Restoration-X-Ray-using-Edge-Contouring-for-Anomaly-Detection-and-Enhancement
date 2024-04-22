`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 23:54:30
// Design Name: 
// Module Name: anomalyremoval
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


module anomaly_removal(
    input wire clk,
    input wire rst,
    input wire [7:0] original_pixel,
    input wire [7:0] anomaly_pixel,
    output reg [7:0] modified_pixel
);

reg [7:0] background_color = 8'h00; // Background color (e.g., black)

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Reset logic
        modified_pixel <= 8'h00; // Initialize to background color
    end else begin
        // Check if the hexadecimal values match
        if (original_pixel == anomaly_pixel) begin
            // Replace the pixel with the background color
            modified_pixel <= background_color;
        end else begin
            // Keep the original pixel value
            modified_pixel <= anomaly_pixel;
        end
    end
end

endmodule
