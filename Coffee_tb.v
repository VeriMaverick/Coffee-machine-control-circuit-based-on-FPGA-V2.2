// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "04/22/2023 16:17:19"
                                                                                
// Verilog Test Bench template for design : Coffee
// 
// Simulation tool : ModelSim (Verilog)
// 

`timescale 1 ps/ 1 ps
module Coffee_tb();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg RSTN;
reg Clock;
reg cof_rdy;
reg cup_rdy;
reg half_yuan;
reg one_yuan;
// wires                                               
wire Release_cof;
wire Place_cup;

// assign statements (if any)                          
Coffee i1 (
// port map - connection between master ports and signals/registers   
	.RSTN_n(RSTN),
	.Release_cof(Release_cof),
	.Clock(Clock),
	.cof_rdy(cof_rdy),
	.cup_rdy(cup_rdy),
	.half_yuan(half_yuan),
	.one_yuan(one_yuan),
	.Place_cup(Place_cup)
);

parameter Clock_p=20;
initial 
Clock=0;
always #(Clock_p/2) Clock=~Clock;

initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
 
RSTN=0;  
one_yuan=0;
half_yuan=0;
cup_rdy=0; 
cof_rdy=0;
#100 RSTN=1; 
#100 one_yuan=1; 
#100 one_yuan=0;
#100 one_yuan=1; 
#100 one_yuan=0;
#100 one_yuan=1; 
#100 one_yuan=0;
#200 cup_rdy=1; 
#200 cup_rdy=0;
#200 cof_rdy=1;
#200 cof_rdy=0;

#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#200 cup_rdy=1; 
#200 cup_rdy=0;
#200 cof_rdy=1;
#200 cof_rdy=0;

#100 one_yuan=1; 
#100 one_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#200 cup_rdy=1; 
#200 cup_rdy=0;
#200 cof_rdy=1;
#200 cof_rdy=0;

#100 one_yuan=1; 
#100 one_yuan=0;
#100 one_yuan=1; 
#100 one_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#100 half_yuan=1; 
#100 half_yuan=0;
#200 cup_rdy=1; 
#200 cup_rdy=0;
#200 cof_rdy=1;
#200 cof_rdy=0;


#2000 $stop;
 
// --> end                                             
$display("Running testbench");                       
end                                                    
always                                                 
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin                          
                                                       
@eachvec;                                              
// --> end                                             
end                                                    
endmodule

