`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2026 18:21:34
// Design Name: 
// Module Name: alu
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


module alu (
    input        clk,
    input        rst,
    input  [3:0]  a,
    input  [3:0]  b,
    input  [1:0]  op,
    input        oe,
    output reg [3:0] result
);

    reg [3:0] a_reg;
    reg [3:0] b_reg;
    reg [1:0] op_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg  <= 4'd0;
            b_reg  <= 4'd0;
            op_reg <= 2'd0;
            result <= 4'd0;
        end
        else begin
            a_reg <= a;
            b_reg <= b;
            op_reg <= op;

            if (oe) begin
                case (op_reg)
                    2'b00: result <= a_reg + b_reg;
                    2'b01: result <= a_reg - b_reg;
                    2'b10: result <= a_reg & b_reg;
                    2'b11: result <= a_reg | b_reg;
                    default: result <= 4'd0;
                endcase
            end
            else begin
                result <= 4'd0;
            end
        end
    end

endmodule