`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:Top Module for Sort
//Description: Verilog code for performing bubble sort. 
//t_sorted_data shows the sorted values after t_done is high
//////////////////////////////////////////////////////////////////////////////////
module sort_top ( t_go, t_rst, t_clk, t_n, t_sorted_data, t_done);

input t_go, t_rst, t_clk;
input [5:0] t_n;
output [7:0] t_sorted_data;

//output [3:0] t_state;
output t_done;
//output [4:0] t_address;
wire t_c_ld,t_c_clr,t_d_ld,t_d_clr,t_t1_ld,t_t1_clr,t_t2_ld,t_t2_clr,t_sel_add,t_sel_data,t_c_lt_n_1,t_d_lt_n_1_c,t_t1_gt_t2,t_re,t_we,t_i_clr,t_i_ld,t_i_lt_n_1;
wire [4:0] t_address;
wire [7:0] t_wdata;

controller sort_controller (t_clk,t_rst,t_go,t_c_ld,t_c_clr,t_d_ld,t_d_clr,t_t1_ld,t_t2_ld,t_sel_add,t_sel_data,t_c_lt_n_1,t_d_lt_n_1_c,t_t1_gt_t2,t_re,t_we,t_i_clr,t_i_ld,t_done,t_i_lt_n_1);

datapath sort_datapath(t_clk,t_c_clr,t_c_ld,t_d_ld,t_d_clr,t_t1_ld,t_t2_ld,t_sel_add,t_sel_data,t_c_lt_n_1,t_d_lt_n_1_c,t_t1_gt_t2,t_n,t_wdata,t_address,t_sorted_data,t_i_clr,t_i_ld,t_done,t_i_lt_n_1);

DataMemory sort_datamemory(t_address,t_wdata,t_clk,t_we,t_re,t_sorted_data); 

endmodule