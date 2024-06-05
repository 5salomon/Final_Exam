`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2015 12:39:26 AM
// Design Name: 
// Module Name: top
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

module tt_um_Vita224_top(

input  wire [7:0] ui_in,    // Dedicated inputs
output wire [7:0] uo_out,   // Dedicated outputs
input  wire [7:0] uio_in,   // IOs: Input path
output wire [7:0] uio_out,  // IOs: Output path
output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
input  wire       ena,      // will go high when the design is enabled
input  wire       clk,      // clock
input  wire       rst_n,     // reset_n - low to reset
  
input [7:0]sw,
input btn0,
input btn1,
input clk,
output TxD,
output TxD_debug,
output transmit_debug,
output button_debug, 
output clk_debug
); 

wire transmit;
assign TxD_debug = TxD;
assign transmit_debug = transmit;
assign button_debug = btn1;
assign clk_debug = clk;


transmit_debouncing D2 (.clk(clk), .btn1(btn1), .transmit(transmit));
transmitter T1 (.clk(clk), .reset(btn0),.transmit(transmit),.TxD(TxD),.data(sw));


endmodule
