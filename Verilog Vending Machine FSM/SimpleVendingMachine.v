`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2018 11:03:25 AM
// Design Name: 
// Module Name: SimpleVendingMachine
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


module SimpleVendingMachine(Clk, Rst, N, D, Q, Candy, Number);
    
    input Clk, Rst, N, D, Q;
    output reg Candy;
    output reg[5:0] Number;
    reg[5:0] internalNumber;
    reg[2:0] state, newState;
    
    parameter OFF = 0, WAIT = 1, NICKEL = 2, DIME = 3, QUARTER = 4, VEND = 5;
    parameter COST = 25;
    
    always @(posedge Clk) begin
        if (Rst) begin
            state <= OFF;
        end
        else begin
            state <= newState;
            Number <= internalNumber;
        end
    end
    
    always @(state, N, D, Q) begin
        Candy <= 0;
        case (state)
            OFF: begin
                internalNumber <= 0;
                newState = WAIT;
            end
            WAIT: begin
                internalNumber <= Number;
                if (Number >= COST) begin
                    internalNumber <= Number - COST;
                    newState <= VEND;
                end
                else if (N&~D&~Q) begin
                    newState <= NICKEL;
                end
                else if (~N&D&~Q) begin
                    newState <= DIME;
                end
                else if (~N&~D&Q) begin
                    newState <= QUARTER;
                end
                else begin
                    newState <= WAIT;
                end
            end
            NICKEL: begin
                internalNumber <= Number + 5;
                newState <= WAIT;
            end
            DIME: begin
                internalNumber <= Number + 10;
                newState <= WAIT;
            end
            QUARTER: begin
                internalNumber <= Number + 25;
                newState <= WAIT;
            end
            VEND: begin
                internalNumber <= Number;
                Candy <= 1;
                newState <= VEND;
            end
        endcase
    end
    
endmodule
