`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:Register
//////////////////////////////////////////////////////////////////////////////////
module dp_reg(a,b,clk,clr,ld);

parameter datawidth = 8;
input[datawidth-1:0] a;
input clr, ld, clk;
output reg [datawidth-1:0] b;

always@(posedge clk) begin
	if (clr == 1)
		b <= 0;
	else if (ld == 1)
		b <= a;
	
end
endmodule
