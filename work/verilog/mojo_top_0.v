/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg c,
    input sum,
    input carry
  );
  
  
  
  integer exp;
  
  reg rst;
  
  wire [2-1:0] M_myChecker_value;
  reg [1-1:0] M_myChecker_sum;
  reg [1-1:0] M_myChecker_carry;
  checker_1 myChecker (
    .sum(M_myChecker_sum),
    .carry(M_myChecker_carry),
    .value(M_myChecker_value)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_myBlinker_blinkA;
  wire [1-1:0] M_myBlinker_blinkB;
  wire [1-1:0] M_myBlinker_blinkC;
  blinker_3 myBlinker (
    .clk(clk),
    .rst(rst),
    .blinkA(M_myBlinker_blinkA),
    .blinkB(M_myBlinker_blinkB),
    .blinkC(M_myBlinker_blinkC)
  );
  localparam AUTO_state = 1'd0;
  localparam MANUAL_state = 1'd1;
  
  reg M_state_d, M_state_q = AUTO_state;
  
  always @* begin
    M_state_d = M_state_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    a = 1'h0;
    b = 1'h0;
    c = 1'h0;
    exp = 2'h0;
    M_myChecker_sum = sum;
    M_myChecker_carry = carry;
    
    case (M_state_q)
      AUTO_state: begin
        io_led[16+0+0-:1] = 1'h0;
        io_led[16+1+0-:1] = 1'h0;
        io_led[16+7+0-:1] = M_myBlinker_blinkA;
        io_led[16+6+0-:1] = M_myBlinker_blinkB;
        io_led[16+5+0-:1] = M_myBlinker_blinkC;
        a = M_myBlinker_blinkA;
        b = M_myBlinker_blinkB;
        c = M_myBlinker_blinkC;
        io_led[0+7+0-:1] = M_myChecker_value[1+0-:1];
        io_led[0+6+0-:1] = M_myChecker_value[0+0-:1];
        exp = M_myBlinker_blinkA + M_myBlinker_blinkB + M_myBlinker_blinkC;
        io_led[8+7-:8] = {exp, 6'h00};
        if (M_myChecker_value == exp) begin
          io_led[0+0+0-:1] = 1'h0;
          io_led[0+1+0-:1] = 1'h0;
        end else begin
          io_led[0+0+0-:1] = 1'h1;
          io_led[0+1+0-:1] = 1'h1;
        end
        if (io_dip[16+0+0-:1]) begin
          M_state_d = MANUAL_state;
        end
      end
      MANUAL_state: begin
        io_led[16+0+0-:1] = 1'h1;
        io_led[16+1+0-:1] = 1'h1;
        io_led[16+7+0-:1] = io_dip[16+7+0-:1];
        io_led[16+6+0-:1] = io_dip[16+6+0-:1];
        io_led[16+5+0-:1] = io_dip[16+5+0-:1];
        a = io_dip[16+7+0-:1];
        b = io_dip[16+6+0-:1];
        c = io_dip[16+5+0-:1];
        io_led[0+7+0-:1] = M_myChecker_value[1+0-:1];
        io_led[0+6+0-:1] = M_myChecker_value[0+0-:1];
        exp = io_dip[16+7+0-:1] + io_dip[16+6+0-:1] + io_dip[16+5+0-:1];
        io_led[8+7-:8] = {exp, 6'h00};
        if (M_myChecker_value == exp) begin
          io_led[0+0+0-:1] = 1'h0;
          io_led[0+1+0-:1] = 1'h0;
        end else begin
          io_led[0+0+0-:1] = 1'h1;
          io_led[0+1+0-:1] = 1'h1;
        end
        if (!io_dip[16+0+0-:1]) begin
          M_state_d = AUTO_state;
        end
      end
    endcase
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
