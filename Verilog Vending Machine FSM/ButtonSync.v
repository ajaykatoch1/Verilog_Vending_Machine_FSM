`timescale 1ns / 1ps

module ButtonSynchronizer(Clk, Rst, bi, bo);

	input Clk, Rst, bi;
	output reg bo;
	
	reg [1:0] state, newState;
	parameter OFF = 0, ON = 1, SYNC = 2;
	
	always @ (posedge Clk) begin
		if (Rst) begin
			state <= OFF;
		end
		else begin
			state <= newState;
		end
	end
	
	always @(state, bi) begin
		case (state)
			OFF: begin
				bo <= 0;
				if (bi) begin
					newState <= ON;
				end
				else begin
					newState <= OFF;
				end
			end
			ON: begin
				bo <= 1;
				if (bi) begin
					newState <= SYNC;
				end
				else begin
					newState <= OFF;
				end
			end
			SYNC: begin
				bo <= 0;
				if (bi) begin
					newState <= SYNC;
				end
				else begin
					newState <= OFF;
				end
			end
		endcase
	end
	
endmodule
				