// Generator : SpinalHDL v1.14.0    git head : 95a5e6c65c54acfc4707c8fe6ef8b5d297cfcbde
// Component : OscillatorTop
// Git hash  : d56fa13a40472f88a44a579d1bb1fcf37851b343

`timescale 1ns/1ps

module OscillatorTop (
  input  wire          io_clk_25,
  input  wire          io_reset,
  input  wire [23:0]   io_freqWord,
  input  wire [2:0]    io_waveSelect,
  input  wire [7:0]    io_pwmWidth,
  output wire          io_i2s_bclk,
  output wire          io_i2s_lrclk,
  output wire          io_i2s_sdata
);

  wire                core_timingGen_io_phaseTick;
  wire                core_timingGen_io_sampleTick;
  wire       [15:0]   core_oscillator_io_sample;
  wire       [15:0]   core_decimator_io_sampleOut;
  wire                core_decimator_io_valid;
  wire                core_transmitter_io_bclk;
  wire                core_transmitter_io_lrclk;
  wire                core_transmitter_io_sdata;

  // 25MHz (io_clk_25) to 24MHz (io_clk) with the instance of pll.v
  wire       io_clk;
  wire       locked_pll;
  pll pll_inst (
    .clkin(io_clk_25),
    .clkout0(io_clk),
    .locked(locked_pll)
  );

  TimingGenerator core_timingGen (
    .io_phaseTick  (core_timingGen_io_phaseTick ), //o
    .io_sampleTick (core_timingGen_io_sampleTick), //o
    .io_clk        (io_clk                      ), //i
    .io_reset      (io_reset                    )  //i
  );
  Oscillator core_oscillator (
    .io_phaseTick  (core_timingGen_io_phaseTick    ), //i
    .io_freqWord   (io_freqWord[23:0]              ), //i
    .io_waveSelect (io_waveSelect[2:0]             ), //i
    .io_pwmWidth   (io_pwmWidth[7:0]               ), //i
    .io_sample     (core_oscillator_io_sample[15:0]), //o
    .io_clk        (io_clk                         ), //i
    .io_reset      (io_reset                       )  //i
  );
  Decimator core_decimator (
    .io_phaseTick  (core_timingGen_io_phaseTick      ), //i
    .io_sampleTick (core_timingGen_io_sampleTick     ), //i
    .io_sampleIn   (core_oscillator_io_sample[15:0]  ), //i
    .io_sampleOut  (core_decimator_io_sampleOut[15:0]), //o
    .io_valid      (core_decimator_io_valid          ), //o
    .io_clk        (io_clk                           ), //i
    .io_reset      (io_reset                         )  //i
  );
  I2STransmitter core_transmitter (
    .io_sampleIn (core_decimator_io_sampleOut[15:0]), //i
    .io_valid    (core_decimator_io_valid          ), //i
    .io_bclk     (core_transmitter_io_bclk         ), //o
    .io_lrclk    (core_transmitter_io_lrclk        ), //o
    .io_sdata    (core_transmitter_io_sdata        ), //o
    .io_clk      (io_clk                           ), //i
    .io_reset    (io_reset                         )  //i
  );
  assign io_i2s_bclk = core_transmitter_io_bclk;
  assign io_i2s_lrclk = core_transmitter_io_lrclk;
  assign io_i2s_sdata = core_transmitter_io_sdata;

endmodule

module I2STransmitter (
  input  wire [15:0]   io_sampleIn,
  input  wire          io_valid,
  output wire          io_bclk,
  output wire          io_lrclk,
  output wire          io_sdata,
  input  wire          io_clk,
  input  wire          io_reset
);

  reg        [4:0]    _zz_cycleCounter_1;
  wire       [16:0]   _zz_shiftReg;
  wire       [4:0]    patternTable_0;
  wire       [4:0]    patternTable_1;
  wire       [4:0]    patternTable_2;
  wire       [4:0]    patternTable_3;
  wire       [4:0]    patternTable_4;
  wire       [4:0]    patternTable_5;
  wire       [4:0]    patternTable_6;
  wire       [4:0]    patternTable_7;
  reg        [4:0]    cycleCounter;
  reg        [2:0]    patternIndex;
  reg        [4:0]    bitCounter;
  reg        [15:0]   shiftReg;
  reg        [15:0]   sampleBuffer;
  reg                 active;
  wire                when_I2STransmitter_l41;
  wire       [2:0]    _zz_cycleCounter;
  wire       [4:0]    _zz_bitCounter;
  wire                when_I2STransmitter_l53;

  assign _zz_shiftReg = ({1'd0,shiftReg} <<< 1'd1);
  always @(*) begin
    case(_zz_cycleCounter)
      3'b000 : _zz_cycleCounter_1 = patternTable_0;
      3'b001 : _zz_cycleCounter_1 = patternTable_1;
      3'b010 : _zz_cycleCounter_1 = patternTable_2;
      3'b011 : _zz_cycleCounter_1 = patternTable_3;
      3'b100 : _zz_cycleCounter_1 = patternTable_4;
      3'b101 : _zz_cycleCounter_1 = patternTable_5;
      3'b110 : _zz_cycleCounter_1 = patternTable_6;
      default : _zz_cycleCounter_1 = patternTable_7;
    endcase
  end

  assign patternTable_0 = 5'h10;
  assign patternTable_1 = 5'h10;
  assign patternTable_2 = 5'h0f;
  assign patternTable_3 = 5'h10;
  assign patternTable_4 = 5'h10;
  assign patternTable_5 = 5'h0f;
  assign patternTable_6 = 5'h10;
  assign patternTable_7 = 5'h0f;
  assign when_I2STransmitter_l41 = (cycleCounter == 5'h0);
  assign _zz_cycleCounter = (patternIndex + 3'b001);
  assign _zz_bitCounter = (bitCounter + 5'h01);
  assign when_I2STransmitter_l53 = ((_zz_bitCounter == 5'h0) || (_zz_bitCounter == 5'h10));
  assign io_bclk = (active && (5'h08 <= cycleCounter));
  assign io_lrclk = ((! active) || (5'h10 <= bitCounter));
  assign io_sdata = (active && shiftReg[15]);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      cycleCounter <= 5'h0f;
      patternIndex <= 3'b000;
      bitCounter <= 5'h0;
      shiftReg <= 16'h0;
      sampleBuffer <= 16'h0;
      active <= 1'b0;
    end else begin
      if(io_valid) begin
        sampleBuffer <= io_sampleIn;
        bitCounter <= 5'h0;
        patternIndex <= 3'b000;
        cycleCounter <= (patternTable_0 - 5'h01);
        shiftReg <= io_sampleIn;
        active <= 1'b1;
      end else begin
        if(active) begin
          if(when_I2STransmitter_l41) begin
            patternIndex <= _zz_cycleCounter;
            cycleCounter <= (_zz_cycleCounter_1 - 5'h01);
            bitCounter <= _zz_bitCounter;
            if(when_I2STransmitter_l53) begin
              shiftReg <= sampleBuffer;
            end else begin
              shiftReg <= _zz_shiftReg[15:0];
            end
          end else begin
            cycleCounter <= (cycleCounter - 5'h01);
          end
        end
      end
    end
  end


endmodule

module Decimator (
  input  wire          io_phaseTick,
  input  wire          io_sampleTick,
  input  wire [15:0]   io_sampleIn,
  output wire [15:0]   io_sampleOut,
  output wire          io_valid,
  input  wire          io_clk,
  input  wire          io_reset
);

  reg        [15:0]   sampleReg;
  reg                 io_sampleTick_regNext;

  assign io_sampleOut = sampleReg;
  assign io_valid = io_sampleTick_regNext;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      sampleReg <= 16'h0;
      io_sampleTick_regNext <= 1'b0;
    end else begin
      if(io_sampleTick) begin
        sampleReg <= io_sampleIn;
      end
      io_sampleTick_regNext <= io_sampleTick;
    end
  end


endmodule

module Oscillator (
  input  wire          io_phaseTick,
  input  wire [23:0]   io_freqWord,
  input  wire [2:0]    io_waveSelect,
  input  wire [7:0]    io_pwmWidth,
  output wire [15:0]   io_sample,
  input  wire          io_clk,
  input  wire          io_reset
);

  wire       [23:0]   accumulator_1_io_phase;
  wire       [15:0]   generators_1_io_sawWave;
  wire       [15:0]   generators_1_io_squareWave;
  wire       [15:0]   generators_1_io_pwmWave;
  wire       [15:0]   generators_1_io_triWave;
  wire       [15:0]   noise_1_io_sample;
  wire       [15:0]   mux_1_io_sample;

  Accumulator accumulator_1 (
    .io_phaseTick (io_phaseTick                ), //i
    .io_freqWord  (io_freqWord[23:0]           ), //i
    .io_phase     (accumulator_1_io_phase[23:0]), //o
    .io_clk       (io_clk                      ), //i
    .io_reset     (io_reset                    )  //i
  );
  Generators generators_1 (
    .io_phase      (accumulator_1_io_phase[23:0]    ), //i
    .io_pwmWidth   (io_pwmWidth[7:0]                ), //i
    .io_sawWave    (generators_1_io_sawWave[15:0]   ), //o
    .io_squareWave (generators_1_io_squareWave[15:0]), //o
    .io_pwmWave    (generators_1_io_pwmWave[15:0]   ), //o
    .io_triWave    (generators_1_io_triWave[15:0]   )  //o
  );
  Noise noise_1 (
    .io_phaseTick (io_phaseTick           ), //i
    .io_sample    (noise_1_io_sample[15:0]), //o
    .io_clk       (io_clk                 ), //i
    .io_reset     (io_reset               )  //i
  );
  Mux mux_1 (
    .io_waveSelect (io_waveSelect[2:0]              ), //i
    .io_sawWave    (generators_1_io_sawWave[15:0]   ), //i
    .io_squareWave (generators_1_io_squareWave[15:0]), //i
    .io_pwmWave    (generators_1_io_pwmWave[15:0]   ), //i
    .io_triWave    (generators_1_io_triWave[15:0]   ), //i
    .io_noiseWave  (noise_1_io_sample[15:0]         ), //i
    .io_sample     (mux_1_io_sample[15:0]           )  //o
  );
  assign io_sample = mux_1_io_sample;

endmodule

module TimingGenerator (
  output wire          io_phaseTick,
  output wire          io_sampleTick,
  input  wire          io_clk,
  input  wire          io_reset
);

  wire       [5:0]    _zz_phaseCounter_valueNext;
  wire       [0:0]    _zz_phaseCounter_valueNext_1;
  wire       [8:0]    _zz_sampleCounter_valueNext;
  wire       [0:0]    _zz_sampleCounter_valueNext_1;
  reg                 phaseCounter_willIncrement;
  wire                phaseCounter_willClear;
  reg        [5:0]    phaseCounter_valueNext;
  reg        [5:0]    phaseCounter_value;
  wire                phaseCounter_willOverflowIfInc;
  wire                phaseCounter_willOverflow;
  reg                 sampleCounter_willIncrement;
  wire                sampleCounter_willClear;
  reg        [8:0]    sampleCounter_valueNext;
  reg        [8:0]    sampleCounter_value;
  wire                sampleCounter_willOverflowIfInc;
  wire                sampleCounter_willOverflow;
  reg                 phaseCounter_willOverflow_regNext;
  reg                 sampleCounter_willOverflow_regNext;
  function  zz_phaseCounter_willIncrement(input dummy);
    begin
      zz_phaseCounter_willIncrement = 1'b0;
      zz_phaseCounter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_1;
  function  zz_sampleCounter_willIncrement(input dummy);
    begin
      zz_sampleCounter_willIncrement = 1'b0;
      zz_sampleCounter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_2;

  assign _zz_phaseCounter_valueNext_1 = phaseCounter_willIncrement;
  assign _zz_phaseCounter_valueNext = {5'd0, _zz_phaseCounter_valueNext_1};
  assign _zz_sampleCounter_valueNext_1 = sampleCounter_willIncrement;
  assign _zz_sampleCounter_valueNext = {8'd0, _zz_sampleCounter_valueNext_1};
  assign _zz_1 = zz_phaseCounter_willIncrement(1'b0);
  always @(*) phaseCounter_willIncrement = _zz_1;
  assign phaseCounter_willClear = 1'b0;
  assign phaseCounter_willOverflowIfInc = (phaseCounter_value == 6'h31);
  assign phaseCounter_willOverflow = (phaseCounter_willOverflowIfInc && phaseCounter_willIncrement);
  always @(*) begin
    if(phaseCounter_willOverflow) begin
      phaseCounter_valueNext = 6'h0;
    end else begin
      phaseCounter_valueNext = (phaseCounter_value + _zz_phaseCounter_valueNext);
    end
    if(phaseCounter_willClear) begin
      phaseCounter_valueNext = 6'h0;
    end
  end

  assign _zz_2 = zz_sampleCounter_willIncrement(1'b0);
  always @(*) sampleCounter_willIncrement = _zz_2;
  assign sampleCounter_willClear = 1'b0;
  assign sampleCounter_willOverflowIfInc = (sampleCounter_value == 9'h1f3);
  assign sampleCounter_willOverflow = (sampleCounter_willOverflowIfInc && sampleCounter_willIncrement);
  always @(*) begin
    if(sampleCounter_willOverflow) begin
      sampleCounter_valueNext = 9'h0;
    end else begin
      sampleCounter_valueNext = (sampleCounter_value + _zz_sampleCounter_valueNext);
    end
    if(sampleCounter_willClear) begin
      sampleCounter_valueNext = 9'h0;
    end
  end

  assign io_phaseTick = phaseCounter_willOverflow_regNext;
  assign io_sampleTick = sampleCounter_willOverflow_regNext;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      phaseCounter_value <= 6'h0;
      sampleCounter_value <= 9'h0;
      phaseCounter_willOverflow_regNext <= 1'b0;
      sampleCounter_willOverflow_regNext <= 1'b0;
    end else begin
      phaseCounter_value <= phaseCounter_valueNext;
      sampleCounter_value <= sampleCounter_valueNext;
      phaseCounter_willOverflow_regNext <= phaseCounter_willOverflow;
      sampleCounter_willOverflow_regNext <= sampleCounter_willOverflow;
    end
  end


endmodule

module Mux (
  input  wire [2:0]    io_waveSelect,
  input  wire [15:0]   io_sawWave,
  input  wire [15:0]   io_squareWave,
  input  wire [15:0]   io_pwmWave,
  input  wire [15:0]   io_triWave,
  input  wire [15:0]   io_noiseWave,
  output reg  [15:0]   io_sample
);


  always @(*) begin
    case(io_waveSelect)
      3'b000 : begin
        io_sample = io_sawWave;
      end
      3'b001 : begin
        io_sample = io_squareWave;
      end
      3'b010 : begin
        io_sample = io_pwmWave;
      end
      3'b011 : begin
        io_sample = io_triWave;
      end
      3'b100 : begin
        io_sample = io_noiseWave;
      end
      default : begin
        io_sample = 16'h0;
      end
    endcase
  end


endmodule

module Noise (
  input  wire          io_phaseTick,
  output wire [15:0]   io_sample,
  input  wire          io_clk,
  input  wire          io_reset
);

  reg        [22:0]   lfsr;
  wire                feedback;

  assign feedback = (lfsr[22] ^ lfsr[17]);
  assign io_sample = lfsr[22 : 7];
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      lfsr <= 23'h000001;
    end else begin
      if(io_phaseTick) begin
        lfsr <= {lfsr[21 : 0],feedback};
      end
    end
  end


endmodule

module Generators (
  input  wire [23:0]   io_phase,
  input  wire [7:0]    io_pwmWidth,
  output wire [15:0]   io_sawWave,
  output wire [15:0]   io_squareWave,
  output wire [15:0]   io_pwmWave,
  output wire [15:0]   io_triWave
);

  wire       [9:0]    _zz_expandedPwm;
  wire       [23:0]   expandedPwm;
  reg        [22:0]   triReflected;
  wire                when_Generators_l34;

  assign _zz_expandedPwm = ({2'd0,io_pwmWidth} <<< 2'd2);
  assign io_sawWave = (io_phase[23 : 8] ^ 16'h8000);
  assign io_squareWave = (io_phase[23] ? 16'h7fff : 16'h8000);
  assign expandedPwm = {14'd0, _zz_expandedPwm};
  assign io_pwmWave = ((io_phase < expandedPwm) ? 16'h7fff : 16'h8000);
  assign when_Generators_l34 = (io_phase[23] == 1'b0);
  always @(*) begin
    if(when_Generators_l34) begin
      triReflected = io_phase[22 : 0];
    end else begin
      triReflected = (~ io_phase[22 : 0]);
    end
  end

  assign io_triWave = (triReflected[22 : 7] ^ 16'h8000);

endmodule

module Accumulator (
  input  wire          io_phaseTick,
  input  wire [23:0]   io_freqWord,
  output wire [23:0]   io_phase,
  input  wire          io_clk,
  input  wire          io_reset
);

  reg        [23:0]   phaseReg;

  assign io_phase = phaseReg;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      phaseReg <= 24'h0;
    end else begin
      if(io_phaseTick) begin
        phaseReg <= (phaseReg + io_freqWord);
      end
    end
  end


endmodule
