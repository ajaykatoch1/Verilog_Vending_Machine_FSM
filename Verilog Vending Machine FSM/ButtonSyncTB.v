module ButtonSyncTB();

	reg Clk_tb, Rst_tb, bi_tb;
	wire bo_tb;

	ButtonSynchronizer DUT(Clk_tb, Rst_tb, bi_tb, bo_tb);

	always begin
        Clk_tb <= 0;
        #100;
        Clk_tb <= 1;
        #100;
    	end
    
    initial begin
        Rst_tb <= 1;
        @(posedge Clk_tb);
        Rst_tb <= 0;
	@(posedge Clk_tb);
	bi_tb <= 1;
	@(posedge Clk_tb);
	@(posedge Clk_tb);
	@(posedge Clk_tb);
	bi_tb <= 0;
	@(posedge Clk_tb);
	bi_tb <= 1;
	@(posedge Clk_tb);
	bi_tb <= 0;
	end
endmodule
