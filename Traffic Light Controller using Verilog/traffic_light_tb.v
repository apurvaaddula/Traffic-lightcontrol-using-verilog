`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:08:16 07/23/2021
// Design Name:   traffic_light
// Module Name:   C:/Users/Srinath/traffic_light_controller/traffic_light_tb.v
// Project Name:  traffic_light_controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traffic_light_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [2:0] n_lights;
	wire [2:0] s_lights;
	wire [2:0] e_lights;
	wire [2:0] w_lights;

	// Instantiate the Unit Under Test (UUT)
	traffic_light uut (
		.clk(clk), 
		.rst(rst), 
		.n_lights(n_lights), 
		.s_lights(s_lights), 
		.e_lights(e_lights), 
		.w_lights(w_lights)
	);

	initial begin
		// Initialize Inputs
		clk=1'b1;
		forever #5 clk=~clk;
	end
	
	initial begin
		rst=1'b1;
		#10
		rst=1'b0;
		#1000
		$stop;
	end
endmodule

