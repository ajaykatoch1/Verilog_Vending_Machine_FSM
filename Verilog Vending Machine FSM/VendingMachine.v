`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2018 12:01:54 PM
// Design Name: 
// Module Name: VendingMachine
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


module VendingMachine(ClkIn, Reset, BN, BD, BQ, Candy, out7, en_out);
    
    input ClkIn, Reset, BN, BD, BQ;
    output Candy;
    output wire[6:0] out7;
    output wire[7:0] en_out;
    wire ClkOut, N, D, Q;
    wire [5:0] Number;
    
    ClkDiv CD(ClkIn, 1'b0, ClkOut);
    
    ButtonSynchronizer SN(ClkOut, Reset, BN, N);
    ButtonSynchronizer SD(ClkOut, Reset, BD, D);
    ButtonSynchronizer SQ(ClkOut, Reset, BQ, Q);
    
    SimpleVendingMachine Vendor(ClkOut, Reset, N, D, Q, Candy, Number);
    
    TwoDigitDisplay Out(ClkIn, Number, out7, en_out); 
    
endmodule
