`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:Datapath for Sort
//////////////////////////////////////////////////////////////////////////////////
module datapath(d_clk,d_c_clr,d_c_ld,d_d_ld,d_d_clr,d_t1_ld,d_t2_ld,d_sel_add,d_sel_data,d_c_lt_n_1, d_d_lt_n_1_c, d_t1_gt_t2,d_n,d_wdata,d_address, d_rdata,d_i_clr, d_i_ld, d_done,d_i_lt_n_1);

input [7:0] d_rdata;
input [5:0] d_n;
input d_clk,d_c_clr,d_c_ld,d_d_ld,d_d_clr,d_t1_ld,d_t2_ld,d_sel_add,d_sel_data,d_i_clr,d_i_ld,d_done;

output d_t1_gt_t2,d_c_lt_n_1,d_d_lt_n_1_c,d_i_lt_n_1;
output [4:0] d_address;
output [7:0] d_wdata;

wire [5:0] d_c_input,d_c_val,d_d_input,d_d_val,d_n_1,d_n_1_c,d_i_input,d_i_val,d_add_d;
wire [7:0] d_temp1,d_temp2;

dp_reg #(.datawidth (6)) c_reg (d_c_input, d_c_val,d_clk,d_c_clr,d_c_ld);
dp_inc #(.datawidth (6)) c_inc (d_c_val, d_c_input);
dp_sub #(.datawidth (6)) c_sub (d_n,1,d_n_1);
dp_comp #(.datawidth (6)) c_lt(d_c_val,d_n_1,d_c_lt_n_1,,);

dp_reg #(.datawidth (6)) d_reg (d_d_input, d_d_val,d_clk,d_d_clr,d_d_ld);
dp_inc #(.datawidth (6)) d_inc (d_d_val, d_d_input);
dp_sub #(.datawidth (6)) d_sub (d_n_1,d_c_val,d_n_1_c);
dp_comp #(.datawidth (6)) d_lt(d_d_val,d_n_1_c,d_d_lt_n_1_c,,);
dp_mux2x1 #(.datawidth (6)) mux2x1_1 (d_d_input, d_d_val, d_sel_add,d_add_d);

dp_reg #(.datawidth (6)) i_reg (d_i_input, d_i_val,d_clk,d_i_clr,d_i_ld);
dp_inc #(.datawidth (6)) i_inc (d_i_val, d_i_input);
dp_comp #(.datawidth (6)) i_lt(d_i_val,d_n_1,d_i_lt_n_1,,);

dp_mux2x1 #(.datawidth (5)) mux2x1_2 (d_i_val, d_add_d, d_done,d_address);

dp_reg #(.datawidth (8)) temp1_reg (d_rdata, d_temp1,d_clk,0,d_t1_ld);
dp_reg #(.datawidth (8)) temp2_reg (d_rdata, d_temp2,d_clk,0,d_t2_ld);
dp_comp #(.datawidth (8)) t1t2_gt(d_temp1,d_temp2,,d_t1_gt_t2,);

dp_mux2x1 #(.datawidth (8)) mux2x1_3 (d_temp2,d_temp1,d_sel_data,d_wdata);

endmodule
