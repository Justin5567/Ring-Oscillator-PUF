`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 11:01:32
// Design Name: 
// Module Name: RO
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


module RO(
	input clk,
	input rst,
	input in_valid,
	input [3:0] challange,
	output reg[1:0] out_led
);
	// reg wire declaration
	(* dont_touch = "yes" *) wire[7:0] ro_out;
	(* dont_touch = "yes" *) wire mux_out1;
	(* dont_touch = "yes" *) wire mux_out2;
	
	(* dont_touch = "yes" *) reg done1;
	(* dont_touch = "yes" *) reg done2;
	(* dont_touch = "yes" *) reg [15:0]on_counter;
	(* dont_touch = "yes" *) wire n_in_valid = &on_counter;
	(* dont_touch = "yes" *) reg [29:0] cnt1;
	(* dont_touch = "yes" *) reg [29:0] cnt2;

	


	// submodule declaration
	//ro
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro1 (.enable(n_in_valid), .out(ro_out[0]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro2 (.enable(n_in_valid), .out(ro_out[1]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro3 (.enable(n_in_valid), .out(ro_out[2]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro4 (.enable(n_in_valid), .out(ro_out[3]));
	
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro5 (.enable(n_in_valid), .out(ro_out[4]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro6 (.enable(n_in_valid), .out(ro_out[5]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro7 (.enable(n_in_valid), .out(ro_out[6]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro8 (.enable(n_in_valid), .out(ro_out[7]));


	//mux
	(* dont_touch = "yes",keep_hierarchy = "yes" *) mux4to1 mux1(ro_out[0],ro_out[1],ro_out[2],ro_out[3],challange[1:0],mux_out1);
	(* dont_touch = "yes",keep_hierarchy = "yes" *) mux4to1 mux2(ro_out[4],ro_out[5],ro_out[6],ro_out[7],challange[3:2],mux_out2);
	
	
	
	
	
	always@(posedge mux_out1 or posedge rst)begin
		if(rst)
			cnt1<=0;
		else if(&cnt1)
			cnt1<=cnt1;
		else
			cnt1<=cnt1+1;
	end
	
	always@(posedge mux_out2 or posedge rst)begin
		if(rst)
			cnt2<=0;
		else if(&cnt2)
			cnt2<=cnt2;
		else
			cnt2<=cnt2+1;
	end
	

	
	
	// prevent metastability
	always@(posedge clk or posedge rst)begin
		if(rst)
			on_counter<=0;
		else if(n_in_valid)
			on_counter<=on_counter;
		else if(in_valid==1)
			on_counter<=on_counter+1;
	end
	
	// output
	always@(posedge mux_out1 or posedge rst)begin
		if(rst)
			out_led<=2'b11;	
		else if(cnt1==30'b00_0000_1111_1111_1111_1111_1111_1111)begin
			if(cnt1>cnt2)begin
				out_led<=2'b01;
			end
			else if(cnt1<cnt2)begin
				out_led<=2'b10;
			end
			else
				out_led<=2'b00;
		end
	end
	
	
endmodule



module ring_osci(
	input enable,
	output out
);

  (* dont_touch = "yes" *) wire w1;
  (* dont_touch = "yes" *) wire w2;
  (* dont_touch = "yes" *) wire w3;
  (* dont_touch = "yes" *) wire w4;
  (* dont_touch = "yes" *) wire w5;
  (* dont_touch = "yes" *) wire w6;
  (* dont_touch = "yes" *) wire w7;
  (* dont_touch = "yes" *) wire w8;
  (* dont_touch = "yes" *) wire feedback;

  assign w1 = (enable & feedback);
  assign w2 = ~w1;
  assign w3 = ~w2;
  assign w4 = ~w3;
  assign w5 = ~w4;
  assign w6 = ~w5;
  assign w7 = ~w6;
  assign w8 = ~w7;
  assign feedback = w8;
  assign out = ~w8;

endmodule




module mux4to1(
	input in0,in1,in2,in3,
	input [1:0]sel,
	output reg out_mux
);

always@(*)begin
	case(sel)
		0: out_mux = in0;
		1: out_mux = in1;
		2: out_mux = in2;
		3: out_mux = in3;
	endcase
end
endmodule