`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:Controller for Sort
//////////////////////////////////////////////////////////////////////////////////
module controller(c_clk,c_rst,c_go,c_c_ld,c_c_clr,c_d_ld,c_d_clr,c_t1_ld,c_t2_ld,c_sel_add,c_sel_data,c_c_lt_n_1,c_d_lt_n_1_c,c_t1_gt_t2, c_re, c_we,c_i_clr,c_i_ld,c_done,c_i_lt_n_1);

input c_clk,c_rst,c_go,c_c_lt_n_1,c_d_lt_n_1_c,c_t1_gt_t2,c_i_lt_n_1;
output reg c_c_ld,c_c_clr,c_d_ld,c_d_clr,c_t1_ld,c_t2_ld,c_sel_add,c_sel_data,c_re,c_we,c_i_clr,c_i_ld,c_done;
//output reg [3:0] c_state;

reg [3:0] state, nstate;

parameter [3:0] s_wait = 0, init_c = 1, check_c = 2, init_d = 3, check_d = 4, read_t1 = 5, read_t2 = 6, check_t1_t2 = 7, write_t1 = 8, write_t2 = 9, inc_d = 10, inc_c = 11, check_i = 12, read_sorted = 13, inc_i = 14;

always@(state, c_go, c_c_lt_n_1, c_d_lt_n_1_c, c_t1_gt_t2, c_i_lt_n_1) begin

c_c_ld <= 0;
c_c_clr <= 0;
c_d_ld <= 0;
c_d_clr <= 0;
c_t1_ld <= 0;
c_t2_ld <= 0;
c_sel_add <= 0;
c_sel_data <= 0;
c_we <= 0;
c_i_clr <= 0;
c_i_ld <= 0;
//c_state <= 0;
	
case(state)
	s_wait: begin
	   c_done <= 0;
	   //c_state <= 0;
	   c_re <= 0;
	   if (c_go == 0 )
			nstate <= s_wait;
	   else
			nstate <= init_c;
	end
	
	init_c: begin
	   //c_state <= 1;
	   c_c_clr <= 1;
	   c_c_ld <= 0;
	   c_d_clr <= 0;
	   c_d_ld <= 0;
	   c_i_clr <= 1;
       c_i_ld <= 0;
       c_re <= 0;
	   nstate <= check_c;	
	end
	
	check_c: begin
	   //c_state <= 2;
	   c_c_clr <= 0;
	   c_c_ld <= 0;
	   if (c_c_lt_n_1 == 1)
		  nstate <= init_d;
	   else 
		  nstate <= check_i;
	end
	
	init_d: begin
	   //c_state <= 3;
	   c_d_clr <= 1;
	   nstate <= check_d;
	end
	
    check_d: begin
	   //c_state <= 4;
	   c_d_clr <= 0;
	   c_d_ld <= 0;
	   if (c_d_lt_n_1_c == 1)
		  nstate <= read_t1;
	   else 
		  nstate <= inc_c;
	end
		
	read_t1: begin
	   //c_state <= 5;
	   c_t1_ld <= 1;
	   c_sel_add <= 0;
	   c_done <= 0;
	   c_re <= 1;
	   nstate <= read_t2;
	end
	
	read_t2: begin
	   //c_state <= 6;
	   c_t1_ld <= 0;
	   c_t2_ld <= 1;
	   c_sel_add <= 1;
	   c_done <= 0;
	   c_re <= 1;
	   nstate <= check_t1_t2;
	end
	
	check_t1_t2: begin
	   //c_state <= 7;
	   c_t2_ld <= 0;
	   c_re <= 0;
	   if (c_t1_gt_t2 == 1)
	       nstate <= write_t1;
		else
		   nstate <= inc_d;
	end
	
	write_t1: begin
	   //c_state <= 8;
	   c_we <= 1;
	   c_sel_add <= 1;
	   c_sel_data <= 0;
	   c_done <= 0;
	   nstate <= write_t2;
	end
	
	write_t2: begin
	   //c_state <= 9;
	   c_we <= 1;
	   c_sel_add <= 0;
	   c_sel_data <= 1;
	   c_done <= 0;
	   nstate <= inc_d;
	end
	
	inc_d: begin
	   //c_state <= 10;
	   c_d_ld <= 1;
	   c_we <= 0;
	   c_re <= 0;
	   nstate <= check_d;
	end
	
	inc_c: begin
	   //c_state <= 11;
	   c_c_ld <= 1;
	   nstate <= check_c;
	end
	
	check_i: begin
	   //c_state <= 12;
	   c_i_clr <= 0;
       c_i_ld <= 0;
       c_done <= 1;    
       if (c_i_lt_n_1 == 1)
          nstate <= read_sorted;
       else 
          nstate <= s_wait;
    end
    
    read_sorted: begin
        //c_state <= 13;
        c_re <= 1;
        c_done <= 1;
        nstate <= inc_i;
     end
       
     inc_i: begin
        //c_state <= 14;
        c_done <= 1;
        c_i_ld <= 1;
        nstate <= check_i;
     end 
    
	default: begin
		nstate <= s_wait;
	end

	endcase
end

// register process

always@(posedge c_clk) begin
	if (c_rst==1) begin
		state <= s_wait;
	end
	else begin
	   state <= nstate;
	end
end

endmodule
