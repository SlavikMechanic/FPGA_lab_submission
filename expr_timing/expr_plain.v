`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2026 19:15:06
// Design Name: 
// Module Name: expr_plain
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


module expr_plain (
    input        clk,
    input        rst,
    input  [7:0]  a,
    input  [7:0]  b,
    input  [7:0]  c,
    input  [7:0]  d,
    output reg [23:0] result
);

    reg [7:0] a_reg, b_reg, c_reg, d_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg <= 0;
            b_reg <= 0;
            c_reg <= 0;
            d_reg <= 0;
            result <= 0;
        end
        else begin
            a_reg <= a;
            b_reg <= b;
            c_reg <= c;
            d_reg <= d;

            result <= (a_reg * b_reg) + (c_reg * d_reg)
                    + (a_reg * c_reg) + (b_reg * d_reg);
        end
    end

endmodule
