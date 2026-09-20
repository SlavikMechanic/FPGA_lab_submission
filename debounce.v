`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2026 17:35:45
// Design Name: 
// Module Name: debounce
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


module debounce (
    input  clk,
    input  rst,
    input  button_in,
    output reg button_out
);

    reg button_sync1;
    reg button_sync2;
    reg button_prev;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            button_sync1 <= 1'b0;
            button_sync2 <= 1'b0;
            button_prev  <= 1'b0;
            button_out   <= 1'b0;
        end
        else begin
            button_sync1 <= button_in;
            button_sync2 <= button_sync1;

            if (button_sync2 && !button_prev)
                button_out <= 1'b1;
            else
                button_out <= 1'b0;

            button_prev <= button_sync2;
        end
    end

endmodule
