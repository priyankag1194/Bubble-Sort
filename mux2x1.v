`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:2x1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////
module dp_mux2x1(a,b,sel,c);
parameter datawidth = 8;
input [datawidth-1:0] a,b;
input sel;
output reg [datawidth-1:0] c;

always@(a or b or sel) begin
	if (sel == 1)
		c <= a;
	else
		c <= b;
end

endmodule
