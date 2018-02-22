`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:Testbench for Sort
//////////////////////////////////////////////////////////////////////////////////
module sort_TB();
reg Clk;
reg Go, Rst;
reg[5:0] N;
wire [7:0] Sorted_Data;
//wire [3:0] State;
wire  t_done;
//wire [4:0] t_address;
integer i;

sort_top my_sort( Go, Rst, Clk, N, Sorted_Data, t_done);
always begin
	Clk <=1;
	#5;
	Clk<=0;
	#5;
end

initial begin
Rst <=1;
Go<=0;
N<=32;

@(posedge Clk);
#105;
Rst <=0;
Go <= 1;
@(posedge Clk);
#5;
Go <=0;

for (i=0; i<10000;i=i+1) begin
	@(posedge Clk);

  
end

end
endmodule
