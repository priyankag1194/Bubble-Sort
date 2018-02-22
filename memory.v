`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: Bubble Sort
// Module Name:Incrementer
//////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [4:0] Address;   
    input [7:0] WriteData;  
    input Clk;
    input MemWrite;         
    input MemRead;          

    output reg[7:0] ReadData; 

    reg [7:0] Memory[0:31];    
   
    always @(posedge Clk) begin      
        if (MemWrite==1)
            Memory[Address] = WriteData;
    end

    always @(Address or MemRead) begin
        if (MemRead == 1)
            ReadData <= Memory[Address];    
    else
        ReadData <= 8'h00;
    end 
    
    initial begin
                     Memory[0] = 32'h8;
                     Memory[1] = 32'h5;
                     Memory[2] = 32'h2;
                     Memory[3] = 32'h1;
                     Memory[4] = 32'h4;
                     Memory[5] = 32'h5;
                     Memory[6] = 32'h18;
                     Memory[7] = 32'h38;
                     Memory[8] = 32'h40;
                     Memory[9] = 32'h48;
                     Memory[10] = 32'h50;
                     Memory[11] = 32'h58;
                     Memory[12] = 32'h1c;
                     Memory[13] = 32'h3;
                     Memory[14] = 32'h4;
                     Memory[15] = 32'h5;
                     Memory[16] = 32'h6;
                     Memory[17] = 32'h1e;
                     Memory[18] = 32'h23;
                     Memory[19] = 32'h18;
                     Memory[20] = 32'h1e;
                     Memory[21] = 32'h24;
                     Memory[22] = 32'h2a;
                     Memory[23] = 32'h31;
                     Memory[24] = 32'h28;
                     Memory[25] = 32'h6;
                     Memory[26] = 32'h21;
                     Memory[27] = 32'h13;
                     Memory[28] = 32'hf;
                     Memory[29] = 32'hc;
                     Memory[30] = 32'h19;
                     Memory[31] = 32'h18;
                    
    end
        
endmodule
