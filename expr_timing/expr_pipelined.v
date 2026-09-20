`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2026 22:14:29
// Design Name: 
// Module Name: expr_pipelined
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


module expr_pipelined (
    input        clk,
    input        rst,
    input  [7:0]  a,
    input  [7:0]  b,
    input  [7:0]  c,
    input  [7:0]  d,
    output reg [23:0] result
);

    reg [7:0] a_reg, b_reg, c_reg, d_reg;

    reg [15:0] mult_ab;
    reg [15:0] mult_cd;
    reg [15:0] mult_ac;
    reg [15:0] mult_bd;

    reg [16:0] sum1;
    reg [16:0] sum2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg  <= 0;
            b_reg  <= 0;
            c_reg  <= 0;
            d_reg  <= 0;

            mult_ab <= 0;
            mult_cd <= 0;
            mult_ac <= 0;
            mult_bd <= 0;

            sum1 <= 0;
            sum2 <= 0;
            result <= 0;
        end
        else begin
            // Stage 1: register inputs and calculate multiplications
            a_reg <= a;
            b_reg <= b;
            c_reg <= c;
            d_reg <= d;

            mult_ab <= a_reg * b_reg;
            mult_cd <= c_reg * d_reg;
            mult_ac <= a_reg * c_reg;
            mult_bd <= b_reg * d_reg;

            // Stage 2: add multiplication results
            sum1 <= mult_ab + mult_cd;
            sum2 <= mult_ac + mult_bd;

            // Stage 3: final addition
            result <= sum1 + sum2;
        end
    end

endmodule
