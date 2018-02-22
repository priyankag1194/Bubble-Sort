`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:Comparator
//////////////////////////////////////////////////////////////////////////////////
module dp_comp(a,b,lt,gt,eq);
parameter datawidth = 8;
input [datawidth-1:0] a,b;
output reg lt,gt,eq;

always @(a or b) begin
lt <= 0;
gt <= 0;
eq <= 0;
	if (a<b)
		lt <= 1;
	else if (a>b)
		gt <= 1;
	else
		eq <= 1; 
end

endmodule

