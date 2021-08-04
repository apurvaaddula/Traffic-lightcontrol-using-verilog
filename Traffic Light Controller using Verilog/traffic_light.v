`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:34:47 07/23/2021 
// Design Name: 
// Module Name:    traffic_light 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic_light(clk,rst,n_lights,s_lights,e_lights,w_lights);
	input clk,rst;
	output reg [2:0]n_lights,s_lights,e_lights,w_lights;
	reg [2:0]state;
	reg [2:0]tick;
	parameter [2:0] n_g=3'b000;
	parameter [2:0] n_y=3'b001;
	parameter [2:0] s_g=3'b010;
	parameter [2:0] s_y=3'b011;
	parameter [2:0] e_g=3'b100;
	parameter [2:0] e_y=3'b101;
	parameter [2:0] w_g=3'b110;
	parameter [2:0] w_y=3'b111;
	
	always @(posedge clk,posedge rst)
		begin
			if(rst)
				begin
					state=n_g;
					tick=3'b000;
				end
			else
				begin
					case(state)
						n_g:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=n_y;
									end
								else
									begin
										tick=tick+3'b001;
										state=n_g;
									end
							end
						n_y:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=s_g;
									end
								else
									begin
										tick=tick+3'b001;
										state=n_y;
									end
							end
						s_g:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=s_y;
									end
								else
									begin
										tick=tick+3'b001;
										state=s_g;
									end
							end
						s_y:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=e_g;
									end
								else
									begin
										tick=tick+3'b001;
										state=s_y;
									end
							end
						e_g:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=e_y;
									end
								else
									begin
										tick=tick+3'b001;
										state=e_g;
									end
							end
						e_y:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=w_g;
									end
								else
									begin
										tick=tick+3'b001;
										state=e_y;
									end
							end
						w_g:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=w_y;
									end
								else
									begin
										tick=tick+3'b001;
										state=w_g;
									end
							end
						w_y:
							begin
								if(tick==3'b111)
									begin
										tick=3'b000;
										state=n_g;
									end
								else
									begin
										tick=tick+3'b001;
										state=w_y;
									end
							end
					endcase
				end
		end
		
		always @(state)
			begin
				case(state)
					n_g:
						begin
							n_lights=3'b001;
							s_lights=3'b100;
							e_lights=3'b100;
							w_lights=3'b100;
						end
					n_y:	
						begin
							n_lights=3'b010;
							s_lights=3'b100;
							e_lights=3'b100;
							w_lights=3'b100;
						end
					s_g:	
						begin
							n_lights=3'b100;
							s_lights=3'b001;
							e_lights=3'b100;
							w_lights=3'b100;
						end
					s_y:	
						begin
							n_lights=3'b100;
							s_lights=3'b010;
							e_lights=3'b100;
							w_lights=3'b100;
						end
					e_g:	
						begin
							n_lights=3'b100;
							s_lights=3'b100;
							e_lights=3'b001;
							w_lights=3'b100;
						end
					e_y:	
						begin
							n_lights=3'b100;
							s_lights=3'b100;
							e_lights=3'b010;
							w_lights=3'b100;
						end
					w_g:	
						begin
							n_lights=3'b100;
							s_lights=3'b100;
							e_lights=3'b100;
							w_lights=3'b001;
						end
					w_y:	
						begin
							n_lights=3'b100;
							s_lights=3'b100;
							e_lights=3'b100;
							w_lights=3'b010;
						end
				endcase
			end
endmodule
