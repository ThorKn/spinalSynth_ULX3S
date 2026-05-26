// Generator : SpinalHDL v1.14.0    git head : 95a5e6c65c54acfc4707c8fe6ef8b5d297cfcbde
// Component : OscillatorTop
// Git hash  : d56fa13a40472f88a44a579d1bb1fcf37851b343

`timescale 1ns/1ps

module SpinalSynth (
  input  wire          io_clk_25,
  input  wire          io_reset,
  input  wire          io_uartRx,
  output wire          io_i2s_bclk,
  output wire          io_i2s_lrclk,
  output wire          io_i2s_sdata,
  output wire          mclk
);

  assign mclk = 1'b0;

  // 25MHz (io_clk_25) to 24MHz (io_clk) with the instance of pll1.v and pll2.v
  wire       io_clk_100;
  wire       io_clk;
  wire       locked_pll1;
  wire       locked_pll2;
  pll1 pll_inst1 (
    .clkin(io_clk_25),
    .clkout0(io_clk_100),
    .locked(locked_pll1)
  );
  pll2 pll_inst2 (
    .clkin(io_clk_100),
    .clkout0(io_clk),
    .locked(locked_pll2)
  );

  Synth core_Synth (
    .io_clk24MHz  (io_clk),       //i
    .io_reset     (io_reset),     //i 
    .io_uartRx    (io_uartRx),    //i
    .io_i2sBclk   (io_i2s_bclk),  //o
    .io_i2sLrclk  (io_i2s_lrclk), //o
    .io_i2sData   (io_i2s_sdata)  //o
  );

endmodule