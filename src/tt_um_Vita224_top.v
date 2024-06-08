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

//module top(
//input [7:0]sw,
//input btn0,
//input btn1,
//input clk,
//output TxD,

//); 
module tt_um_Vita224_top(
    input wire [7:0] ui_in, // Dedicated inputs
    output wire [7:0] uo_out, // Dedicated outputs
    input wire [7:0] uio_in, // IOs: Input path
    output wire [7:0] uio_out, // IOs: Output path
    output wire [7:0] uio_oe, // IOs: Enable path (active high: 0=input, 1=output)
    input wire ena, // always 1 when the design is powered, so you can ignore it
    input wire clk, // clock
    input wire rst_n // reset_n - low to reset
);

wire transmit;
//assign TxD_debug = tx;
//assign transmit_debug = transmit;
//assign button_debug = btn1;
//assign clk_debug = clk;

    wire tx;
    assign uo_out[0]=1'b0;
	assign uo_out[1]=1'b0;
	assign uo_out[2]=1'b0;
	assign uo_out[3]=1'b0;
	assign uo_out[4]=tx;
	assign uo_out[5]=1'b0;
	assign uo_out[6]=1'b0;
	assign uo_out[7]=1'b0;
	
//	assign uio_in[1]=1'b0;
//	assign uio_in[2]=1'b0;
//	assign uio_in[3]=1'b0;
//	assign uio_in[4]=1'b0;
//	assign uio_in[5]=1'b0;
//	assign uio_in[6]=1'b0;
//	assign uio_in[7]=1'b0;
	
	assign ena=1'b0;
	
assign uio_out = 8'b00000000;
assign uio_oe = 8'b00000000;


	transmit_debouncing D2 (.clk(clk), .uio_in(uio_in[0]), .transmit(transmit));
transmitter T1 (.clk(clk), .rst_n(rst_n),.transmit(transmit),.tx(tx),.data(ui_in));


endmodule
