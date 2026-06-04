// Generator : SpinalHDL v1.14.0    git head : 95a5e6c65c54acfc4707c8fe6ef8b5d297cfcbde
// Component : Synth
// Git hash  : 7c14a61711fa7f3c6a75ce731b10975bd46995da

`timescale 1ns/1ps

module Synth (
  input  wire          io_clk24MHz,
  input  wire          io_reset,
  input  wire          io_uartRx,
  output wire          io_i2sBclk,
  output wire          io_i2sLrclk,
  output wire          io_i2sData
);

  wire       [9:0]    core_envAttenuator_io_volume;
  wire       [23:0]   core_uart_io_config_freqWord;
  wire       [2:0]    core_uart_io_config_waveSelect;
  wire       [7:0]    core_uart_io_config_pwmWidth;
  wire       [7:0]    core_uart_io_config_volume;
  wire       [7:0]    core_uart_io_envConfig_ctrl;
  wire       [7:0]    core_uart_io_envConfig_attack;
  wire       [7:0]    core_uart_io_envConfig_decay;
  wire       [7:0]    core_uart_io_envConfig_sustain;
  wire       [7:0]    core_uart_io_envConfig_release;
  wire       [7:0]    core_uart_io_envConfig_gate;
  wire                core_timingGen_io_phaseTick;
  wire                core_timingGen_io_sampleTick;
  wire                core_oscillator_io_sample_valid;
  wire       [15:0]   core_oscillator_io_sample_payload;
  wire                core_envGen_io_envelopeOut_valid;
  wire       [9:0]    core_envGen_io_envelopeOut_payload;
  wire                core_envGen_io_envelopeOutSigned_valid;
  wire       [9:0]    core_envGen_io_envelopeOutSigned_payload;
  wire                core_envAttenuator_io_sampleOut_valid;
  wire       [15:0]   core_envAttenuator_io_sampleOut_payload;
  wire                core_attenuator_io_sampleOut_valid;
  wire       [15:0]   core_attenuator_io_sampleOut_payload;
  wire                core_decimator_io_sampleOut_valid;
  wire       [15:0]   core_decimator_io_sampleOut_payload;
  wire                core_transmitter_io_bclk;
  wire                core_transmitter_io_lrclk;
  wire                core_transmitter_io_sdata;
  reg                 io_sampleTick_delay_1;
  reg                 core_alignedSampleTick;
  wire                core_envBypassed;

  Uart core_uart (
    .io_rx                (io_uartRx                          ), //i
    .io_config_freqWord   (core_uart_io_config_freqWord[23:0] ), //o
    .io_config_waveSelect (core_uart_io_config_waveSelect[2:0]), //o
    .io_config_pwmWidth   (core_uart_io_config_pwmWidth[7:0]  ), //o
    .io_config_volume     (core_uart_io_config_volume[7:0]    ), //o
    .io_envConfig_ctrl    (core_uart_io_envConfig_ctrl[7:0]   ), //o
    .io_envConfig_attack  (core_uart_io_envConfig_attack[7:0] ), //o
    .io_envConfig_decay   (core_uart_io_envConfig_decay[7:0]  ), //o
    .io_envConfig_sustain (core_uart_io_envConfig_sustain[7:0]), //o
    .io_envConfig_release (core_uart_io_envConfig_release[7:0]), //o
    .io_envConfig_gate    (core_uart_io_envConfig_gate[7:0]   ), //o
    .io_clk24MHz          (io_clk24MHz                        ), //i
    .io_reset             (io_reset                           )  //i
  );
  TimingGenerator core_timingGen (
    .io_phaseTick  (core_timingGen_io_phaseTick ), //o
    .io_sampleTick (core_timingGen_io_sampleTick), //o
    .io_clk24MHz   (io_clk24MHz                 ), //i
    .io_reset      (io_reset                    )  //i
  );
  Oscillator core_oscillator (
    .io_phaseTick         (core_timingGen_io_phaseTick            ), //i
    .io_config_freqWord   (core_uart_io_config_freqWord[23:0]     ), //i
    .io_config_waveSelect (core_uart_io_config_waveSelect[2:0]    ), //i
    .io_config_pwmWidth   (core_uart_io_config_pwmWidth[7:0]      ), //i
    .io_config_volume     (core_uart_io_config_volume[7:0]        ), //i
    .io_sample_valid      (core_oscillator_io_sample_valid        ), //o
    .io_sample_payload    (core_oscillator_io_sample_payload[15:0]), //o
    .io_clk24MHz          (io_clk24MHz                            ), //i
    .io_reset             (io_reset                               )  //i
  );
  EnvelopeGenerator core_envGen (
    .io_phaseTick                 (core_timingGen_io_phaseTick                  ), //i
    .io_syncIn                    (1'b0                                         ), //i
    .io_config_ctrl               (core_uart_io_envConfig_ctrl[7:0]             ), //i
    .io_config_attack             (core_uart_io_envConfig_attack[7:0]           ), //i
    .io_config_decay              (core_uart_io_envConfig_decay[7:0]            ), //i
    .io_config_sustain            (core_uart_io_envConfig_sustain[7:0]          ), //i
    .io_config_release            (core_uart_io_envConfig_release[7:0]          ), //i
    .io_config_gate               (core_uart_io_envConfig_gate[7:0]             ), //i
    .io_envelopeOut_valid         (core_envGen_io_envelopeOut_valid             ), //o
    .io_envelopeOut_payload       (core_envGen_io_envelopeOut_payload[9:0]      ), //o
    .io_envelopeOutSigned_valid   (core_envGen_io_envelopeOutSigned_valid       ), //o
    .io_envelopeOutSigned_payload (core_envGen_io_envelopeOutSigned_payload[9:0]), //o
    .io_reset                     (io_reset                                     ), //i
    .io_clk24MHz                  (io_clk24MHz                                  )  //i
  );
  Attenuator core_envAttenuator (
    .io_sampleIn_valid    (core_oscillator_io_sample_valid              ), //i
    .io_sampleIn_payload  (core_oscillator_io_sample_payload[15:0]      ), //i
    .io_volume            (core_envAttenuator_io_volume[9:0]            ), //i
    .io_sampleOut_valid   (core_envAttenuator_io_sampleOut_valid        ), //o
    .io_sampleOut_payload (core_envAttenuator_io_sampleOut_payload[15:0]), //o
    .io_clk24MHz          (io_clk24MHz                                  ), //i
    .io_reset             (io_reset                                     )  //i
  );
  Attenuator_1 core_attenuator (
    .io_sampleIn_valid    (core_envAttenuator_io_sampleOut_valid        ), //i
    .io_sampleIn_payload  (core_envAttenuator_io_sampleOut_payload[15:0]), //i
    .io_volume            (core_uart_io_config_volume[7:0]              ), //i
    .io_sampleOut_valid   (core_attenuator_io_sampleOut_valid           ), //o
    .io_sampleOut_payload (core_attenuator_io_sampleOut_payload[15:0]   ), //o
    .io_clk24MHz          (io_clk24MHz                                  ), //i
    .io_reset             (io_reset                                     )  //i
  );
  Decimator core_decimator (
    .io_sampleTick        (core_alignedSampleTick                    ), //i
    .io_sampleIn_valid    (core_attenuator_io_sampleOut_valid        ), //i
    .io_sampleIn_payload  (core_attenuator_io_sampleOut_payload[15:0]), //i
    .io_sampleOut_valid   (core_decimator_io_sampleOut_valid         ), //o
    .io_sampleOut_payload (core_decimator_io_sampleOut_payload[15:0] ), //o
    .io_clk24MHz          (io_clk24MHz                               ), //i
    .io_reset             (io_reset                                  )  //i
  );
  I2STransmitter core_transmitter (
    .io_sampleIn_valid   (core_decimator_io_sampleOut_valid        ), //i
    .io_sampleIn_payload (core_decimator_io_sampleOut_payload[15:0]), //i
    .io_bclk             (core_transmitter_io_bclk                 ), //o
    .io_lrclk            (core_transmitter_io_lrclk                ), //o
    .io_sdata            (core_transmitter_io_sdata                ), //o
    .io_clk24MHz         (io_clk24MHz                              ), //i
    .io_reset            (io_reset                                 )  //i
  );
  assign core_envBypassed = (! core_uart_io_envConfig_ctrl[0]);
  assign core_envAttenuator_io_volume = (core_envBypassed ? 10'h3ff : core_envGen_io_envelopeOut_payload);
  assign io_i2sBclk = core_transmitter_io_bclk;
  assign io_i2sLrclk = core_transmitter_io_lrclk;
  assign io_i2sData = core_transmitter_io_sdata;
  always @(posedge io_clk24MHz) begin
    io_sampleTick_delay_1 <= core_timingGen_io_sampleTick;
    core_alignedSampleTick <= io_sampleTick_delay_1;
  end


endmodule

module I2STransmitter (
  input  wire          io_sampleIn_valid,
  input  wire [15:0]   io_sampleIn_payload,
  output wire          io_bclk,
  output wire          io_lrclk,
  output wire          io_sdata,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [4:0]    _zz_cycleCounter_1;
  wire       [32:0]   _zz_shiftReg;
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
  reg        [31:0]   shiftReg;
  reg        [15:0]   sampleBuffer;
  reg                 active;
  wire                when_I2STransmitter_l30;
  wire                when_I2STransmitter_l40;
  wire       [2:0]    _zz_cycleCounter;
  wire                when_I2STransmitter_l50;

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
  assign when_I2STransmitter_l30 = (! active);
  assign when_I2STransmitter_l40 = (cycleCounter == 5'h0);
  assign _zz_cycleCounter = (patternIndex + 3'b001);
  assign when_I2STransmitter_l50 = (bitCounter == 5'h0);
  assign io_bclk = (active && (cycleCounter < 5'h08));
  assign io_lrclk = ((! active) || (5'h10 <= bitCounter));
  assign io_sdata = (active && shiftReg[31]);
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      cycleCounter <= 5'h0f;
      patternIndex <= 3'b000;
      bitCounter <= 5'h0;
      shiftReg <= 32'h0;
      sampleBuffer <= 16'h0;
      active <= 1'b0;
    end else begin
      if(io_sampleIn_valid) begin
        sampleBuffer <= io_sampleIn_payload;
        if(when_I2STransmitter_l30) begin
          active <= 1'b1;
          bitCounter <= 5'h0;
          patternIndex <= 3'b000;
          cycleCounter <= (patternTable_0 - 5'h01);
        end
      end
      if(active) begin
        if(when_I2STransmitter_l40) begin
          patternIndex <= _zz_cycleCounter;
          cycleCounter <= (_zz_cycleCounter_1 - 5'h01);
          bitCounter <= (bitCounter + 5'h01);
          if(when_I2STransmitter_l50) begin
            shiftReg <= {sampleBuffer,sampleBuffer};
          end else begin
            shiftReg <= _zz_shiftReg[31:0];
          end
        end else begin
          cycleCounter <= (cycleCounter - 5'h01);
        end
      end
    end
  end


endmodule

module Decimator (
  input  wire          io_sampleTick,
  input  wire          io_sampleIn_valid,
  input  wire [15:0]   io_sampleIn_payload,
  output wire          io_sampleOut_valid,
  output wire [15:0]   io_sampleOut_payload,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [15:0]   sampleReg;
  wire                when_Decimator_l17;
  reg                 _zz_io_sampleOut_valid;

  assign when_Decimator_l17 = (io_sampleIn_valid && io_sampleTick);
  assign io_sampleOut_payload = sampleReg;
  assign io_sampleOut_valid = _zz_io_sampleOut_valid;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      sampleReg <= 16'h0;
      _zz_io_sampleOut_valid <= 1'b0;
    end else begin
      if(when_Decimator_l17) begin
        sampleReg <= io_sampleIn_payload;
      end
      _zz_io_sampleOut_valid <= (io_sampleIn_valid && io_sampleTick);
    end
  end


endmodule

module Attenuator_1 (
  input  wire          io_sampleIn_valid,
  input  wire [15:0]   io_sampleIn_payload,
  input  wire [7:0]    io_volume,
  output wire          io_sampleOut_valid,
  output wire [15:0]   io_sampleOut_payload,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  wire       [16:0]   _zz_scaledSample;
  wire       [8:0]    volumeSigned;
  wire       [24:0]   product;
  wire       [15:0]   scaledSample;
  reg        [15:0]   scaledSample_regNext;
  reg                 io_sampleIn_valid_regNext;

  assign _zz_scaledSample = (product >>> 4'd8);
  assign volumeSigned = {1'b0,io_volume};
  assign product = ($signed(io_sampleIn_payload) * $signed(volumeSigned));
  assign scaledSample = _zz_scaledSample[15:0];
  assign io_sampleOut_payload = scaledSample_regNext;
  assign io_sampleOut_valid = io_sampleIn_valid_regNext;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      scaledSample_regNext <= 16'h0;
      io_sampleIn_valid_regNext <= 1'b0;
    end else begin
      scaledSample_regNext <= scaledSample;
      io_sampleIn_valid_regNext <= io_sampleIn_valid;
    end
  end


endmodule

module Attenuator (
  input  wire          io_sampleIn_valid,
  input  wire [15:0]   io_sampleIn_payload,
  input  wire [9:0]    io_volume,
  output wire          io_sampleOut_valid,
  output wire [15:0]   io_sampleOut_payload,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  wire       [16:0]   _zz_scaledSample;
  wire       [10:0]   volumeSigned;
  wire       [26:0]   product;
  wire       [15:0]   scaledSample;
  reg        [15:0]   scaledSample_regNext;
  reg                 io_sampleIn_valid_regNext;

  assign _zz_scaledSample = (product >>> 4'd10);
  assign volumeSigned = {1'b0,io_volume};
  assign product = ($signed(io_sampleIn_payload) * $signed(volumeSigned));
  assign scaledSample = _zz_scaledSample[15:0];
  assign io_sampleOut_payload = scaledSample_regNext;
  assign io_sampleOut_valid = io_sampleIn_valid_regNext;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      scaledSample_regNext <= 16'h0;
      io_sampleIn_valid_regNext <= 1'b0;
    end else begin
      scaledSample_regNext <= scaledSample;
      io_sampleIn_valid_regNext <= io_sampleIn_valid;
    end
  end


endmodule

module EnvelopeGenerator (
  input  wire          io_phaseTick,
  input  wire          io_syncIn,
  input  wire [7:0]    io_config_ctrl,
  input  wire [7:0]    io_config_attack,
  input  wire [7:0]    io_config_decay,
  input  wire [7:0]    io_config_sustain,
  input  wire [7:0]    io_config_release,
  input  wire [7:0]    io_config_gate,
  output wire          io_envelopeOut_valid,
  output wire [9:0]    io_envelopeOut_payload,
  output wire          io_envelopeOutSigned_valid,
  output wire [9:0]    io_envelopeOutSigned_payload,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);

  wire                ctrl_io_resetAccum;
  wire                ctrl_io_runAccum;
  wire                ctrl_io_accumDir;
  wire       [21:0]   ctrl_io_phaseInc;
  wire       [1:0]    ctrl_io_curveSelect;
  wire       [2:0]    ctrl_io_activeStage;
  wire                accumulator_1_io_segmentDone;
  wire       [7:0]    accumulator_1_io_baseIndex;
  wire       [1:0]    accumulator_1_io_fraction;
  wire                shaper_io_envelopeOut_valid;
  wire       [9:0]    shaper_io_envelopeOut_payload;
  wire                shaper_io_envelopeOutSigned_valid;
  wire       [9:0]    shaper_io_envelopeOutSigned_payload;

  EnvelopeCtrl ctrl (
    .io_syncIn         (io_syncIn                   ), //i
    .io_config_ctrl    (io_config_ctrl[7:0]         ), //i
    .io_config_attack  (io_config_attack[7:0]       ), //i
    .io_config_decay   (io_config_decay[7:0]        ), //i
    .io_config_sustain (io_config_sustain[7:0]      ), //i
    .io_config_release (io_config_release[7:0]      ), //i
    .io_config_gate    (io_config_gate[7:0]         ), //i
    .io_segmentDone    (accumulator_1_io_segmentDone), //i
    .io_resetAccum     (ctrl_io_resetAccum          ), //o
    .io_runAccum       (ctrl_io_runAccum            ), //o
    .io_accumDir       (ctrl_io_accumDir            ), //o
    .io_phaseInc       (ctrl_io_phaseInc[21:0]      ), //o
    .io_curveSelect    (ctrl_io_curveSelect[1:0]    ), //o
    .io_activeStage    (ctrl_io_activeStage[2:0]    ), //o
    .io_reset          (io_reset                    ), //i
    .io_clk24MHz       (io_clk24MHz                 )  //i
  );
  EnvelopeAccumulator accumulator_1 (
    .io_resetAccum   (ctrl_io_resetAccum             ), //i
    .io_runAccum     (ctrl_io_runAccum               ), //i
    .io_accumDir     (ctrl_io_accumDir               ), //i
    .io_phaseInc     (ctrl_io_phaseInc[21:0]         ), //i
    .io_sustainLevel (io_config_sustain[7:0]         ), //i
    .io_activeStage  (ctrl_io_activeStage[2:0]       ), //i
    .io_segmentDone  (accumulator_1_io_segmentDone   ), //o
    .io_baseIndex    (accumulator_1_io_baseIndex[7:0]), //o
    .io_fraction     (accumulator_1_io_fraction[1:0] ), //o
    .io_reset        (io_reset                       ), //i
    .io_clk24MHz     (io_clk24MHz                    )  //i
  );
  EnvelopeShaper shaper (
    .io_phaseTick                 (io_phaseTick                            ), //i
    .io_baseIndex                 (accumulator_1_io_baseIndex[7:0]         ), //i
    .io_fraction                  (accumulator_1_io_fraction[1:0]          ), //i
    .io_curveSelect               (ctrl_io_curveSelect[1:0]                ), //i
    .io_activeStage               (ctrl_io_activeStage[2:0]                ), //i
    .io_accumDir                  (ctrl_io_accumDir                        ), //i
    .io_envelopeOut_valid         (shaper_io_envelopeOut_valid             ), //o
    .io_envelopeOut_payload       (shaper_io_envelopeOut_payload[9:0]      ), //o
    .io_envelopeOutSigned_valid   (shaper_io_envelopeOutSigned_valid       ), //o
    .io_envelopeOutSigned_payload (shaper_io_envelopeOutSigned_payload[9:0]), //o
    .io_reset                     (io_reset                                ), //i
    .io_clk24MHz                  (io_clk24MHz                             )  //i
  );
  assign io_envelopeOut_valid = shaper_io_envelopeOut_valid;
  assign io_envelopeOut_payload = shaper_io_envelopeOut_payload;
  assign io_envelopeOutSigned_valid = shaper_io_envelopeOutSigned_valid;
  assign io_envelopeOutSigned_payload = shaper_io_envelopeOutSigned_payload;

endmodule

module Oscillator (
  input  wire          io_phaseTick,
  input  wire [23:0]   io_config_freqWord,
  input  wire [2:0]    io_config_waveSelect,
  input  wire [7:0]    io_config_pwmWidth,
  input  wire [7:0]    io_config_volume,
  output wire          io_sample_valid,
  output wire [15:0]   io_sample_payload,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  wire       [23:0]   accumulator_1_io_phase;
  wire       [15:0]   generators_1_io_waves_saw;
  wire       [15:0]   generators_1_io_waves_square;
  wire       [15:0]   generators_1_io_waves_pwm;
  wire       [15:0]   generators_1_io_waves_tri;
  wire       [15:0]   noise_1_io_sample;
  wire       [15:0]   mux_1_io_sample;

  Accumulator accumulator_1 (
    .io_phaseTick (io_phaseTick                ), //i
    .io_freqWord  (io_config_freqWord[23:0]    ), //i
    .io_phase     (accumulator_1_io_phase[23:0]), //o
    .io_clk24MHz  (io_clk24MHz                 ), //i
    .io_reset     (io_reset                    )  //i
  );
  Generators generators_1 (
    .io_phase        (accumulator_1_io_phase[23:0]      ), //i
    .io_pwmWidth     (io_config_pwmWidth[7:0]           ), //i
    .io_waves_saw    (generators_1_io_waves_saw[15:0]   ), //o
    .io_waves_square (generators_1_io_waves_square[15:0]), //o
    .io_waves_pwm    (generators_1_io_waves_pwm[15:0]   ), //o
    .io_waves_tri    (generators_1_io_waves_tri[15:0]   )  //o
  );
  Noise noise_1 (
    .io_phaseTick (io_phaseTick           ), //i
    .io_sample    (noise_1_io_sample[15:0]), //o
    .io_clk24MHz  (io_clk24MHz            ), //i
    .io_reset     (io_reset               )  //i
  );
  Mux mux_1 (
    .io_waveSelect   (io_config_waveSelect[2:0]         ), //i
    .io_waves_saw    (generators_1_io_waves_saw[15:0]   ), //i
    .io_waves_square (generators_1_io_waves_square[15:0]), //i
    .io_waves_pwm    (generators_1_io_waves_pwm[15:0]   ), //i
    .io_waves_tri    (generators_1_io_waves_tri[15:0]   ), //i
    .io_noiseWave    (noise_1_io_sample[15:0]           ), //i
    .io_sample       (mux_1_io_sample[15:0]             )  //o
  );
  assign io_sample_valid = io_phaseTick;
  assign io_sample_payload = mux_1_io_sample;

endmodule

module TimingGenerator (
  output wire          io_phaseTick,
  output wire          io_sampleTick,
  input  wire          io_clk24MHz,
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
  always @(posedge io_clk24MHz or posedge io_reset) begin
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

module Uart (
  input  wire          io_rx,
  output wire [23:0]   io_config_freqWord,
  output wire [2:0]    io_config_waveSelect,
  output wire [7:0]    io_config_pwmWidth,
  output wire [7:0]    io_config_volume,
  output wire [7:0]    io_envConfig_ctrl,
  output wire [7:0]    io_envConfig_attack,
  output wire [7:0]    io_envConfig_decay,
  output wire [7:0]    io_envConfig_sustain,
  output wire [7:0]    io_envConfig_release,
  output wire [7:0]    io_envConfig_gate,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  wire                rxModule_io_byteOut_valid;
  wire       [7:0]    rxModule_io_byteOut_payload;
  wire                protocolDecoder_io_regWrite_valid;
  wire       [7:0]    protocolDecoder_io_regWrite_payload_address;
  wire       [7:0]    protocolDecoder_io_regWrite_payload_data;
  wire       [23:0]   registerBank_1_io_config_freqWord;
  wire       [2:0]    registerBank_1_io_config_waveSelect;
  wire       [7:0]    registerBank_1_io_config_pwmWidth;
  wire       [7:0]    registerBank_1_io_config_volume;
  wire       [7:0]    registerBank_1_io_envConfig_ctrl;
  wire       [7:0]    registerBank_1_io_envConfig_attack;
  wire       [7:0]    registerBank_1_io_envConfig_decay;
  wire       [7:0]    registerBank_1_io_envConfig_sustain;
  wire       [7:0]    registerBank_1_io_envConfig_release;
  wire       [7:0]    registerBank_1_io_envConfig_gate;

  UartRx rxModule (
    .io_rx              (io_rx                           ), //i
    .io_byteOut_valid   (rxModule_io_byteOut_valid       ), //o
    .io_byteOut_payload (rxModule_io_byteOut_payload[7:0]), //o
    .io_clk24MHz        (io_clk24MHz                     ), //i
    .io_reset           (io_reset                        )  //i
  );
  UartProtocolDecoder protocolDecoder (
    .io_rxByte_valid             (rxModule_io_byteOut_valid                       ), //i
    .io_rxByte_payload           (rxModule_io_byteOut_payload[7:0]                ), //i
    .io_regWrite_valid           (protocolDecoder_io_regWrite_valid               ), //o
    .io_regWrite_payload_address (protocolDecoder_io_regWrite_payload_address[7:0]), //o
    .io_regWrite_payload_data    (protocolDecoder_io_regWrite_payload_data[7:0]   ), //o
    .io_clk24MHz                 (io_clk24MHz                                     ), //i
    .io_reset                    (io_reset                                        )  //i
  );
  RegisterBank registerBank_1 (
    .io_regWrite_valid           (protocolDecoder_io_regWrite_valid               ), //i
    .io_regWrite_payload_address (protocolDecoder_io_regWrite_payload_address[7:0]), //i
    .io_regWrite_payload_data    (protocolDecoder_io_regWrite_payload_data[7:0]   ), //i
    .io_config_freqWord          (registerBank_1_io_config_freqWord[23:0]         ), //o
    .io_config_waveSelect        (registerBank_1_io_config_waveSelect[2:0]        ), //o
    .io_config_pwmWidth          (registerBank_1_io_config_pwmWidth[7:0]          ), //o
    .io_config_volume            (registerBank_1_io_config_volume[7:0]            ), //o
    .io_envConfig_ctrl           (registerBank_1_io_envConfig_ctrl[7:0]           ), //o
    .io_envConfig_attack         (registerBank_1_io_envConfig_attack[7:0]         ), //o
    .io_envConfig_decay          (registerBank_1_io_envConfig_decay[7:0]          ), //o
    .io_envConfig_sustain        (registerBank_1_io_envConfig_sustain[7:0]        ), //o
    .io_envConfig_release        (registerBank_1_io_envConfig_release[7:0]        ), //o
    .io_envConfig_gate           (registerBank_1_io_envConfig_gate[7:0]           ), //o
    .io_clk24MHz                 (io_clk24MHz                                     ), //i
    .io_reset                    (io_reset                                        )  //i
  );
  assign io_config_freqWord = registerBank_1_io_config_freqWord;
  assign io_config_waveSelect = registerBank_1_io_config_waveSelect;
  assign io_config_pwmWidth = registerBank_1_io_config_pwmWidth;
  assign io_config_volume = registerBank_1_io_config_volume;
  assign io_envConfig_ctrl = registerBank_1_io_envConfig_ctrl;
  assign io_envConfig_attack = registerBank_1_io_envConfig_attack;
  assign io_envConfig_decay = registerBank_1_io_envConfig_decay;
  assign io_envConfig_sustain = registerBank_1_io_envConfig_sustain;
  assign io_envConfig_release = registerBank_1_io_envConfig_release;
  assign io_envConfig_gate = registerBank_1_io_envConfig_gate;

endmodule

module EnvelopeShaper (
  input  wire          io_phaseTick,
  input  wire [7:0]    io_baseIndex,
  input  wire [1:0]    io_fraction,
  input  wire [1:0]    io_curveSelect,
  input  wire [2:0]    io_activeStage,
  input  wire          io_accumDir,
  output wire          io_envelopeOut_valid,
  output wire [9:0]    io_envelopeOut_payload,
  output wire          io_envelopeOutSigned_valid,
  output wire [9:0]    io_envelopeOutSigned_payload,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);

  wire       [7:0]    linRom_spinal_port0;
  wire       [7:0]    linRom_spinal_port1;
  wire       [7:0]    expRom_spinal_port0;
  wire       [7:0]    expRom_spinal_port1;
  wire       [7:0]    logRom_spinal_port0;
  wire       [7:0]    logRom_spinal_port1;
  wire       [7:0]    sigRom_spinal_port0;
  wire       [7:0]    sigRom_spinal_port1;
  wire       [8:0]    _zz_addr1;
  wire       [10:0]   _zz_y0Shifted;
  wire       [9:0]    _zz_deltaShifted;
  wire       [1:0]    _zz_fractionAdjusted;
  wire       [11:0]   _zz_interp;
  wire       [11:0]   _zz_finalValUnipolar;
  wire       [7:0]    linContent_0;
  wire       [7:0]    linContent_1;
  wire       [7:0]    linContent_2;
  wire       [7:0]    linContent_3;
  wire       [7:0]    linContent_4;
  wire       [7:0]    linContent_5;
  wire       [7:0]    linContent_6;
  wire       [7:0]    linContent_7;
  wire       [7:0]    linContent_8;
  wire       [7:0]    linContent_9;
  wire       [7:0]    linContent_10;
  wire       [7:0]    linContent_11;
  wire       [7:0]    linContent_12;
  wire       [7:0]    linContent_13;
  wire       [7:0]    linContent_14;
  wire       [7:0]    linContent_15;
  wire       [7:0]    linContent_16;
  wire       [7:0]    linContent_17;
  wire       [7:0]    linContent_18;
  wire       [7:0]    linContent_19;
  wire       [7:0]    linContent_20;
  wire       [7:0]    linContent_21;
  wire       [7:0]    linContent_22;
  wire       [7:0]    linContent_23;
  wire       [7:0]    linContent_24;
  wire       [7:0]    linContent_25;
  wire       [7:0]    linContent_26;
  wire       [7:0]    linContent_27;
  wire       [7:0]    linContent_28;
  wire       [7:0]    linContent_29;
  wire       [7:0]    linContent_30;
  wire       [7:0]    linContent_31;
  wire       [7:0]    linContent_32;
  wire       [7:0]    linContent_33;
  wire       [7:0]    linContent_34;
  wire       [7:0]    linContent_35;
  wire       [7:0]    linContent_36;
  wire       [7:0]    linContent_37;
  wire       [7:0]    linContent_38;
  wire       [7:0]    linContent_39;
  wire       [7:0]    linContent_40;
  wire       [7:0]    linContent_41;
  wire       [7:0]    linContent_42;
  wire       [7:0]    linContent_43;
  wire       [7:0]    linContent_44;
  wire       [7:0]    linContent_45;
  wire       [7:0]    linContent_46;
  wire       [7:0]    linContent_47;
  wire       [7:0]    linContent_48;
  wire       [7:0]    linContent_49;
  wire       [7:0]    linContent_50;
  wire       [7:0]    linContent_51;
  wire       [7:0]    linContent_52;
  wire       [7:0]    linContent_53;
  wire       [7:0]    linContent_54;
  wire       [7:0]    linContent_55;
  wire       [7:0]    linContent_56;
  wire       [7:0]    linContent_57;
  wire       [7:0]    linContent_58;
  wire       [7:0]    linContent_59;
  wire       [7:0]    linContent_60;
  wire       [7:0]    linContent_61;
  wire       [7:0]    linContent_62;
  wire       [7:0]    linContent_63;
  wire       [7:0]    linContent_64;
  wire       [7:0]    linContent_65;
  wire       [7:0]    linContent_66;
  wire       [7:0]    linContent_67;
  wire       [7:0]    linContent_68;
  wire       [7:0]    linContent_69;
  wire       [7:0]    linContent_70;
  wire       [7:0]    linContent_71;
  wire       [7:0]    linContent_72;
  wire       [7:0]    linContent_73;
  wire       [7:0]    linContent_74;
  wire       [7:0]    linContent_75;
  wire       [7:0]    linContent_76;
  wire       [7:0]    linContent_77;
  wire       [7:0]    linContent_78;
  wire       [7:0]    linContent_79;
  wire       [7:0]    linContent_80;
  wire       [7:0]    linContent_81;
  wire       [7:0]    linContent_82;
  wire       [7:0]    linContent_83;
  wire       [7:0]    linContent_84;
  wire       [7:0]    linContent_85;
  wire       [7:0]    linContent_86;
  wire       [7:0]    linContent_87;
  wire       [7:0]    linContent_88;
  wire       [7:0]    linContent_89;
  wire       [7:0]    linContent_90;
  wire       [7:0]    linContent_91;
  wire       [7:0]    linContent_92;
  wire       [7:0]    linContent_93;
  wire       [7:0]    linContent_94;
  wire       [7:0]    linContent_95;
  wire       [7:0]    linContent_96;
  wire       [7:0]    linContent_97;
  wire       [7:0]    linContent_98;
  wire       [7:0]    linContent_99;
  wire       [7:0]    linContent_100;
  wire       [7:0]    linContent_101;
  wire       [7:0]    linContent_102;
  wire       [7:0]    linContent_103;
  wire       [7:0]    linContent_104;
  wire       [7:0]    linContent_105;
  wire       [7:0]    linContent_106;
  wire       [7:0]    linContent_107;
  wire       [7:0]    linContent_108;
  wire       [7:0]    linContent_109;
  wire       [7:0]    linContent_110;
  wire       [7:0]    linContent_111;
  wire       [7:0]    linContent_112;
  wire       [7:0]    linContent_113;
  wire       [7:0]    linContent_114;
  wire       [7:0]    linContent_115;
  wire       [7:0]    linContent_116;
  wire       [7:0]    linContent_117;
  wire       [7:0]    linContent_118;
  wire       [7:0]    linContent_119;
  wire       [7:0]    linContent_120;
  wire       [7:0]    linContent_121;
  wire       [7:0]    linContent_122;
  wire       [7:0]    linContent_123;
  wire       [7:0]    linContent_124;
  wire       [7:0]    linContent_125;
  wire       [7:0]    linContent_126;
  wire       [7:0]    linContent_127;
  wire       [7:0]    linContent_128;
  wire       [7:0]    linContent_129;
  wire       [7:0]    linContent_130;
  wire       [7:0]    linContent_131;
  wire       [7:0]    linContent_132;
  wire       [7:0]    linContent_133;
  wire       [7:0]    linContent_134;
  wire       [7:0]    linContent_135;
  wire       [7:0]    linContent_136;
  wire       [7:0]    linContent_137;
  wire       [7:0]    linContent_138;
  wire       [7:0]    linContent_139;
  wire       [7:0]    linContent_140;
  wire       [7:0]    linContent_141;
  wire       [7:0]    linContent_142;
  wire       [7:0]    linContent_143;
  wire       [7:0]    linContent_144;
  wire       [7:0]    linContent_145;
  wire       [7:0]    linContent_146;
  wire       [7:0]    linContent_147;
  wire       [7:0]    linContent_148;
  wire       [7:0]    linContent_149;
  wire       [7:0]    linContent_150;
  wire       [7:0]    linContent_151;
  wire       [7:0]    linContent_152;
  wire       [7:0]    linContent_153;
  wire       [7:0]    linContent_154;
  wire       [7:0]    linContent_155;
  wire       [7:0]    linContent_156;
  wire       [7:0]    linContent_157;
  wire       [7:0]    linContent_158;
  wire       [7:0]    linContent_159;
  wire       [7:0]    linContent_160;
  wire       [7:0]    linContent_161;
  wire       [7:0]    linContent_162;
  wire       [7:0]    linContent_163;
  wire       [7:0]    linContent_164;
  wire       [7:0]    linContent_165;
  wire       [7:0]    linContent_166;
  wire       [7:0]    linContent_167;
  wire       [7:0]    linContent_168;
  wire       [7:0]    linContent_169;
  wire       [7:0]    linContent_170;
  wire       [7:0]    linContent_171;
  wire       [7:0]    linContent_172;
  wire       [7:0]    linContent_173;
  wire       [7:0]    linContent_174;
  wire       [7:0]    linContent_175;
  wire       [7:0]    linContent_176;
  wire       [7:0]    linContent_177;
  wire       [7:0]    linContent_178;
  wire       [7:0]    linContent_179;
  wire       [7:0]    linContent_180;
  wire       [7:0]    linContent_181;
  wire       [7:0]    linContent_182;
  wire       [7:0]    linContent_183;
  wire       [7:0]    linContent_184;
  wire       [7:0]    linContent_185;
  wire       [7:0]    linContent_186;
  wire       [7:0]    linContent_187;
  wire       [7:0]    linContent_188;
  wire       [7:0]    linContent_189;
  wire       [7:0]    linContent_190;
  wire       [7:0]    linContent_191;
  wire       [7:0]    linContent_192;
  wire       [7:0]    linContent_193;
  wire       [7:0]    linContent_194;
  wire       [7:0]    linContent_195;
  wire       [7:0]    linContent_196;
  wire       [7:0]    linContent_197;
  wire       [7:0]    linContent_198;
  wire       [7:0]    linContent_199;
  wire       [7:0]    linContent_200;
  wire       [7:0]    linContent_201;
  wire       [7:0]    linContent_202;
  wire       [7:0]    linContent_203;
  wire       [7:0]    linContent_204;
  wire       [7:0]    linContent_205;
  wire       [7:0]    linContent_206;
  wire       [7:0]    linContent_207;
  wire       [7:0]    linContent_208;
  wire       [7:0]    linContent_209;
  wire       [7:0]    linContent_210;
  wire       [7:0]    linContent_211;
  wire       [7:0]    linContent_212;
  wire       [7:0]    linContent_213;
  wire       [7:0]    linContent_214;
  wire       [7:0]    linContent_215;
  wire       [7:0]    linContent_216;
  wire       [7:0]    linContent_217;
  wire       [7:0]    linContent_218;
  wire       [7:0]    linContent_219;
  wire       [7:0]    linContent_220;
  wire       [7:0]    linContent_221;
  wire       [7:0]    linContent_222;
  wire       [7:0]    linContent_223;
  wire       [7:0]    linContent_224;
  wire       [7:0]    linContent_225;
  wire       [7:0]    linContent_226;
  wire       [7:0]    linContent_227;
  wire       [7:0]    linContent_228;
  wire       [7:0]    linContent_229;
  wire       [7:0]    linContent_230;
  wire       [7:0]    linContent_231;
  wire       [7:0]    linContent_232;
  wire       [7:0]    linContent_233;
  wire       [7:0]    linContent_234;
  wire       [7:0]    linContent_235;
  wire       [7:0]    linContent_236;
  wire       [7:0]    linContent_237;
  wire       [7:0]    linContent_238;
  wire       [7:0]    linContent_239;
  wire       [7:0]    linContent_240;
  wire       [7:0]    linContent_241;
  wire       [7:0]    linContent_242;
  wire       [7:0]    linContent_243;
  wire       [7:0]    linContent_244;
  wire       [7:0]    linContent_245;
  wire       [7:0]    linContent_246;
  wire       [7:0]    linContent_247;
  wire       [7:0]    linContent_248;
  wire       [7:0]    linContent_249;
  wire       [7:0]    linContent_250;
  wire       [7:0]    linContent_251;
  wire       [7:0]    linContent_252;
  wire       [7:0]    linContent_253;
  wire       [7:0]    linContent_254;
  wire       [7:0]    linContent_255;
  wire       [7:0]    linContent_256;
  wire       [7:0]    expContent_0;
  wire       [7:0]    expContent_1;
  wire       [7:0]    expContent_2;
  wire       [7:0]    expContent_3;
  wire       [7:0]    expContent_4;
  wire       [7:0]    expContent_5;
  wire       [7:0]    expContent_6;
  wire       [7:0]    expContent_7;
  wire       [7:0]    expContent_8;
  wire       [7:0]    expContent_9;
  wire       [7:0]    expContent_10;
  wire       [7:0]    expContent_11;
  wire       [7:0]    expContent_12;
  wire       [7:0]    expContent_13;
  wire       [7:0]    expContent_14;
  wire       [7:0]    expContent_15;
  wire       [7:0]    expContent_16;
  wire       [7:0]    expContent_17;
  wire       [7:0]    expContent_18;
  wire       [7:0]    expContent_19;
  wire       [7:0]    expContent_20;
  wire       [7:0]    expContent_21;
  wire       [7:0]    expContent_22;
  wire       [7:0]    expContent_23;
  wire       [7:0]    expContent_24;
  wire       [7:0]    expContent_25;
  wire       [7:0]    expContent_26;
  wire       [7:0]    expContent_27;
  wire       [7:0]    expContent_28;
  wire       [7:0]    expContent_29;
  wire       [7:0]    expContent_30;
  wire       [7:0]    expContent_31;
  wire       [7:0]    expContent_32;
  wire       [7:0]    expContent_33;
  wire       [7:0]    expContent_34;
  wire       [7:0]    expContent_35;
  wire       [7:0]    expContent_36;
  wire       [7:0]    expContent_37;
  wire       [7:0]    expContent_38;
  wire       [7:0]    expContent_39;
  wire       [7:0]    expContent_40;
  wire       [7:0]    expContent_41;
  wire       [7:0]    expContent_42;
  wire       [7:0]    expContent_43;
  wire       [7:0]    expContent_44;
  wire       [7:0]    expContent_45;
  wire       [7:0]    expContent_46;
  wire       [7:0]    expContent_47;
  wire       [7:0]    expContent_48;
  wire       [7:0]    expContent_49;
  wire       [7:0]    expContent_50;
  wire       [7:0]    expContent_51;
  wire       [7:0]    expContent_52;
  wire       [7:0]    expContent_53;
  wire       [7:0]    expContent_54;
  wire       [7:0]    expContent_55;
  wire       [7:0]    expContent_56;
  wire       [7:0]    expContent_57;
  wire       [7:0]    expContent_58;
  wire       [7:0]    expContent_59;
  wire       [7:0]    expContent_60;
  wire       [7:0]    expContent_61;
  wire       [7:0]    expContent_62;
  wire       [7:0]    expContent_63;
  wire       [7:0]    expContent_64;
  wire       [7:0]    expContent_65;
  wire       [7:0]    expContent_66;
  wire       [7:0]    expContent_67;
  wire       [7:0]    expContent_68;
  wire       [7:0]    expContent_69;
  wire       [7:0]    expContent_70;
  wire       [7:0]    expContent_71;
  wire       [7:0]    expContent_72;
  wire       [7:0]    expContent_73;
  wire       [7:0]    expContent_74;
  wire       [7:0]    expContent_75;
  wire       [7:0]    expContent_76;
  wire       [7:0]    expContent_77;
  wire       [7:0]    expContent_78;
  wire       [7:0]    expContent_79;
  wire       [7:0]    expContent_80;
  wire       [7:0]    expContent_81;
  wire       [7:0]    expContent_82;
  wire       [7:0]    expContent_83;
  wire       [7:0]    expContent_84;
  wire       [7:0]    expContent_85;
  wire       [7:0]    expContent_86;
  wire       [7:0]    expContent_87;
  wire       [7:0]    expContent_88;
  wire       [7:0]    expContent_89;
  wire       [7:0]    expContent_90;
  wire       [7:0]    expContent_91;
  wire       [7:0]    expContent_92;
  wire       [7:0]    expContent_93;
  wire       [7:0]    expContent_94;
  wire       [7:0]    expContent_95;
  wire       [7:0]    expContent_96;
  wire       [7:0]    expContent_97;
  wire       [7:0]    expContent_98;
  wire       [7:0]    expContent_99;
  wire       [7:0]    expContent_100;
  wire       [7:0]    expContent_101;
  wire       [7:0]    expContent_102;
  wire       [7:0]    expContent_103;
  wire       [7:0]    expContent_104;
  wire       [7:0]    expContent_105;
  wire       [7:0]    expContent_106;
  wire       [7:0]    expContent_107;
  wire       [7:0]    expContent_108;
  wire       [7:0]    expContent_109;
  wire       [7:0]    expContent_110;
  wire       [7:0]    expContent_111;
  wire       [7:0]    expContent_112;
  wire       [7:0]    expContent_113;
  wire       [7:0]    expContent_114;
  wire       [7:0]    expContent_115;
  wire       [7:0]    expContent_116;
  wire       [7:0]    expContent_117;
  wire       [7:0]    expContent_118;
  wire       [7:0]    expContent_119;
  wire       [7:0]    expContent_120;
  wire       [7:0]    expContent_121;
  wire       [7:0]    expContent_122;
  wire       [7:0]    expContent_123;
  wire       [7:0]    expContent_124;
  wire       [7:0]    expContent_125;
  wire       [7:0]    expContent_126;
  wire       [7:0]    expContent_127;
  wire       [7:0]    expContent_128;
  wire       [7:0]    expContent_129;
  wire       [7:0]    expContent_130;
  wire       [7:0]    expContent_131;
  wire       [7:0]    expContent_132;
  wire       [7:0]    expContent_133;
  wire       [7:0]    expContent_134;
  wire       [7:0]    expContent_135;
  wire       [7:0]    expContent_136;
  wire       [7:0]    expContent_137;
  wire       [7:0]    expContent_138;
  wire       [7:0]    expContent_139;
  wire       [7:0]    expContent_140;
  wire       [7:0]    expContent_141;
  wire       [7:0]    expContent_142;
  wire       [7:0]    expContent_143;
  wire       [7:0]    expContent_144;
  wire       [7:0]    expContent_145;
  wire       [7:0]    expContent_146;
  wire       [7:0]    expContent_147;
  wire       [7:0]    expContent_148;
  wire       [7:0]    expContent_149;
  wire       [7:0]    expContent_150;
  wire       [7:0]    expContent_151;
  wire       [7:0]    expContent_152;
  wire       [7:0]    expContent_153;
  wire       [7:0]    expContent_154;
  wire       [7:0]    expContent_155;
  wire       [7:0]    expContent_156;
  wire       [7:0]    expContent_157;
  wire       [7:0]    expContent_158;
  wire       [7:0]    expContent_159;
  wire       [7:0]    expContent_160;
  wire       [7:0]    expContent_161;
  wire       [7:0]    expContent_162;
  wire       [7:0]    expContent_163;
  wire       [7:0]    expContent_164;
  wire       [7:0]    expContent_165;
  wire       [7:0]    expContent_166;
  wire       [7:0]    expContent_167;
  wire       [7:0]    expContent_168;
  wire       [7:0]    expContent_169;
  wire       [7:0]    expContent_170;
  wire       [7:0]    expContent_171;
  wire       [7:0]    expContent_172;
  wire       [7:0]    expContent_173;
  wire       [7:0]    expContent_174;
  wire       [7:0]    expContent_175;
  wire       [7:0]    expContent_176;
  wire       [7:0]    expContent_177;
  wire       [7:0]    expContent_178;
  wire       [7:0]    expContent_179;
  wire       [7:0]    expContent_180;
  wire       [7:0]    expContent_181;
  wire       [7:0]    expContent_182;
  wire       [7:0]    expContent_183;
  wire       [7:0]    expContent_184;
  wire       [7:0]    expContent_185;
  wire       [7:0]    expContent_186;
  wire       [7:0]    expContent_187;
  wire       [7:0]    expContent_188;
  wire       [7:0]    expContent_189;
  wire       [7:0]    expContent_190;
  wire       [7:0]    expContent_191;
  wire       [7:0]    expContent_192;
  wire       [7:0]    expContent_193;
  wire       [7:0]    expContent_194;
  wire       [7:0]    expContent_195;
  wire       [7:0]    expContent_196;
  wire       [7:0]    expContent_197;
  wire       [7:0]    expContent_198;
  wire       [7:0]    expContent_199;
  wire       [7:0]    expContent_200;
  wire       [7:0]    expContent_201;
  wire       [7:0]    expContent_202;
  wire       [7:0]    expContent_203;
  wire       [7:0]    expContent_204;
  wire       [7:0]    expContent_205;
  wire       [7:0]    expContent_206;
  wire       [7:0]    expContent_207;
  wire       [7:0]    expContent_208;
  wire       [7:0]    expContent_209;
  wire       [7:0]    expContent_210;
  wire       [7:0]    expContent_211;
  wire       [7:0]    expContent_212;
  wire       [7:0]    expContent_213;
  wire       [7:0]    expContent_214;
  wire       [7:0]    expContent_215;
  wire       [7:0]    expContent_216;
  wire       [7:0]    expContent_217;
  wire       [7:0]    expContent_218;
  wire       [7:0]    expContent_219;
  wire       [7:0]    expContent_220;
  wire       [7:0]    expContent_221;
  wire       [7:0]    expContent_222;
  wire       [7:0]    expContent_223;
  wire       [7:0]    expContent_224;
  wire       [7:0]    expContent_225;
  wire       [7:0]    expContent_226;
  wire       [7:0]    expContent_227;
  wire       [7:0]    expContent_228;
  wire       [7:0]    expContent_229;
  wire       [7:0]    expContent_230;
  wire       [7:0]    expContent_231;
  wire       [7:0]    expContent_232;
  wire       [7:0]    expContent_233;
  wire       [7:0]    expContent_234;
  wire       [7:0]    expContent_235;
  wire       [7:0]    expContent_236;
  wire       [7:0]    expContent_237;
  wire       [7:0]    expContent_238;
  wire       [7:0]    expContent_239;
  wire       [7:0]    expContent_240;
  wire       [7:0]    expContent_241;
  wire       [7:0]    expContent_242;
  wire       [7:0]    expContent_243;
  wire       [7:0]    expContent_244;
  wire       [7:0]    expContent_245;
  wire       [7:0]    expContent_246;
  wire       [7:0]    expContent_247;
  wire       [7:0]    expContent_248;
  wire       [7:0]    expContent_249;
  wire       [7:0]    expContent_250;
  wire       [7:0]    expContent_251;
  wire       [7:0]    expContent_252;
  wire       [7:0]    expContent_253;
  wire       [7:0]    expContent_254;
  wire       [7:0]    expContent_255;
  wire       [7:0]    expContent_256;
  wire       [7:0]    logContent_0;
  wire       [7:0]    logContent_1;
  wire       [7:0]    logContent_2;
  wire       [7:0]    logContent_3;
  wire       [7:0]    logContent_4;
  wire       [7:0]    logContent_5;
  wire       [7:0]    logContent_6;
  wire       [7:0]    logContent_7;
  wire       [7:0]    logContent_8;
  wire       [7:0]    logContent_9;
  wire       [7:0]    logContent_10;
  wire       [7:0]    logContent_11;
  wire       [7:0]    logContent_12;
  wire       [7:0]    logContent_13;
  wire       [7:0]    logContent_14;
  wire       [7:0]    logContent_15;
  wire       [7:0]    logContent_16;
  wire       [7:0]    logContent_17;
  wire       [7:0]    logContent_18;
  wire       [7:0]    logContent_19;
  wire       [7:0]    logContent_20;
  wire       [7:0]    logContent_21;
  wire       [7:0]    logContent_22;
  wire       [7:0]    logContent_23;
  wire       [7:0]    logContent_24;
  wire       [7:0]    logContent_25;
  wire       [7:0]    logContent_26;
  wire       [7:0]    logContent_27;
  wire       [7:0]    logContent_28;
  wire       [7:0]    logContent_29;
  wire       [7:0]    logContent_30;
  wire       [7:0]    logContent_31;
  wire       [7:0]    logContent_32;
  wire       [7:0]    logContent_33;
  wire       [7:0]    logContent_34;
  wire       [7:0]    logContent_35;
  wire       [7:0]    logContent_36;
  wire       [7:0]    logContent_37;
  wire       [7:0]    logContent_38;
  wire       [7:0]    logContent_39;
  wire       [7:0]    logContent_40;
  wire       [7:0]    logContent_41;
  wire       [7:0]    logContent_42;
  wire       [7:0]    logContent_43;
  wire       [7:0]    logContent_44;
  wire       [7:0]    logContent_45;
  wire       [7:0]    logContent_46;
  wire       [7:0]    logContent_47;
  wire       [7:0]    logContent_48;
  wire       [7:0]    logContent_49;
  wire       [7:0]    logContent_50;
  wire       [7:0]    logContent_51;
  wire       [7:0]    logContent_52;
  wire       [7:0]    logContent_53;
  wire       [7:0]    logContent_54;
  wire       [7:0]    logContent_55;
  wire       [7:0]    logContent_56;
  wire       [7:0]    logContent_57;
  wire       [7:0]    logContent_58;
  wire       [7:0]    logContent_59;
  wire       [7:0]    logContent_60;
  wire       [7:0]    logContent_61;
  wire       [7:0]    logContent_62;
  wire       [7:0]    logContent_63;
  wire       [7:0]    logContent_64;
  wire       [7:0]    logContent_65;
  wire       [7:0]    logContent_66;
  wire       [7:0]    logContent_67;
  wire       [7:0]    logContent_68;
  wire       [7:0]    logContent_69;
  wire       [7:0]    logContent_70;
  wire       [7:0]    logContent_71;
  wire       [7:0]    logContent_72;
  wire       [7:0]    logContent_73;
  wire       [7:0]    logContent_74;
  wire       [7:0]    logContent_75;
  wire       [7:0]    logContent_76;
  wire       [7:0]    logContent_77;
  wire       [7:0]    logContent_78;
  wire       [7:0]    logContent_79;
  wire       [7:0]    logContent_80;
  wire       [7:0]    logContent_81;
  wire       [7:0]    logContent_82;
  wire       [7:0]    logContent_83;
  wire       [7:0]    logContent_84;
  wire       [7:0]    logContent_85;
  wire       [7:0]    logContent_86;
  wire       [7:0]    logContent_87;
  wire       [7:0]    logContent_88;
  wire       [7:0]    logContent_89;
  wire       [7:0]    logContent_90;
  wire       [7:0]    logContent_91;
  wire       [7:0]    logContent_92;
  wire       [7:0]    logContent_93;
  wire       [7:0]    logContent_94;
  wire       [7:0]    logContent_95;
  wire       [7:0]    logContent_96;
  wire       [7:0]    logContent_97;
  wire       [7:0]    logContent_98;
  wire       [7:0]    logContent_99;
  wire       [7:0]    logContent_100;
  wire       [7:0]    logContent_101;
  wire       [7:0]    logContent_102;
  wire       [7:0]    logContent_103;
  wire       [7:0]    logContent_104;
  wire       [7:0]    logContent_105;
  wire       [7:0]    logContent_106;
  wire       [7:0]    logContent_107;
  wire       [7:0]    logContent_108;
  wire       [7:0]    logContent_109;
  wire       [7:0]    logContent_110;
  wire       [7:0]    logContent_111;
  wire       [7:0]    logContent_112;
  wire       [7:0]    logContent_113;
  wire       [7:0]    logContent_114;
  wire       [7:0]    logContent_115;
  wire       [7:0]    logContent_116;
  wire       [7:0]    logContent_117;
  wire       [7:0]    logContent_118;
  wire       [7:0]    logContent_119;
  wire       [7:0]    logContent_120;
  wire       [7:0]    logContent_121;
  wire       [7:0]    logContent_122;
  wire       [7:0]    logContent_123;
  wire       [7:0]    logContent_124;
  wire       [7:0]    logContent_125;
  wire       [7:0]    logContent_126;
  wire       [7:0]    logContent_127;
  wire       [7:0]    logContent_128;
  wire       [7:0]    logContent_129;
  wire       [7:0]    logContent_130;
  wire       [7:0]    logContent_131;
  wire       [7:0]    logContent_132;
  wire       [7:0]    logContent_133;
  wire       [7:0]    logContent_134;
  wire       [7:0]    logContent_135;
  wire       [7:0]    logContent_136;
  wire       [7:0]    logContent_137;
  wire       [7:0]    logContent_138;
  wire       [7:0]    logContent_139;
  wire       [7:0]    logContent_140;
  wire       [7:0]    logContent_141;
  wire       [7:0]    logContent_142;
  wire       [7:0]    logContent_143;
  wire       [7:0]    logContent_144;
  wire       [7:0]    logContent_145;
  wire       [7:0]    logContent_146;
  wire       [7:0]    logContent_147;
  wire       [7:0]    logContent_148;
  wire       [7:0]    logContent_149;
  wire       [7:0]    logContent_150;
  wire       [7:0]    logContent_151;
  wire       [7:0]    logContent_152;
  wire       [7:0]    logContent_153;
  wire       [7:0]    logContent_154;
  wire       [7:0]    logContent_155;
  wire       [7:0]    logContent_156;
  wire       [7:0]    logContent_157;
  wire       [7:0]    logContent_158;
  wire       [7:0]    logContent_159;
  wire       [7:0]    logContent_160;
  wire       [7:0]    logContent_161;
  wire       [7:0]    logContent_162;
  wire       [7:0]    logContent_163;
  wire       [7:0]    logContent_164;
  wire       [7:0]    logContent_165;
  wire       [7:0]    logContent_166;
  wire       [7:0]    logContent_167;
  wire       [7:0]    logContent_168;
  wire       [7:0]    logContent_169;
  wire       [7:0]    logContent_170;
  wire       [7:0]    logContent_171;
  wire       [7:0]    logContent_172;
  wire       [7:0]    logContent_173;
  wire       [7:0]    logContent_174;
  wire       [7:0]    logContent_175;
  wire       [7:0]    logContent_176;
  wire       [7:0]    logContent_177;
  wire       [7:0]    logContent_178;
  wire       [7:0]    logContent_179;
  wire       [7:0]    logContent_180;
  wire       [7:0]    logContent_181;
  wire       [7:0]    logContent_182;
  wire       [7:0]    logContent_183;
  wire       [7:0]    logContent_184;
  wire       [7:0]    logContent_185;
  wire       [7:0]    logContent_186;
  wire       [7:0]    logContent_187;
  wire       [7:0]    logContent_188;
  wire       [7:0]    logContent_189;
  wire       [7:0]    logContent_190;
  wire       [7:0]    logContent_191;
  wire       [7:0]    logContent_192;
  wire       [7:0]    logContent_193;
  wire       [7:0]    logContent_194;
  wire       [7:0]    logContent_195;
  wire       [7:0]    logContent_196;
  wire       [7:0]    logContent_197;
  wire       [7:0]    logContent_198;
  wire       [7:0]    logContent_199;
  wire       [7:0]    logContent_200;
  wire       [7:0]    logContent_201;
  wire       [7:0]    logContent_202;
  wire       [7:0]    logContent_203;
  wire       [7:0]    logContent_204;
  wire       [7:0]    logContent_205;
  wire       [7:0]    logContent_206;
  wire       [7:0]    logContent_207;
  wire       [7:0]    logContent_208;
  wire       [7:0]    logContent_209;
  wire       [7:0]    logContent_210;
  wire       [7:0]    logContent_211;
  wire       [7:0]    logContent_212;
  wire       [7:0]    logContent_213;
  wire       [7:0]    logContent_214;
  wire       [7:0]    logContent_215;
  wire       [7:0]    logContent_216;
  wire       [7:0]    logContent_217;
  wire       [7:0]    logContent_218;
  wire       [7:0]    logContent_219;
  wire       [7:0]    logContent_220;
  wire       [7:0]    logContent_221;
  wire       [7:0]    logContent_222;
  wire       [7:0]    logContent_223;
  wire       [7:0]    logContent_224;
  wire       [7:0]    logContent_225;
  wire       [7:0]    logContent_226;
  wire       [7:0]    logContent_227;
  wire       [7:0]    logContent_228;
  wire       [7:0]    logContent_229;
  wire       [7:0]    logContent_230;
  wire       [7:0]    logContent_231;
  wire       [7:0]    logContent_232;
  wire       [7:0]    logContent_233;
  wire       [7:0]    logContent_234;
  wire       [7:0]    logContent_235;
  wire       [7:0]    logContent_236;
  wire       [7:0]    logContent_237;
  wire       [7:0]    logContent_238;
  wire       [7:0]    logContent_239;
  wire       [7:0]    logContent_240;
  wire       [7:0]    logContent_241;
  wire       [7:0]    logContent_242;
  wire       [7:0]    logContent_243;
  wire       [7:0]    logContent_244;
  wire       [7:0]    logContent_245;
  wire       [7:0]    logContent_246;
  wire       [7:0]    logContent_247;
  wire       [7:0]    logContent_248;
  wire       [7:0]    logContent_249;
  wire       [7:0]    logContent_250;
  wire       [7:0]    logContent_251;
  wire       [7:0]    logContent_252;
  wire       [7:0]    logContent_253;
  wire       [7:0]    logContent_254;
  wire       [7:0]    logContent_255;
  wire       [7:0]    logContent_256;
  wire       [7:0]    sigContent_0;
  wire       [7:0]    sigContent_1;
  wire       [7:0]    sigContent_2;
  wire       [7:0]    sigContent_3;
  wire       [7:0]    sigContent_4;
  wire       [7:0]    sigContent_5;
  wire       [7:0]    sigContent_6;
  wire       [7:0]    sigContent_7;
  wire       [7:0]    sigContent_8;
  wire       [7:0]    sigContent_9;
  wire       [7:0]    sigContent_10;
  wire       [7:0]    sigContent_11;
  wire       [7:0]    sigContent_12;
  wire       [7:0]    sigContent_13;
  wire       [7:0]    sigContent_14;
  wire       [7:0]    sigContent_15;
  wire       [7:0]    sigContent_16;
  wire       [7:0]    sigContent_17;
  wire       [7:0]    sigContent_18;
  wire       [7:0]    sigContent_19;
  wire       [7:0]    sigContent_20;
  wire       [7:0]    sigContent_21;
  wire       [7:0]    sigContent_22;
  wire       [7:0]    sigContent_23;
  wire       [7:0]    sigContent_24;
  wire       [7:0]    sigContent_25;
  wire       [7:0]    sigContent_26;
  wire       [7:0]    sigContent_27;
  wire       [7:0]    sigContent_28;
  wire       [7:0]    sigContent_29;
  wire       [7:0]    sigContent_30;
  wire       [7:0]    sigContent_31;
  wire       [7:0]    sigContent_32;
  wire       [7:0]    sigContent_33;
  wire       [7:0]    sigContent_34;
  wire       [7:0]    sigContent_35;
  wire       [7:0]    sigContent_36;
  wire       [7:0]    sigContent_37;
  wire       [7:0]    sigContent_38;
  wire       [7:0]    sigContent_39;
  wire       [7:0]    sigContent_40;
  wire       [7:0]    sigContent_41;
  wire       [7:0]    sigContent_42;
  wire       [7:0]    sigContent_43;
  wire       [7:0]    sigContent_44;
  wire       [7:0]    sigContent_45;
  wire       [7:0]    sigContent_46;
  wire       [7:0]    sigContent_47;
  wire       [7:0]    sigContent_48;
  wire       [7:0]    sigContent_49;
  wire       [7:0]    sigContent_50;
  wire       [7:0]    sigContent_51;
  wire       [7:0]    sigContent_52;
  wire       [7:0]    sigContent_53;
  wire       [7:0]    sigContent_54;
  wire       [7:0]    sigContent_55;
  wire       [7:0]    sigContent_56;
  wire       [7:0]    sigContent_57;
  wire       [7:0]    sigContent_58;
  wire       [7:0]    sigContent_59;
  wire       [7:0]    sigContent_60;
  wire       [7:0]    sigContent_61;
  wire       [7:0]    sigContent_62;
  wire       [7:0]    sigContent_63;
  wire       [7:0]    sigContent_64;
  wire       [7:0]    sigContent_65;
  wire       [7:0]    sigContent_66;
  wire       [7:0]    sigContent_67;
  wire       [7:0]    sigContent_68;
  wire       [7:0]    sigContent_69;
  wire       [7:0]    sigContent_70;
  wire       [7:0]    sigContent_71;
  wire       [7:0]    sigContent_72;
  wire       [7:0]    sigContent_73;
  wire       [7:0]    sigContent_74;
  wire       [7:0]    sigContent_75;
  wire       [7:0]    sigContent_76;
  wire       [7:0]    sigContent_77;
  wire       [7:0]    sigContent_78;
  wire       [7:0]    sigContent_79;
  wire       [7:0]    sigContent_80;
  wire       [7:0]    sigContent_81;
  wire       [7:0]    sigContent_82;
  wire       [7:0]    sigContent_83;
  wire       [7:0]    sigContent_84;
  wire       [7:0]    sigContent_85;
  wire       [7:0]    sigContent_86;
  wire       [7:0]    sigContent_87;
  wire       [7:0]    sigContent_88;
  wire       [7:0]    sigContent_89;
  wire       [7:0]    sigContent_90;
  wire       [7:0]    sigContent_91;
  wire       [7:0]    sigContent_92;
  wire       [7:0]    sigContent_93;
  wire       [7:0]    sigContent_94;
  wire       [7:0]    sigContent_95;
  wire       [7:0]    sigContent_96;
  wire       [7:0]    sigContent_97;
  wire       [7:0]    sigContent_98;
  wire       [7:0]    sigContent_99;
  wire       [7:0]    sigContent_100;
  wire       [7:0]    sigContent_101;
  wire       [7:0]    sigContent_102;
  wire       [7:0]    sigContent_103;
  wire       [7:0]    sigContent_104;
  wire       [7:0]    sigContent_105;
  wire       [7:0]    sigContent_106;
  wire       [7:0]    sigContent_107;
  wire       [7:0]    sigContent_108;
  wire       [7:0]    sigContent_109;
  wire       [7:0]    sigContent_110;
  wire       [7:0]    sigContent_111;
  wire       [7:0]    sigContent_112;
  wire       [7:0]    sigContent_113;
  wire       [7:0]    sigContent_114;
  wire       [7:0]    sigContent_115;
  wire       [7:0]    sigContent_116;
  wire       [7:0]    sigContent_117;
  wire       [7:0]    sigContent_118;
  wire       [7:0]    sigContent_119;
  wire       [7:0]    sigContent_120;
  wire       [7:0]    sigContent_121;
  wire       [7:0]    sigContent_122;
  wire       [7:0]    sigContent_123;
  wire       [7:0]    sigContent_124;
  wire       [7:0]    sigContent_125;
  wire       [7:0]    sigContent_126;
  wire       [7:0]    sigContent_127;
  wire       [7:0]    sigContent_128;
  wire       [7:0]    sigContent_129;
  wire       [7:0]    sigContent_130;
  wire       [7:0]    sigContent_131;
  wire       [7:0]    sigContent_132;
  wire       [7:0]    sigContent_133;
  wire       [7:0]    sigContent_134;
  wire       [7:0]    sigContent_135;
  wire       [7:0]    sigContent_136;
  wire       [7:0]    sigContent_137;
  wire       [7:0]    sigContent_138;
  wire       [7:0]    sigContent_139;
  wire       [7:0]    sigContent_140;
  wire       [7:0]    sigContent_141;
  wire       [7:0]    sigContent_142;
  wire       [7:0]    sigContent_143;
  wire       [7:0]    sigContent_144;
  wire       [7:0]    sigContent_145;
  wire       [7:0]    sigContent_146;
  wire       [7:0]    sigContent_147;
  wire       [7:0]    sigContent_148;
  wire       [7:0]    sigContent_149;
  wire       [7:0]    sigContent_150;
  wire       [7:0]    sigContent_151;
  wire       [7:0]    sigContent_152;
  wire       [7:0]    sigContent_153;
  wire       [7:0]    sigContent_154;
  wire       [7:0]    sigContent_155;
  wire       [7:0]    sigContent_156;
  wire       [7:0]    sigContent_157;
  wire       [7:0]    sigContent_158;
  wire       [7:0]    sigContent_159;
  wire       [7:0]    sigContent_160;
  wire       [7:0]    sigContent_161;
  wire       [7:0]    sigContent_162;
  wire       [7:0]    sigContent_163;
  wire       [7:0]    sigContent_164;
  wire       [7:0]    sigContent_165;
  wire       [7:0]    sigContent_166;
  wire       [7:0]    sigContent_167;
  wire       [7:0]    sigContent_168;
  wire       [7:0]    sigContent_169;
  wire       [7:0]    sigContent_170;
  wire       [7:0]    sigContent_171;
  wire       [7:0]    sigContent_172;
  wire       [7:0]    sigContent_173;
  wire       [7:0]    sigContent_174;
  wire       [7:0]    sigContent_175;
  wire       [7:0]    sigContent_176;
  wire       [7:0]    sigContent_177;
  wire       [7:0]    sigContent_178;
  wire       [7:0]    sigContent_179;
  wire       [7:0]    sigContent_180;
  wire       [7:0]    sigContent_181;
  wire       [7:0]    sigContent_182;
  wire       [7:0]    sigContent_183;
  wire       [7:0]    sigContent_184;
  wire       [7:0]    sigContent_185;
  wire       [7:0]    sigContent_186;
  wire       [7:0]    sigContent_187;
  wire       [7:0]    sigContent_188;
  wire       [7:0]    sigContent_189;
  wire       [7:0]    sigContent_190;
  wire       [7:0]    sigContent_191;
  wire       [7:0]    sigContent_192;
  wire       [7:0]    sigContent_193;
  wire       [7:0]    sigContent_194;
  wire       [7:0]    sigContent_195;
  wire       [7:0]    sigContent_196;
  wire       [7:0]    sigContent_197;
  wire       [7:0]    sigContent_198;
  wire       [7:0]    sigContent_199;
  wire       [7:0]    sigContent_200;
  wire       [7:0]    sigContent_201;
  wire       [7:0]    sigContent_202;
  wire       [7:0]    sigContent_203;
  wire       [7:0]    sigContent_204;
  wire       [7:0]    sigContent_205;
  wire       [7:0]    sigContent_206;
  wire       [7:0]    sigContent_207;
  wire       [7:0]    sigContent_208;
  wire       [7:0]    sigContent_209;
  wire       [7:0]    sigContent_210;
  wire       [7:0]    sigContent_211;
  wire       [7:0]    sigContent_212;
  wire       [7:0]    sigContent_213;
  wire       [7:0]    sigContent_214;
  wire       [7:0]    sigContent_215;
  wire       [7:0]    sigContent_216;
  wire       [7:0]    sigContent_217;
  wire       [7:0]    sigContent_218;
  wire       [7:0]    sigContent_219;
  wire       [7:0]    sigContent_220;
  wire       [7:0]    sigContent_221;
  wire       [7:0]    sigContent_222;
  wire       [7:0]    sigContent_223;
  wire       [7:0]    sigContent_224;
  wire       [7:0]    sigContent_225;
  wire       [7:0]    sigContent_226;
  wire       [7:0]    sigContent_227;
  wire       [7:0]    sigContent_228;
  wire       [7:0]    sigContent_229;
  wire       [7:0]    sigContent_230;
  wire       [7:0]    sigContent_231;
  wire       [7:0]    sigContent_232;
  wire       [7:0]    sigContent_233;
  wire       [7:0]    sigContent_234;
  wire       [7:0]    sigContent_235;
  wire       [7:0]    sigContent_236;
  wire       [7:0]    sigContent_237;
  wire       [7:0]    sigContent_238;
  wire       [7:0]    sigContent_239;
  wire       [7:0]    sigContent_240;
  wire       [7:0]    sigContent_241;
  wire       [7:0]    sigContent_242;
  wire       [7:0]    sigContent_243;
  wire       [7:0]    sigContent_244;
  wire       [7:0]    sigContent_245;
  wire       [7:0]    sigContent_246;
  wire       [7:0]    sigContent_247;
  wire       [7:0]    sigContent_248;
  wire       [7:0]    sigContent_249;
  wire       [7:0]    sigContent_250;
  wire       [7:0]    sigContent_251;
  wire       [7:0]    sigContent_252;
  wire       [7:0]    sigContent_253;
  wire       [7:0]    sigContent_254;
  wire       [7:0]    sigContent_255;
  wire       [7:0]    sigContent_256;
  wire       [8:0]    addr0;
  wire       [8:0]    addr1;
  reg        [7:0]    y0;
  reg        [7:0]    y1;
  wire       [8:0]    y0Signed;
  wire       [8:0]    y1Signed;
  wire       [8:0]    delta;
  reg        [11:0]   interp;
  wire       [11:0]   y0Shifted;
  wire       [11:0]   deltaShifted;
  wire       [11:0]   deltaResized;
  wire       [1:0]    fractionAdjusted;
  wire       [9:0]    finalValUnipolar;
  reg        [9:0]    finalValUnipolar_regNext;
  wire       [9:0]    finalValBipolar;
  reg        [9:0]    finalValBipolar_regNext;
  reg                 outValid;
  reg [7:0] linRom [0:256];
  reg [7:0] expRom [0:256];
  reg [7:0] logRom [0:256];
  reg [7:0] sigRom [0:256];

  assign _zz_addr1 = {1'd0, io_baseIndex};
  assign _zz_y0Shifted = ({2'd0,y0Signed} <<< 2'd2);
  assign _zz_deltaShifted = ({1'd0,delta} <<< 1'd1);
  assign _zz_fractionAdjusted = (2'b11 - io_fraction);
  assign _zz_interp = ($signed(y0Shifted) + $signed(deltaShifted));
  assign _zz_finalValUnipolar = interp;
  initial begin
    $readmemb("Synth.v_toplevel_core_envGen_shaper_linRom.bin",linRom);
  end
  assign linRom_spinal_port0 = linRom[addr0];
  assign linRom_spinal_port1 = linRom[addr1];
  initial begin
    $readmemb("Synth.v_toplevel_core_envGen_shaper_expRom.bin",expRom);
  end
  assign expRom_spinal_port0 = expRom[addr0];
  assign expRom_spinal_port1 = expRom[addr1];
  initial begin
    $readmemb("Synth.v_toplevel_core_envGen_shaper_logRom.bin",logRom);
  end
  assign logRom_spinal_port0 = logRom[addr0];
  assign logRom_spinal_port1 = logRom[addr1];
  initial begin
    $readmemb("Synth.v_toplevel_core_envGen_shaper_sigRom.bin",sigRom);
  end
  assign sigRom_spinal_port0 = sigRom[addr0];
  assign sigRom_spinal_port1 = sigRom[addr1];
  assign linContent_0 = 8'h0;
  assign linContent_1 = 8'h01;
  assign linContent_2 = 8'h02;
  assign linContent_3 = 8'h03;
  assign linContent_4 = 8'h04;
  assign linContent_5 = 8'h05;
  assign linContent_6 = 8'h06;
  assign linContent_7 = 8'h07;
  assign linContent_8 = 8'h08;
  assign linContent_9 = 8'h09;
  assign linContent_10 = 8'h0a;
  assign linContent_11 = 8'h0b;
  assign linContent_12 = 8'h0c;
  assign linContent_13 = 8'h0d;
  assign linContent_14 = 8'h0e;
  assign linContent_15 = 8'h0f;
  assign linContent_16 = 8'h10;
  assign linContent_17 = 8'h11;
  assign linContent_18 = 8'h12;
  assign linContent_19 = 8'h13;
  assign linContent_20 = 8'h14;
  assign linContent_21 = 8'h15;
  assign linContent_22 = 8'h16;
  assign linContent_23 = 8'h17;
  assign linContent_24 = 8'h18;
  assign linContent_25 = 8'h19;
  assign linContent_26 = 8'h1a;
  assign linContent_27 = 8'h1b;
  assign linContent_28 = 8'h1c;
  assign linContent_29 = 8'h1d;
  assign linContent_30 = 8'h1e;
  assign linContent_31 = 8'h1f;
  assign linContent_32 = 8'h20;
  assign linContent_33 = 8'h21;
  assign linContent_34 = 8'h22;
  assign linContent_35 = 8'h23;
  assign linContent_36 = 8'h24;
  assign linContent_37 = 8'h25;
  assign linContent_38 = 8'h26;
  assign linContent_39 = 8'h27;
  assign linContent_40 = 8'h28;
  assign linContent_41 = 8'h29;
  assign linContent_42 = 8'h2a;
  assign linContent_43 = 8'h2b;
  assign linContent_44 = 8'h2c;
  assign linContent_45 = 8'h2d;
  assign linContent_46 = 8'h2e;
  assign linContent_47 = 8'h2f;
  assign linContent_48 = 8'h30;
  assign linContent_49 = 8'h31;
  assign linContent_50 = 8'h32;
  assign linContent_51 = 8'h33;
  assign linContent_52 = 8'h34;
  assign linContent_53 = 8'h35;
  assign linContent_54 = 8'h36;
  assign linContent_55 = 8'h37;
  assign linContent_56 = 8'h38;
  assign linContent_57 = 8'h39;
  assign linContent_58 = 8'h3a;
  assign linContent_59 = 8'h3b;
  assign linContent_60 = 8'h3c;
  assign linContent_61 = 8'h3d;
  assign linContent_62 = 8'h3e;
  assign linContent_63 = 8'h3f;
  assign linContent_64 = 8'h40;
  assign linContent_65 = 8'h41;
  assign linContent_66 = 8'h42;
  assign linContent_67 = 8'h43;
  assign linContent_68 = 8'h44;
  assign linContent_69 = 8'h45;
  assign linContent_70 = 8'h46;
  assign linContent_71 = 8'h47;
  assign linContent_72 = 8'h48;
  assign linContent_73 = 8'h49;
  assign linContent_74 = 8'h4a;
  assign linContent_75 = 8'h4b;
  assign linContent_76 = 8'h4c;
  assign linContent_77 = 8'h4d;
  assign linContent_78 = 8'h4e;
  assign linContent_79 = 8'h4f;
  assign linContent_80 = 8'h50;
  assign linContent_81 = 8'h51;
  assign linContent_82 = 8'h52;
  assign linContent_83 = 8'h53;
  assign linContent_84 = 8'h54;
  assign linContent_85 = 8'h55;
  assign linContent_86 = 8'h56;
  assign linContent_87 = 8'h57;
  assign linContent_88 = 8'h58;
  assign linContent_89 = 8'h59;
  assign linContent_90 = 8'h5a;
  assign linContent_91 = 8'h5b;
  assign linContent_92 = 8'h5c;
  assign linContent_93 = 8'h5d;
  assign linContent_94 = 8'h5e;
  assign linContent_95 = 8'h5f;
  assign linContent_96 = 8'h60;
  assign linContent_97 = 8'h61;
  assign linContent_98 = 8'h62;
  assign linContent_99 = 8'h63;
  assign linContent_100 = 8'h64;
  assign linContent_101 = 8'h65;
  assign linContent_102 = 8'h66;
  assign linContent_103 = 8'h67;
  assign linContent_104 = 8'h68;
  assign linContent_105 = 8'h69;
  assign linContent_106 = 8'h6a;
  assign linContent_107 = 8'h6b;
  assign linContent_108 = 8'h6c;
  assign linContent_109 = 8'h6d;
  assign linContent_110 = 8'h6e;
  assign linContent_111 = 8'h6f;
  assign linContent_112 = 8'h70;
  assign linContent_113 = 8'h71;
  assign linContent_114 = 8'h72;
  assign linContent_115 = 8'h73;
  assign linContent_116 = 8'h74;
  assign linContent_117 = 8'h75;
  assign linContent_118 = 8'h76;
  assign linContent_119 = 8'h77;
  assign linContent_120 = 8'h78;
  assign linContent_121 = 8'h79;
  assign linContent_122 = 8'h7a;
  assign linContent_123 = 8'h7b;
  assign linContent_124 = 8'h7c;
  assign linContent_125 = 8'h7d;
  assign linContent_126 = 8'h7e;
  assign linContent_127 = 8'h7f;
  assign linContent_128 = 8'h80;
  assign linContent_129 = 8'h81;
  assign linContent_130 = 8'h82;
  assign linContent_131 = 8'h83;
  assign linContent_132 = 8'h84;
  assign linContent_133 = 8'h85;
  assign linContent_134 = 8'h86;
  assign linContent_135 = 8'h87;
  assign linContent_136 = 8'h88;
  assign linContent_137 = 8'h89;
  assign linContent_138 = 8'h8a;
  assign linContent_139 = 8'h8b;
  assign linContent_140 = 8'h8c;
  assign linContent_141 = 8'h8d;
  assign linContent_142 = 8'h8e;
  assign linContent_143 = 8'h8f;
  assign linContent_144 = 8'h90;
  assign linContent_145 = 8'h91;
  assign linContent_146 = 8'h92;
  assign linContent_147 = 8'h93;
  assign linContent_148 = 8'h94;
  assign linContent_149 = 8'h95;
  assign linContent_150 = 8'h96;
  assign linContent_151 = 8'h97;
  assign linContent_152 = 8'h98;
  assign linContent_153 = 8'h99;
  assign linContent_154 = 8'h9a;
  assign linContent_155 = 8'h9b;
  assign linContent_156 = 8'h9c;
  assign linContent_157 = 8'h9d;
  assign linContent_158 = 8'h9e;
  assign linContent_159 = 8'h9f;
  assign linContent_160 = 8'ha0;
  assign linContent_161 = 8'ha1;
  assign linContent_162 = 8'ha2;
  assign linContent_163 = 8'ha3;
  assign linContent_164 = 8'ha4;
  assign linContent_165 = 8'ha5;
  assign linContent_166 = 8'ha6;
  assign linContent_167 = 8'ha7;
  assign linContent_168 = 8'ha8;
  assign linContent_169 = 8'ha9;
  assign linContent_170 = 8'haa;
  assign linContent_171 = 8'hab;
  assign linContent_172 = 8'hac;
  assign linContent_173 = 8'had;
  assign linContent_174 = 8'hae;
  assign linContent_175 = 8'haf;
  assign linContent_176 = 8'hb0;
  assign linContent_177 = 8'hb1;
  assign linContent_178 = 8'hb2;
  assign linContent_179 = 8'hb3;
  assign linContent_180 = 8'hb4;
  assign linContent_181 = 8'hb5;
  assign linContent_182 = 8'hb6;
  assign linContent_183 = 8'hb7;
  assign linContent_184 = 8'hb8;
  assign linContent_185 = 8'hb9;
  assign linContent_186 = 8'hba;
  assign linContent_187 = 8'hbb;
  assign linContent_188 = 8'hbc;
  assign linContent_189 = 8'hbd;
  assign linContent_190 = 8'hbe;
  assign linContent_191 = 8'hbf;
  assign linContent_192 = 8'hc0;
  assign linContent_193 = 8'hc1;
  assign linContent_194 = 8'hc2;
  assign linContent_195 = 8'hc3;
  assign linContent_196 = 8'hc4;
  assign linContent_197 = 8'hc5;
  assign linContent_198 = 8'hc6;
  assign linContent_199 = 8'hc7;
  assign linContent_200 = 8'hc8;
  assign linContent_201 = 8'hc9;
  assign linContent_202 = 8'hca;
  assign linContent_203 = 8'hcb;
  assign linContent_204 = 8'hcc;
  assign linContent_205 = 8'hcd;
  assign linContent_206 = 8'hce;
  assign linContent_207 = 8'hcf;
  assign linContent_208 = 8'hd0;
  assign linContent_209 = 8'hd1;
  assign linContent_210 = 8'hd2;
  assign linContent_211 = 8'hd3;
  assign linContent_212 = 8'hd4;
  assign linContent_213 = 8'hd5;
  assign linContent_214 = 8'hd6;
  assign linContent_215 = 8'hd7;
  assign linContent_216 = 8'hd8;
  assign linContent_217 = 8'hd9;
  assign linContent_218 = 8'hda;
  assign linContent_219 = 8'hdb;
  assign linContent_220 = 8'hdc;
  assign linContent_221 = 8'hdd;
  assign linContent_222 = 8'hde;
  assign linContent_223 = 8'hdf;
  assign linContent_224 = 8'he0;
  assign linContent_225 = 8'he1;
  assign linContent_226 = 8'he2;
  assign linContent_227 = 8'he3;
  assign linContent_228 = 8'he4;
  assign linContent_229 = 8'he5;
  assign linContent_230 = 8'he6;
  assign linContent_231 = 8'he7;
  assign linContent_232 = 8'he8;
  assign linContent_233 = 8'he9;
  assign linContent_234 = 8'hea;
  assign linContent_235 = 8'heb;
  assign linContent_236 = 8'hec;
  assign linContent_237 = 8'hed;
  assign linContent_238 = 8'hee;
  assign linContent_239 = 8'hef;
  assign linContent_240 = 8'hf0;
  assign linContent_241 = 8'hf1;
  assign linContent_242 = 8'hf2;
  assign linContent_243 = 8'hf3;
  assign linContent_244 = 8'hf4;
  assign linContent_245 = 8'hf5;
  assign linContent_246 = 8'hf6;
  assign linContent_247 = 8'hf7;
  assign linContent_248 = 8'hf8;
  assign linContent_249 = 8'hf9;
  assign linContent_250 = 8'hfa;
  assign linContent_251 = 8'hfb;
  assign linContent_252 = 8'hfc;
  assign linContent_253 = 8'hfd;
  assign linContent_254 = 8'hfe;
  assign linContent_255 = 8'hff;
  assign linContent_256 = 8'hff;
  assign expContent_0 = 8'h0;
  assign expContent_1 = 8'h0;
  assign expContent_2 = 8'h0;
  assign expContent_3 = 8'h0;
  assign expContent_4 = 8'h01;
  assign expContent_5 = 8'h01;
  assign expContent_6 = 8'h01;
  assign expContent_7 = 8'h01;
  assign expContent_8 = 8'h01;
  assign expContent_9 = 8'h01;
  assign expContent_10 = 8'h02;
  assign expContent_11 = 8'h02;
  assign expContent_12 = 8'h02;
  assign expContent_13 = 8'h02;
  assign expContent_14 = 8'h02;
  assign expContent_15 = 8'h03;
  assign expContent_16 = 8'h03;
  assign expContent_17 = 8'h03;
  assign expContent_18 = 8'h03;
  assign expContent_19 = 8'h03;
  assign expContent_20 = 8'h04;
  assign expContent_21 = 8'h04;
  assign expContent_22 = 8'h04;
  assign expContent_23 = 8'h04;
  assign expContent_24 = 8'h04;
  assign expContent_25 = 8'h05;
  assign expContent_26 = 8'h05;
  assign expContent_27 = 8'h05;
  assign expContent_28 = 8'h05;
  assign expContent_29 = 8'h05;
  assign expContent_30 = 8'h06;
  assign expContent_31 = 8'h06;
  assign expContent_32 = 8'h06;
  assign expContent_33 = 8'h06;
  assign expContent_34 = 8'h07;
  assign expContent_35 = 8'h07;
  assign expContent_36 = 8'h07;
  assign expContent_37 = 8'h07;
  assign expContent_38 = 8'h08;
  assign expContent_39 = 8'h08;
  assign expContent_40 = 8'h08;
  assign expContent_41 = 8'h08;
  assign expContent_42 = 8'h09;
  assign expContent_43 = 8'h09;
  assign expContent_44 = 8'h09;
  assign expContent_45 = 8'h09;
  assign expContent_46 = 8'h0a;
  assign expContent_47 = 8'h0a;
  assign expContent_48 = 8'h0a;
  assign expContent_49 = 8'h0a;
  assign expContent_50 = 8'h0b;
  assign expContent_51 = 8'h0b;
  assign expContent_52 = 8'h0b;
  assign expContent_53 = 8'h0c;
  assign expContent_54 = 8'h0c;
  assign expContent_55 = 8'h0c;
  assign expContent_56 = 8'h0c;
  assign expContent_57 = 8'h0d;
  assign expContent_58 = 8'h0d;
  assign expContent_59 = 8'h0d;
  assign expContent_60 = 8'h0e;
  assign expContent_61 = 8'h0e;
  assign expContent_62 = 8'h0e;
  assign expContent_63 = 8'h0f;
  assign expContent_64 = 8'h0f;
  assign expContent_65 = 8'h0f;
  assign expContent_66 = 8'h10;
  assign expContent_67 = 8'h10;
  assign expContent_68 = 8'h10;
  assign expContent_69 = 8'h11;
  assign expContent_70 = 8'h11;
  assign expContent_71 = 8'h11;
  assign expContent_72 = 8'h12;
  assign expContent_73 = 8'h12;
  assign expContent_74 = 8'h13;
  assign expContent_75 = 8'h13;
  assign expContent_76 = 8'h13;
  assign expContent_77 = 8'h14;
  assign expContent_78 = 8'h14;
  assign expContent_79 = 8'h14;
  assign expContent_80 = 8'h15;
  assign expContent_81 = 8'h15;
  assign expContent_82 = 8'h16;
  assign expContent_83 = 8'h16;
  assign expContent_84 = 8'h17;
  assign expContent_85 = 8'h17;
  assign expContent_86 = 8'h17;
  assign expContent_87 = 8'h18;
  assign expContent_88 = 8'h18;
  assign expContent_89 = 8'h19;
  assign expContent_90 = 8'h19;
  assign expContent_91 = 8'h1a;
  assign expContent_92 = 8'h1a;
  assign expContent_93 = 8'h1b;
  assign expContent_94 = 8'h1b;
  assign expContent_95 = 8'h1b;
  assign expContent_96 = 8'h1c;
  assign expContent_97 = 8'h1c;
  assign expContent_98 = 8'h1d;
  assign expContent_99 = 8'h1d;
  assign expContent_100 = 8'h1e;
  assign expContent_101 = 8'h1e;
  assign expContent_102 = 8'h1f;
  assign expContent_103 = 8'h20;
  assign expContent_104 = 8'h20;
  assign expContent_105 = 8'h21;
  assign expContent_106 = 8'h21;
  assign expContent_107 = 8'h22;
  assign expContent_108 = 8'h22;
  assign expContent_109 = 8'h23;
  assign expContent_110 = 8'h23;
  assign expContent_111 = 8'h24;
  assign expContent_112 = 8'h25;
  assign expContent_113 = 8'h25;
  assign expContent_114 = 8'h26;
  assign expContent_115 = 8'h26;
  assign expContent_116 = 8'h27;
  assign expContent_117 = 8'h28;
  assign expContent_118 = 8'h28;
  assign expContent_119 = 8'h29;
  assign expContent_120 = 8'h29;
  assign expContent_121 = 8'h2a;
  assign expContent_122 = 8'h2b;
  assign expContent_123 = 8'h2b;
  assign expContent_124 = 8'h2c;
  assign expContent_125 = 8'h2d;
  assign expContent_126 = 8'h2d;
  assign expContent_127 = 8'h2e;
  assign expContent_128 = 8'h2f;
  assign expContent_129 = 8'h30;
  assign expContent_130 = 8'h30;
  assign expContent_131 = 8'h31;
  assign expContent_132 = 8'h32;
  assign expContent_133 = 8'h33;
  assign expContent_134 = 8'h33;
  assign expContent_135 = 8'h34;
  assign expContent_136 = 8'h35;
  assign expContent_137 = 8'h36;
  assign expContent_138 = 8'h36;
  assign expContent_139 = 8'h37;
  assign expContent_140 = 8'h38;
  assign expContent_141 = 8'h39;
  assign expContent_142 = 8'h3a;
  assign expContent_143 = 8'h3a;
  assign expContent_144 = 8'h3b;
  assign expContent_145 = 8'h3c;
  assign expContent_146 = 8'h3d;
  assign expContent_147 = 8'h3e;
  assign expContent_148 = 8'h3f;
  assign expContent_149 = 8'h40;
  assign expContent_150 = 8'h41;
  assign expContent_151 = 8'h42;
  assign expContent_152 = 8'h43;
  assign expContent_153 = 8'h43;
  assign expContent_154 = 8'h44;
  assign expContent_155 = 8'h45;
  assign expContent_156 = 8'h46;
  assign expContent_157 = 8'h47;
  assign expContent_158 = 8'h48;
  assign expContent_159 = 8'h49;
  assign expContent_160 = 8'h4a;
  assign expContent_161 = 8'h4b;
  assign expContent_162 = 8'h4c;
  assign expContent_163 = 8'h4e;
  assign expContent_164 = 8'h4f;
  assign expContent_165 = 8'h50;
  assign expContent_166 = 8'h51;
  assign expContent_167 = 8'h52;
  assign expContent_168 = 8'h53;
  assign expContent_169 = 8'h54;
  assign expContent_170 = 8'h55;
  assign expContent_171 = 8'h57;
  assign expContent_172 = 8'h58;
  assign expContent_173 = 8'h59;
  assign expContent_174 = 8'h5a;
  assign expContent_175 = 8'h5b;
  assign expContent_176 = 8'h5d;
  assign expContent_177 = 8'h5e;
  assign expContent_178 = 8'h5f;
  assign expContent_179 = 8'h60;
  assign expContent_180 = 8'h62;
  assign expContent_181 = 8'h63;
  assign expContent_182 = 8'h64;
  assign expContent_183 = 8'h66;
  assign expContent_184 = 8'h67;
  assign expContent_185 = 8'h68;
  assign expContent_186 = 8'h6a;
  assign expContent_187 = 8'h6b;
  assign expContent_188 = 8'h6d;
  assign expContent_189 = 8'h6e;
  assign expContent_190 = 8'h70;
  assign expContent_191 = 8'h71;
  assign expContent_192 = 8'h73;
  assign expContent_193 = 8'h74;
  assign expContent_194 = 8'h76;
  assign expContent_195 = 8'h77;
  assign expContent_196 = 8'h79;
  assign expContent_197 = 8'h7a;
  assign expContent_198 = 8'h7c;
  assign expContent_199 = 8'h7e;
  assign expContent_200 = 8'h7f;
  assign expContent_201 = 8'h81;
  assign expContent_202 = 8'h82;
  assign expContent_203 = 8'h84;
  assign expContent_204 = 8'h86;
  assign expContent_205 = 8'h88;
  assign expContent_206 = 8'h89;
  assign expContent_207 = 8'h8b;
  assign expContent_208 = 8'h8d;
  assign expContent_209 = 8'h8f;
  assign expContent_210 = 8'h91;
  assign expContent_211 = 8'h93;
  assign expContent_212 = 8'h94;
  assign expContent_213 = 8'h96;
  assign expContent_214 = 8'h98;
  assign expContent_215 = 8'h9a;
  assign expContent_216 = 8'h9c;
  assign expContent_217 = 8'h9e;
  assign expContent_218 = 8'ha0;
  assign expContent_219 = 8'ha2;
  assign expContent_220 = 8'ha4;
  assign expContent_221 = 8'ha7;
  assign expContent_222 = 8'ha9;
  assign expContent_223 = 8'hab;
  assign expContent_224 = 8'had;
  assign expContent_225 = 8'haf;
  assign expContent_226 = 8'hb1;
  assign expContent_227 = 8'hb4;
  assign expContent_228 = 8'hb6;
  assign expContent_229 = 8'hb8;
  assign expContent_230 = 8'hbb;
  assign expContent_231 = 8'hbd;
  assign expContent_232 = 8'hbf;
  assign expContent_233 = 8'hc2;
  assign expContent_234 = 8'hc4;
  assign expContent_235 = 8'hc7;
  assign expContent_236 = 8'hc9;
  assign expContent_237 = 8'hcc;
  assign expContent_238 = 8'hce;
  assign expContent_239 = 8'hd1;
  assign expContent_240 = 8'hd4;
  assign expContent_241 = 8'hd6;
  assign expContent_242 = 8'hd9;
  assign expContent_243 = 8'hdc;
  assign expContent_244 = 8'hde;
  assign expContent_245 = 8'he1;
  assign expContent_246 = 8'he4;
  assign expContent_247 = 8'he7;
  assign expContent_248 = 8'hea;
  assign expContent_249 = 8'hed;
  assign expContent_250 = 8'hf0;
  assign expContent_251 = 8'hf3;
  assign expContent_252 = 8'hf6;
  assign expContent_253 = 8'hf9;
  assign expContent_254 = 8'hfc;
  assign expContent_255 = 8'hff;
  assign expContent_256 = 8'hff;
  assign logContent_0 = 8'h0;
  assign logContent_1 = 8'h03;
  assign logContent_2 = 8'h07;
  assign logContent_3 = 8'h0a;
  assign logContent_4 = 8'h0d;
  assign logContent_5 = 8'h10;
  assign logContent_6 = 8'h13;
  assign logContent_7 = 8'h16;
  assign logContent_8 = 8'h18;
  assign logContent_9 = 8'h1b;
  assign logContent_10 = 8'h1e;
  assign logContent_11 = 8'h20;
  assign logContent_12 = 8'h23;
  assign logContent_13 = 8'h25;
  assign logContent_14 = 8'h28;
  assign logContent_15 = 8'h2a;
  assign logContent_16 = 8'h2d;
  assign logContent_17 = 8'h2f;
  assign logContent_18 = 8'h31;
  assign logContent_19 = 8'h33;
  assign logContent_20 = 8'h36;
  assign logContent_21 = 8'h38;
  assign logContent_22 = 8'h3a;
  assign logContent_23 = 8'h3c;
  assign logContent_24 = 8'h3e;
  assign logContent_25 = 8'h40;
  assign logContent_26 = 8'h42;
  assign logContent_27 = 8'h44;
  assign logContent_28 = 8'h46;
  assign logContent_29 = 8'h48;
  assign logContent_30 = 8'h4a;
  assign logContent_31 = 8'h4c;
  assign logContent_32 = 8'h4d;
  assign logContent_33 = 8'h4f;
  assign logContent_34 = 8'h51;
  assign logContent_35 = 8'h53;
  assign logContent_36 = 8'h54;
  assign logContent_37 = 8'h56;
  assign logContent_38 = 8'h58;
  assign logContent_39 = 8'h59;
  assign logContent_40 = 8'h5b;
  assign logContent_41 = 8'h5c;
  assign logContent_42 = 8'h5e;
  assign logContent_43 = 8'h60;
  assign logContent_44 = 8'h61;
  assign logContent_45 = 8'h63;
  assign logContent_46 = 8'h64;
  assign logContent_47 = 8'h66;
  assign logContent_48 = 8'h67;
  assign logContent_49 = 8'h69;
  assign logContent_50 = 8'h6a;
  assign logContent_51 = 8'h6b;
  assign logContent_52 = 8'h6d;
  assign logContent_53 = 8'h6e;
  assign logContent_54 = 8'h6f;
  assign logContent_55 = 8'h71;
  assign logContent_56 = 8'h72;
  assign logContent_57 = 8'h73;
  assign logContent_58 = 8'h75;
  assign logContent_59 = 8'h76;
  assign logContent_60 = 8'h77;
  assign logContent_61 = 8'h79;
  assign logContent_62 = 8'h7a;
  assign logContent_63 = 8'h7b;
  assign logContent_64 = 8'h7c;
  assign logContent_65 = 8'h7e;
  assign logContent_66 = 8'h7f;
  assign logContent_67 = 8'h80;
  assign logContent_68 = 8'h81;
  assign logContent_69 = 8'h82;
  assign logContent_70 = 8'h83;
  assign logContent_71 = 8'h85;
  assign logContent_72 = 8'h86;
  assign logContent_73 = 8'h87;
  assign logContent_74 = 8'h88;
  assign logContent_75 = 8'h89;
  assign logContent_76 = 8'h8a;
  assign logContent_77 = 8'h8b;
  assign logContent_78 = 8'h8c;
  assign logContent_79 = 8'h8d;
  assign logContent_80 = 8'h8e;
  assign logContent_81 = 8'h90;
  assign logContent_82 = 8'h91;
  assign logContent_83 = 8'h92;
  assign logContent_84 = 8'h93;
  assign logContent_85 = 8'h94;
  assign logContent_86 = 8'h95;
  assign logContent_87 = 8'h96;
  assign logContent_88 = 8'h97;
  assign logContent_89 = 8'h98;
  assign logContent_90 = 8'h99;
  assign logContent_91 = 8'h9a;
  assign logContent_92 = 8'h9b;
  assign logContent_93 = 8'h9b;
  assign logContent_94 = 8'h9c;
  assign logContent_95 = 8'h9d;
  assign logContent_96 = 8'h9e;
  assign logContent_97 = 8'h9f;
  assign logContent_98 = 8'ha0;
  assign logContent_99 = 8'ha1;
  assign logContent_100 = 8'ha2;
  assign logContent_101 = 8'ha3;
  assign logContent_102 = 8'ha4;
  assign logContent_103 = 8'ha5;
  assign logContent_104 = 8'ha5;
  assign logContent_105 = 8'ha6;
  assign logContent_106 = 8'ha7;
  assign logContent_107 = 8'ha8;
  assign logContent_108 = 8'ha9;
  assign logContent_109 = 8'haa;
  assign logContent_110 = 8'hab;
  assign logContent_111 = 8'hab;
  assign logContent_112 = 8'hac;
  assign logContent_113 = 8'had;
  assign logContent_114 = 8'hae;
  assign logContent_115 = 8'haf;
  assign logContent_116 = 8'hb0;
  assign logContent_117 = 8'hb0;
  assign logContent_118 = 8'hb1;
  assign logContent_119 = 8'hb2;
  assign logContent_120 = 8'hb3;
  assign logContent_121 = 8'hb3;
  assign logContent_122 = 8'hb4;
  assign logContent_123 = 8'hb5;
  assign logContent_124 = 8'hb6;
  assign logContent_125 = 8'hb7;
  assign logContent_126 = 8'hb7;
  assign logContent_127 = 8'hb8;
  assign logContent_128 = 8'hb9;
  assign logContent_129 = 8'hba;
  assign logContent_130 = 8'hba;
  assign logContent_131 = 8'hbb;
  assign logContent_132 = 8'hbc;
  assign logContent_133 = 8'hbc;
  assign logContent_134 = 8'hbd;
  assign logContent_135 = 8'hbe;
  assign logContent_136 = 8'hbf;
  assign logContent_137 = 8'hbf;
  assign logContent_138 = 8'hc0;
  assign logContent_139 = 8'hc1;
  assign logContent_140 = 8'hc1;
  assign logContent_141 = 8'hc2;
  assign logContent_142 = 8'hc3;
  assign logContent_143 = 8'hc4;
  assign logContent_144 = 8'hc4;
  assign logContent_145 = 8'hc5;
  assign logContent_146 = 8'hc6;
  assign logContent_147 = 8'hc6;
  assign logContent_148 = 8'hc7;
  assign logContent_149 = 8'hc8;
  assign logContent_150 = 8'hc8;
  assign logContent_151 = 8'hc9;
  assign logContent_152 = 8'hca;
  assign logContent_153 = 8'hca;
  assign logContent_154 = 8'hcb;
  assign logContent_155 = 8'hcb;
  assign logContent_156 = 8'hcc;
  assign logContent_157 = 8'hcd;
  assign logContent_158 = 8'hcd;
  assign logContent_159 = 8'hce;
  assign logContent_160 = 8'hcf;
  assign logContent_161 = 8'hcf;
  assign logContent_162 = 8'hd0;
  assign logContent_163 = 8'hd0;
  assign logContent_164 = 8'hd1;
  assign logContent_165 = 8'hd2;
  assign logContent_166 = 8'hd2;
  assign logContent_167 = 8'hd3;
  assign logContent_168 = 8'hd4;
  assign logContent_169 = 8'hd4;
  assign logContent_170 = 8'hd5;
  assign logContent_171 = 8'hd5;
  assign logContent_172 = 8'hd6;
  assign logContent_173 = 8'hd6;
  assign logContent_174 = 8'hd7;
  assign logContent_175 = 8'hd8;
  assign logContent_176 = 8'hd8;
  assign logContent_177 = 8'hd9;
  assign logContent_178 = 8'hd9;
  assign logContent_179 = 8'hda;
  assign logContent_180 = 8'hdb;
  assign logContent_181 = 8'hdb;
  assign logContent_182 = 8'hdc;
  assign logContent_183 = 8'hdc;
  assign logContent_184 = 8'hdd;
  assign logContent_185 = 8'hdd;
  assign logContent_186 = 8'hde;
  assign logContent_187 = 8'hde;
  assign logContent_188 = 8'hdf;
  assign logContent_189 = 8'he0;
  assign logContent_190 = 8'he0;
  assign logContent_191 = 8'he1;
  assign logContent_192 = 8'he1;
  assign logContent_193 = 8'he2;
  assign logContent_194 = 8'he2;
  assign logContent_195 = 8'he3;
  assign logContent_196 = 8'he3;
  assign logContent_197 = 8'he4;
  assign logContent_198 = 8'he4;
  assign logContent_199 = 8'he5;
  assign logContent_200 = 8'he5;
  assign logContent_201 = 8'he6;
  assign logContent_202 = 8'he6;
  assign logContent_203 = 8'he7;
  assign logContent_204 = 8'he7;
  assign logContent_205 = 8'he8;
  assign logContent_206 = 8'he8;
  assign logContent_207 = 8'he9;
  assign logContent_208 = 8'he9;
  assign logContent_209 = 8'hea;
  assign logContent_210 = 8'hea;
  assign logContent_211 = 8'heb;
  assign logContent_212 = 8'heb;
  assign logContent_213 = 8'hec;
  assign logContent_214 = 8'hec;
  assign logContent_215 = 8'hed;
  assign logContent_216 = 8'hed;
  assign logContent_217 = 8'hee;
  assign logContent_218 = 8'hee;
  assign logContent_219 = 8'hef;
  assign logContent_220 = 8'hef;
  assign logContent_221 = 8'hf0;
  assign logContent_222 = 8'hf0;
  assign logContent_223 = 8'hf1;
  assign logContent_224 = 8'hf1;
  assign logContent_225 = 8'hf2;
  assign logContent_226 = 8'hf2;
  assign logContent_227 = 8'hf3;
  assign logContent_228 = 8'hf3;
  assign logContent_229 = 8'hf4;
  assign logContent_230 = 8'hf4;
  assign logContent_231 = 8'hf4;
  assign logContent_232 = 8'hf5;
  assign logContent_233 = 8'hf5;
  assign logContent_234 = 8'hf6;
  assign logContent_235 = 8'hf6;
  assign logContent_236 = 8'hf7;
  assign logContent_237 = 8'hf7;
  assign logContent_238 = 8'hf8;
  assign logContent_239 = 8'hf8;
  assign logContent_240 = 8'hf9;
  assign logContent_241 = 8'hf9;
  assign logContent_242 = 8'hf9;
  assign logContent_243 = 8'hfa;
  assign logContent_244 = 8'hfa;
  assign logContent_245 = 8'hfb;
  assign logContent_246 = 8'hfb;
  assign logContent_247 = 8'hfc;
  assign logContent_248 = 8'hfc;
  assign logContent_249 = 8'hfc;
  assign logContent_250 = 8'hfd;
  assign logContent_251 = 8'hfd;
  assign logContent_252 = 8'hfe;
  assign logContent_253 = 8'hfe;
  assign logContent_254 = 8'hff;
  assign logContent_255 = 8'hff;
  assign logContent_256 = 8'hff;
  assign sigContent_0 = 8'h0;
  assign sigContent_1 = 8'h0;
  assign sigContent_2 = 8'h0;
  assign sigContent_3 = 8'h0;
  assign sigContent_4 = 8'h0;
  assign sigContent_5 = 8'h0;
  assign sigContent_6 = 8'h0;
  assign sigContent_7 = 8'h0;
  assign sigContent_8 = 8'h01;
  assign sigContent_9 = 8'h01;
  assign sigContent_10 = 8'h01;
  assign sigContent_11 = 8'h01;
  assign sigContent_12 = 8'h01;
  assign sigContent_13 = 8'h02;
  assign sigContent_14 = 8'h02;
  assign sigContent_15 = 8'h02;
  assign sigContent_16 = 8'h02;
  assign sigContent_17 = 8'h03;
  assign sigContent_18 = 8'h03;
  assign sigContent_19 = 8'h03;
  assign sigContent_20 = 8'h04;
  assign sigContent_21 = 8'h04;
  assign sigContent_22 = 8'h05;
  assign sigContent_23 = 8'h05;
  assign sigContent_24 = 8'h06;
  assign sigContent_25 = 8'h06;
  assign sigContent_26 = 8'h06;
  assign sigContent_27 = 8'h07;
  assign sigContent_28 = 8'h08;
  assign sigContent_29 = 8'h08;
  assign sigContent_30 = 8'h09;
  assign sigContent_31 = 8'h09;
  assign sigContent_32 = 8'h0a;
  assign sigContent_33 = 8'h0a;
  assign sigContent_34 = 8'h0b;
  assign sigContent_35 = 8'h0c;
  assign sigContent_36 = 8'h0c;
  assign sigContent_37 = 8'h0d;
  assign sigContent_38 = 8'h0e;
  assign sigContent_39 = 8'h0e;
  assign sigContent_40 = 8'h0f;
  assign sigContent_41 = 8'h10;
  assign sigContent_42 = 8'h11;
  assign sigContent_43 = 8'h11;
  assign sigContent_44 = 8'h12;
  assign sigContent_45 = 8'h13;
  assign sigContent_46 = 8'h14;
  assign sigContent_47 = 8'h15;
  assign sigContent_48 = 8'h16;
  assign sigContent_49 = 8'h17;
  assign sigContent_50 = 8'h17;
  assign sigContent_51 = 8'h18;
  assign sigContent_52 = 8'h19;
  assign sigContent_53 = 8'h1a;
  assign sigContent_54 = 8'h1b;
  assign sigContent_55 = 8'h1c;
  assign sigContent_56 = 8'h1d;
  assign sigContent_57 = 8'h1e;
  assign sigContent_58 = 8'h1f;
  assign sigContent_59 = 8'h20;
  assign sigContent_60 = 8'h21;
  assign sigContent_61 = 8'h22;
  assign sigContent_62 = 8'h23;
  assign sigContent_63 = 8'h25;
  assign sigContent_64 = 8'h26;
  assign sigContent_65 = 8'h27;
  assign sigContent_66 = 8'h28;
  assign sigContent_67 = 8'h29;
  assign sigContent_68 = 8'h2a;
  assign sigContent_69 = 8'h2b;
  assign sigContent_70 = 8'h2d;
  assign sigContent_71 = 8'h2e;
  assign sigContent_72 = 8'h2f;
  assign sigContent_73 = 8'h30;
  assign sigContent_74 = 8'h31;
  assign sigContent_75 = 8'h33;
  assign sigContent_76 = 8'h34;
  assign sigContent_77 = 8'h35;
  assign sigContent_78 = 8'h36;
  assign sigContent_79 = 8'h38;
  assign sigContent_80 = 8'h39;
  assign sigContent_81 = 8'h3a;
  assign sigContent_82 = 8'h3c;
  assign sigContent_83 = 8'h3d;
  assign sigContent_84 = 8'h3e;
  assign sigContent_85 = 8'h40;
  assign sigContent_86 = 8'h41;
  assign sigContent_87 = 8'h42;
  assign sigContent_88 = 8'h44;
  assign sigContent_89 = 8'h45;
  assign sigContent_90 = 8'h47;
  assign sigContent_91 = 8'h48;
  assign sigContent_92 = 8'h49;
  assign sigContent_93 = 8'h4b;
  assign sigContent_94 = 8'h4c;
  assign sigContent_95 = 8'h4e;
  assign sigContent_96 = 8'h4f;
  assign sigContent_97 = 8'h51;
  assign sigContent_98 = 8'h52;
  assign sigContent_99 = 8'h54;
  assign sigContent_100 = 8'h55;
  assign sigContent_101 = 8'h57;
  assign sigContent_102 = 8'h58;
  assign sigContent_103 = 8'h5a;
  assign sigContent_104 = 8'h5b;
  assign sigContent_105 = 8'h5d;
  assign sigContent_106 = 8'h5e;
  assign sigContent_107 = 8'h60;
  assign sigContent_108 = 8'h61;
  assign sigContent_109 = 8'h63;
  assign sigContent_110 = 8'h64;
  assign sigContent_111 = 8'h66;
  assign sigContent_112 = 8'h67;
  assign sigContent_113 = 8'h69;
  assign sigContent_114 = 8'h6a;
  assign sigContent_115 = 8'h6c;
  assign sigContent_116 = 8'h6d;
  assign sigContent_117 = 8'h6f;
  assign sigContent_118 = 8'h71;
  assign sigContent_119 = 8'h72;
  assign sigContent_120 = 8'h74;
  assign sigContent_121 = 8'h75;
  assign sigContent_122 = 8'h77;
  assign sigContent_123 = 8'h78;
  assign sigContent_124 = 8'h7a;
  assign sigContent_125 = 8'h7c;
  assign sigContent_126 = 8'h7d;
  assign sigContent_127 = 8'h7f;
  assign sigContent_128 = 8'h80;
  assign sigContent_129 = 8'h82;
  assign sigContent_130 = 8'h83;
  assign sigContent_131 = 8'h85;
  assign sigContent_132 = 8'h87;
  assign sigContent_133 = 8'h88;
  assign sigContent_134 = 8'h8a;
  assign sigContent_135 = 8'h8b;
  assign sigContent_136 = 8'h8d;
  assign sigContent_137 = 8'h8e;
  assign sigContent_138 = 8'h90;
  assign sigContent_139 = 8'h92;
  assign sigContent_140 = 8'h93;
  assign sigContent_141 = 8'h95;
  assign sigContent_142 = 8'h96;
  assign sigContent_143 = 8'h98;
  assign sigContent_144 = 8'h99;
  assign sigContent_145 = 8'h9b;
  assign sigContent_146 = 8'h9c;
  assign sigContent_147 = 8'h9e;
  assign sigContent_148 = 8'h9f;
  assign sigContent_149 = 8'ha1;
  assign sigContent_150 = 8'ha2;
  assign sigContent_151 = 8'ha4;
  assign sigContent_152 = 8'ha5;
  assign sigContent_153 = 8'ha7;
  assign sigContent_154 = 8'ha8;
  assign sigContent_155 = 8'haa;
  assign sigContent_156 = 8'hab;
  assign sigContent_157 = 8'had;
  assign sigContent_158 = 8'hae;
  assign sigContent_159 = 8'hb0;
  assign sigContent_160 = 8'hb1;
  assign sigContent_161 = 8'hb3;
  assign sigContent_162 = 8'hb4;
  assign sigContent_163 = 8'hb6;
  assign sigContent_164 = 8'hb7;
  assign sigContent_165 = 8'hb8;
  assign sigContent_166 = 8'hba;
  assign sigContent_167 = 8'hbb;
  assign sigContent_168 = 8'hbd;
  assign sigContent_169 = 8'hbe;
  assign sigContent_170 = 8'hbf;
  assign sigContent_171 = 8'hc1;
  assign sigContent_172 = 8'hc2;
  assign sigContent_173 = 8'hc3;
  assign sigContent_174 = 8'hc5;
  assign sigContent_175 = 8'hc6;
  assign sigContent_176 = 8'hc7;
  assign sigContent_177 = 8'hc9;
  assign sigContent_178 = 8'hca;
  assign sigContent_179 = 8'hcb;
  assign sigContent_180 = 8'hcc;
  assign sigContent_181 = 8'hce;
  assign sigContent_182 = 8'hcf;
  assign sigContent_183 = 8'hd0;
  assign sigContent_184 = 8'hd1;
  assign sigContent_185 = 8'hd2;
  assign sigContent_186 = 8'hd4;
  assign sigContent_187 = 8'hd5;
  assign sigContent_188 = 8'hd6;
  assign sigContent_189 = 8'hd7;
  assign sigContent_190 = 8'hd8;
  assign sigContent_191 = 8'hd9;
  assign sigContent_192 = 8'hda;
  assign sigContent_193 = 8'hdc;
  assign sigContent_194 = 8'hdd;
  assign sigContent_195 = 8'hde;
  assign sigContent_196 = 8'hdf;
  assign sigContent_197 = 8'he0;
  assign sigContent_198 = 8'he1;
  assign sigContent_199 = 8'he2;
  assign sigContent_200 = 8'he3;
  assign sigContent_201 = 8'he4;
  assign sigContent_202 = 8'he5;
  assign sigContent_203 = 8'he6;
  assign sigContent_204 = 8'he7;
  assign sigContent_205 = 8'he8;
  assign sigContent_206 = 8'he8;
  assign sigContent_207 = 8'he9;
  assign sigContent_208 = 8'hea;
  assign sigContent_209 = 8'heb;
  assign sigContent_210 = 8'hec;
  assign sigContent_211 = 8'hed;
  assign sigContent_212 = 8'hee;
  assign sigContent_213 = 8'hee;
  assign sigContent_214 = 8'hef;
  assign sigContent_215 = 8'hf0;
  assign sigContent_216 = 8'hf1;
  assign sigContent_217 = 8'hf1;
  assign sigContent_218 = 8'hf2;
  assign sigContent_219 = 8'hf3;
  assign sigContent_220 = 8'hf3;
  assign sigContent_221 = 8'hf4;
  assign sigContent_222 = 8'hf5;
  assign sigContent_223 = 8'hf5;
  assign sigContent_224 = 8'hf6;
  assign sigContent_225 = 8'hf6;
  assign sigContent_226 = 8'hf7;
  assign sigContent_227 = 8'hf7;
  assign sigContent_228 = 8'hf8;
  assign sigContent_229 = 8'hf9;
  assign sigContent_230 = 8'hf9;
  assign sigContent_231 = 8'hf9;
  assign sigContent_232 = 8'hfa;
  assign sigContent_233 = 8'hfa;
  assign sigContent_234 = 8'hfb;
  assign sigContent_235 = 8'hfb;
  assign sigContent_236 = 8'hfc;
  assign sigContent_237 = 8'hfc;
  assign sigContent_238 = 8'hfc;
  assign sigContent_239 = 8'hfd;
  assign sigContent_240 = 8'hfd;
  assign sigContent_241 = 8'hfd;
  assign sigContent_242 = 8'hfd;
  assign sigContent_243 = 8'hfe;
  assign sigContent_244 = 8'hfe;
  assign sigContent_245 = 8'hfe;
  assign sigContent_246 = 8'hfe;
  assign sigContent_247 = 8'hfe;
  assign sigContent_248 = 8'hff;
  assign sigContent_249 = 8'hff;
  assign sigContent_250 = 8'hff;
  assign sigContent_251 = 8'hff;
  assign sigContent_252 = 8'hff;
  assign sigContent_253 = 8'hff;
  assign sigContent_254 = 8'hff;
  assign sigContent_255 = 8'hff;
  assign sigContent_256 = 8'hff;
  assign addr0 = {1'd0, io_baseIndex};
  assign addr1 = (_zz_addr1 + 9'h001);
  always @(*) begin
    y0 = 8'h0;
    case(io_curveSelect)
      2'b00 : begin
        y0 = linRom_spinal_port0;
      end
      2'b01 : begin
        y0 = expRom_spinal_port0;
      end
      2'b10 : begin
        y0 = logRom_spinal_port0;
      end
      default : begin
        y0 = sigRom_spinal_port0;
      end
    endcase
  end

  always @(*) begin
    y1 = 8'h0;
    case(io_curveSelect)
      2'b00 : begin
        y1 = linRom_spinal_port1;
      end
      2'b01 : begin
        y1 = expRom_spinal_port1;
      end
      2'b10 : begin
        y1 = logRom_spinal_port1;
      end
      default : begin
        y1 = sigRom_spinal_port1;
      end
    endcase
  end

  assign y0Signed = {1'b0,y0};
  assign y1Signed = {1'b0,y1};
  assign delta = ($signed(y1Signed) - $signed(y0Signed));
  assign y0Shifted = {{1{_zz_y0Shifted[10]}}, _zz_y0Shifted};
  assign deltaShifted = {{2{_zz_deltaShifted[9]}}, _zz_deltaShifted};
  assign deltaResized = {{3{delta[8]}}, delta};
  assign fractionAdjusted = (io_accumDir ? _zz_fractionAdjusted : io_fraction);
  always @(*) begin
    case(fractionAdjusted)
      2'b00 : begin
        interp = y0Shifted;
      end
      2'b01 : begin
        interp = ($signed(y0Shifted) + $signed(deltaResized));
      end
      2'b10 : begin
        interp = ($signed(y0Shifted) + $signed(deltaShifted));
      end
      default : begin
        interp = ($signed(_zz_interp) + $signed(deltaResized));
      end
    endcase
  end

  assign finalValUnipolar = _zz_finalValUnipolar[9:0];
  assign io_envelopeOut_payload = finalValUnipolar_regNext;
  assign finalValBipolar = (finalValUnipolar ^ 10'h200);
  assign io_envelopeOutSigned_payload = finalValBipolar_regNext;
  assign io_envelopeOut_valid = outValid;
  assign io_envelopeOutSigned_valid = outValid;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      finalValUnipolar_regNext <= 10'h0;
      finalValBipolar_regNext <= 10'h0;
      outValid <= 1'b0;
    end else begin
      finalValUnipolar_regNext <= finalValUnipolar;
      finalValBipolar_regNext <= finalValBipolar;
      outValid <= (io_phaseTick && (! io_reset));
    end
  end


endmodule

module EnvelopeAccumulator (
  input  wire          io_resetAccum,
  input  wire          io_runAccum,
  input  wire          io_accumDir,
  input  wire [21:0]   io_phaseInc,
  input  wire [7:0]    io_sustainLevel,
  input  wire [2:0]    io_activeStage,
  output wire          io_segmentDone,
  output wire [7:0]    io_baseIndex,
  output wire [1:0]    io_fraction,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);

  wire       [31:0]   _zz_underflow;
  wire       [31:0]   _zz_accum;
  wire       [31:0]   _zz_accum_1;
  reg        [31:0]   accum;
  wire       [32:0]   phaseIncExt;
  wire       [32:0]   accumExt;
  wire       [32:0]   nextSum;
  wire                overflow;
  wire                underflow;
  wire                when_EnvelopeAccumulator_l39;
  wire                when_EnvelopeAccumulator_l45;
  wire                isDecayTarget;
  wire                isReleaseTarget;
  wire                rawSegmentDone;

  assign _zz_underflow = {10'd0, io_phaseInc};
  assign _zz_accum = {10'd0, io_phaseInc};
  assign _zz_accum_1 = {10'd0, io_phaseInc};
  assign phaseIncExt = {11'd0, io_phaseInc};
  assign accumExt = {1'd0, accum};
  assign nextSum = (accumExt + phaseIncExt);
  assign overflow = nextSum[32];
  assign underflow = (accum < _zz_underflow);
  assign when_EnvelopeAccumulator_l39 = ((io_activeStage == 3'b001) && io_segmentDone);
  assign when_EnvelopeAccumulator_l45 = (! io_accumDir);
  assign io_baseIndex = accum[31 : 24];
  assign io_fraction = accum[23 : 22];
  assign isDecayTarget = ((io_activeStage == 3'b010) && (io_baseIndex <= io_sustainLevel));
  assign isReleaseTarget = ((io_activeStage == 3'b100) && underflow);
  assign rawSegmentDone = (io_runAccum && ((((io_activeStage == 3'b001) && overflow) || isDecayTarget) || isReleaseTarget));
  assign io_segmentDone = (rawSegmentDone && (! io_reset));
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      accum <= 32'h0;
    end else begin
      if(io_resetAccum) begin
        if(when_EnvelopeAccumulator_l39) begin
          accum <= 32'hffffffff;
        end else begin
          accum <= 32'h0;
        end
      end else begin
        if(io_runAccum) begin
          if(when_EnvelopeAccumulator_l45) begin
            accum <= (accum + _zz_accum);
          end else begin
            accum <= (accum - _zz_accum_1);
          end
        end
      end
    end
  end


endmodule

module EnvelopeCtrl (
  input  wire          io_syncIn,
  input  wire [7:0]    io_config_ctrl,
  input  wire [7:0]    io_config_attack,
  input  wire [7:0]    io_config_decay,
  input  wire [7:0]    io_config_sustain,
  input  wire [7:0]    io_config_release,
  input  wire [7:0]    io_config_gate,
  input  wire          io_segmentDone,
  output wire          io_resetAccum,
  output wire          io_runAccum,
  output wire          io_accumDir,
  output wire [21:0]   io_phaseInc,
  output wire [1:0]    io_curveSelect,
  output wire [2:0]    io_activeStage,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);
  localparam fsm_1_BOOT = 3'd0;
  localparam fsm_1_IDLE = 3'd1;
  localparam fsm_1_ATTACK = 3'd2;
  localparam fsm_1_DECAY = 3'd3;
  localparam fsm_1_SUSTAIN = 3'd4;
  localparam fsm_1_RELEASE_1 = 3'd5;

  wire       [21:0]   rom_spinal_port0;
  wire                gateOn;
  wire       [21:0]   lutContent_0;
  wire       [21:0]   lutContent_1;
  wire       [21:0]   lutContent_2;
  wire       [21:0]   lutContent_3;
  wire       [21:0]   lutContent_4;
  wire       [21:0]   lutContent_5;
  wire       [21:0]   lutContent_6;
  wire       [21:0]   lutContent_7;
  wire       [21:0]   lutContent_8;
  wire       [21:0]   lutContent_9;
  wire       [21:0]   lutContent_10;
  wire       [21:0]   lutContent_11;
  wire       [21:0]   lutContent_12;
  wire       [21:0]   lutContent_13;
  wire       [21:0]   lutContent_14;
  wire       [21:0]   lutContent_15;
  wire       [21:0]   lutContent_16;
  wire       [21:0]   lutContent_17;
  wire       [21:0]   lutContent_18;
  wire       [21:0]   lutContent_19;
  wire       [21:0]   lutContent_20;
  wire       [21:0]   lutContent_21;
  wire       [21:0]   lutContent_22;
  wire       [21:0]   lutContent_23;
  wire       [21:0]   lutContent_24;
  wire       [21:0]   lutContent_25;
  wire       [21:0]   lutContent_26;
  wire       [21:0]   lutContent_27;
  wire       [21:0]   lutContent_28;
  wire       [21:0]   lutContent_29;
  wire       [21:0]   lutContent_30;
  wire       [21:0]   lutContent_31;
  wire       [21:0]   lutContent_32;
  wire       [21:0]   lutContent_33;
  wire       [21:0]   lutContent_34;
  wire       [21:0]   lutContent_35;
  wire       [21:0]   lutContent_36;
  wire       [21:0]   lutContent_37;
  wire       [21:0]   lutContent_38;
  wire       [21:0]   lutContent_39;
  wire       [21:0]   lutContent_40;
  wire       [21:0]   lutContent_41;
  wire       [21:0]   lutContent_42;
  wire       [21:0]   lutContent_43;
  wire       [21:0]   lutContent_44;
  wire       [21:0]   lutContent_45;
  wire       [21:0]   lutContent_46;
  wire       [21:0]   lutContent_47;
  wire       [21:0]   lutContent_48;
  wire       [21:0]   lutContent_49;
  wire       [21:0]   lutContent_50;
  wire       [21:0]   lutContent_51;
  wire       [21:0]   lutContent_52;
  wire       [21:0]   lutContent_53;
  wire       [21:0]   lutContent_54;
  wire       [21:0]   lutContent_55;
  wire       [21:0]   lutContent_56;
  wire       [21:0]   lutContent_57;
  wire       [21:0]   lutContent_58;
  wire       [21:0]   lutContent_59;
  wire       [21:0]   lutContent_60;
  wire       [21:0]   lutContent_61;
  wire       [21:0]   lutContent_62;
  wire       [21:0]   lutContent_63;
  wire       [21:0]   lutContent_64;
  wire       [21:0]   lutContent_65;
  wire       [21:0]   lutContent_66;
  wire       [21:0]   lutContent_67;
  wire       [21:0]   lutContent_68;
  wire       [21:0]   lutContent_69;
  wire       [21:0]   lutContent_70;
  wire       [21:0]   lutContent_71;
  wire       [21:0]   lutContent_72;
  wire       [21:0]   lutContent_73;
  wire       [21:0]   lutContent_74;
  wire       [21:0]   lutContent_75;
  wire       [21:0]   lutContent_76;
  wire       [21:0]   lutContent_77;
  wire       [21:0]   lutContent_78;
  wire       [21:0]   lutContent_79;
  wire       [21:0]   lutContent_80;
  wire       [21:0]   lutContent_81;
  wire       [21:0]   lutContent_82;
  wire       [21:0]   lutContent_83;
  wire       [21:0]   lutContent_84;
  wire       [21:0]   lutContent_85;
  wire       [21:0]   lutContent_86;
  wire       [21:0]   lutContent_87;
  wire       [21:0]   lutContent_88;
  wire       [21:0]   lutContent_89;
  wire       [21:0]   lutContent_90;
  wire       [21:0]   lutContent_91;
  wire       [21:0]   lutContent_92;
  wire       [21:0]   lutContent_93;
  wire       [21:0]   lutContent_94;
  wire       [21:0]   lutContent_95;
  wire       [21:0]   lutContent_96;
  wire       [21:0]   lutContent_97;
  wire       [21:0]   lutContent_98;
  wire       [21:0]   lutContent_99;
  wire       [21:0]   lutContent_100;
  wire       [21:0]   lutContent_101;
  wire       [21:0]   lutContent_102;
  wire       [21:0]   lutContent_103;
  wire       [21:0]   lutContent_104;
  wire       [21:0]   lutContent_105;
  wire       [21:0]   lutContent_106;
  wire       [21:0]   lutContent_107;
  wire       [21:0]   lutContent_108;
  wire       [21:0]   lutContent_109;
  wire       [21:0]   lutContent_110;
  wire       [21:0]   lutContent_111;
  wire       [21:0]   lutContent_112;
  wire       [21:0]   lutContent_113;
  wire       [21:0]   lutContent_114;
  wire       [21:0]   lutContent_115;
  wire       [21:0]   lutContent_116;
  wire       [21:0]   lutContent_117;
  wire       [21:0]   lutContent_118;
  wire       [21:0]   lutContent_119;
  wire       [21:0]   lutContent_120;
  wire       [21:0]   lutContent_121;
  wire       [21:0]   lutContent_122;
  wire       [21:0]   lutContent_123;
  wire       [21:0]   lutContent_124;
  wire       [21:0]   lutContent_125;
  wire       [21:0]   lutContent_126;
  wire       [21:0]   lutContent_127;
  wire       [21:0]   lutContent_128;
  wire       [21:0]   lutContent_129;
  wire       [21:0]   lutContent_130;
  wire       [21:0]   lutContent_131;
  wire       [21:0]   lutContent_132;
  wire       [21:0]   lutContent_133;
  wire       [21:0]   lutContent_134;
  wire       [21:0]   lutContent_135;
  wire       [21:0]   lutContent_136;
  wire       [21:0]   lutContent_137;
  wire       [21:0]   lutContent_138;
  wire       [21:0]   lutContent_139;
  wire       [21:0]   lutContent_140;
  wire       [21:0]   lutContent_141;
  wire       [21:0]   lutContent_142;
  wire       [21:0]   lutContent_143;
  wire       [21:0]   lutContent_144;
  wire       [21:0]   lutContent_145;
  wire       [21:0]   lutContent_146;
  wire       [21:0]   lutContent_147;
  wire       [21:0]   lutContent_148;
  wire       [21:0]   lutContent_149;
  wire       [21:0]   lutContent_150;
  wire       [21:0]   lutContent_151;
  wire       [21:0]   lutContent_152;
  wire       [21:0]   lutContent_153;
  wire       [21:0]   lutContent_154;
  wire       [21:0]   lutContent_155;
  wire       [21:0]   lutContent_156;
  wire       [21:0]   lutContent_157;
  wire       [21:0]   lutContent_158;
  wire       [21:0]   lutContent_159;
  wire       [21:0]   lutContent_160;
  wire       [21:0]   lutContent_161;
  wire       [21:0]   lutContent_162;
  wire       [21:0]   lutContent_163;
  wire       [21:0]   lutContent_164;
  wire       [21:0]   lutContent_165;
  wire       [21:0]   lutContent_166;
  wire       [21:0]   lutContent_167;
  wire       [21:0]   lutContent_168;
  wire       [21:0]   lutContent_169;
  wire       [21:0]   lutContent_170;
  wire       [21:0]   lutContent_171;
  wire       [21:0]   lutContent_172;
  wire       [21:0]   lutContent_173;
  wire       [21:0]   lutContent_174;
  wire       [21:0]   lutContent_175;
  wire       [21:0]   lutContent_176;
  wire       [21:0]   lutContent_177;
  wire       [21:0]   lutContent_178;
  wire       [21:0]   lutContent_179;
  wire       [21:0]   lutContent_180;
  wire       [21:0]   lutContent_181;
  wire       [21:0]   lutContent_182;
  wire       [21:0]   lutContent_183;
  wire       [21:0]   lutContent_184;
  wire       [21:0]   lutContent_185;
  wire       [21:0]   lutContent_186;
  wire       [21:0]   lutContent_187;
  wire       [21:0]   lutContent_188;
  wire       [21:0]   lutContent_189;
  wire       [21:0]   lutContent_190;
  wire       [21:0]   lutContent_191;
  wire       [21:0]   lutContent_192;
  wire       [21:0]   lutContent_193;
  wire       [21:0]   lutContent_194;
  wire       [21:0]   lutContent_195;
  wire       [21:0]   lutContent_196;
  wire       [21:0]   lutContent_197;
  wire       [21:0]   lutContent_198;
  wire       [21:0]   lutContent_199;
  wire       [21:0]   lutContent_200;
  wire       [21:0]   lutContent_201;
  wire       [21:0]   lutContent_202;
  wire       [21:0]   lutContent_203;
  wire       [21:0]   lutContent_204;
  wire       [21:0]   lutContent_205;
  wire       [21:0]   lutContent_206;
  wire       [21:0]   lutContent_207;
  wire       [21:0]   lutContent_208;
  wire       [21:0]   lutContent_209;
  wire       [21:0]   lutContent_210;
  wire       [21:0]   lutContent_211;
  wire       [21:0]   lutContent_212;
  wire       [21:0]   lutContent_213;
  wire       [21:0]   lutContent_214;
  wire       [21:0]   lutContent_215;
  wire       [21:0]   lutContent_216;
  wire       [21:0]   lutContent_217;
  wire       [21:0]   lutContent_218;
  wire       [21:0]   lutContent_219;
  wire       [21:0]   lutContent_220;
  wire       [21:0]   lutContent_221;
  wire       [21:0]   lutContent_222;
  wire       [21:0]   lutContent_223;
  wire       [21:0]   lutContent_224;
  wire       [21:0]   lutContent_225;
  wire       [21:0]   lutContent_226;
  wire       [21:0]   lutContent_227;
  wire       [21:0]   lutContent_228;
  wire       [21:0]   lutContent_229;
  wire       [21:0]   lutContent_230;
  wire       [21:0]   lutContent_231;
  wire       [21:0]   lutContent_232;
  wire       [21:0]   lutContent_233;
  wire       [21:0]   lutContent_234;
  wire       [21:0]   lutContent_235;
  wire       [21:0]   lutContent_236;
  wire       [21:0]   lutContent_237;
  wire       [21:0]   lutContent_238;
  wire       [21:0]   lutContent_239;
  wire       [21:0]   lutContent_240;
  wire       [21:0]   lutContent_241;
  wire       [21:0]   lutContent_242;
  wire       [21:0]   lutContent_243;
  wire       [21:0]   lutContent_244;
  wire       [21:0]   lutContent_245;
  wire       [21:0]   lutContent_246;
  wire       [21:0]   lutContent_247;
  wire       [21:0]   lutContent_248;
  wire       [21:0]   lutContent_249;
  wire       [21:0]   lutContent_250;
  wire       [21:0]   lutContent_251;
  wire       [21:0]   lutContent_252;
  wire       [21:0]   lutContent_253;
  wire       [21:0]   lutContent_254;
  wire       [21:0]   lutContent_255;
  reg        [7:0]    romAddr;
  reg                 syncInD1;
  wire                hwSyncPulse;
  reg                 swSyncD1;
  wire                swSyncPulse;
  wire                hardSyncPulse;
  reg                 fsmResetAccum;
  reg                 fsmRunAccum;
  reg        [2:0]    fsmActiveStage;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_EnvelopeCtrl_l107;
  wire                when_EnvelopeCtrl_l125;
  wire                when_EnvelopeCtrl_l121;
  wire                when_EnvelopeCtrl_l139;
  `ifndef SYNTHESIS
  reg [71:0] fsm_stateReg_string;
  reg [71:0] fsm_stateNext_string;
  `endif

  reg [21:0] rom [0:255];

  initial begin
    $readmemb("Synth.v_toplevel_core_envGen_ctrl_rom.bin",rom);
  end
  assign rom_spinal_port0 = rom[romAddr];
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_1_BOOT : fsm_stateReg_string = "BOOT     ";
      fsm_1_IDLE : fsm_stateReg_string = "IDLE     ";
      fsm_1_ATTACK : fsm_stateReg_string = "ATTACK   ";
      fsm_1_DECAY : fsm_stateReg_string = "DECAY    ";
      fsm_1_SUSTAIN : fsm_stateReg_string = "SUSTAIN  ";
      fsm_1_RELEASE_1 : fsm_stateReg_string = "RELEASE_1";
      default : fsm_stateReg_string = "?????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_1_BOOT : fsm_stateNext_string = "BOOT     ";
      fsm_1_IDLE : fsm_stateNext_string = "IDLE     ";
      fsm_1_ATTACK : fsm_stateNext_string = "ATTACK   ";
      fsm_1_DECAY : fsm_stateNext_string = "DECAY    ";
      fsm_1_SUSTAIN : fsm_stateNext_string = "SUSTAIN  ";
      fsm_1_RELEASE_1 : fsm_stateNext_string = "RELEASE_1";
      default : fsm_stateNext_string = "?????????";
    endcase
  end
  `endif

  assign gateOn = io_config_gate[0];
  assign lutContent_0 = 22'h05761a;
  assign lutContent_1 = 22'h053b10;
  assign lutContent_2 = 22'h050284;
  assign lutContent_3 = 22'h04cc5c;
  assign lutContent_4 = 22'h04987d;
  assign lutContent_5 = 22'h0466cf;
  assign lutContent_6 = 22'h043739;
  assign lutContent_7 = 22'h0409a7;
  assign lutContent_8 = 22'h03de00;
  assign lutContent_9 = 22'h03b432;
  assign lutContent_10 = 22'h038c28;
  assign lutContent_11 = 22'h0365ce;
  assign lutContent_12 = 22'h034113;
  assign lutContent_13 = 22'h031de6;
  assign lutContent_14 = 22'h02fc34;
  assign lutContent_15 = 22'h02dbef;
  assign lutContent_16 = 22'h02bd06;
  assign lutContent_17 = 22'h029f6c;
  assign lutContent_18 = 22'h028312;
  assign lutContent_19 = 22'h0267ea;
  assign lutContent_20 = 22'h024de8;
  assign lutContent_21 = 22'h0234fe;
  assign lutContent_22 = 22'h021d23;
  assign lutContent_23 = 22'h020649;
  assign lutContent_24 = 22'h01f066;
  assign lutContent_25 = 22'h01db70;
  assign lutContent_26 = 22'h01c75c;
  assign lutContent_27 = 22'h01b421;
  assign lutContent_28 = 22'h01a1b7;
  assign lutContent_29 = 22'h019013;
  assign lutContent_30 = 22'h017f2e;
  assign lutContent_31 = 22'h016f00;
  assign lutContent_32 = 22'h015f80;
  assign lutContent_33 = 22'h0150a9;
  assign lutContent_34 = 22'h014271;
  assign lutContent_35 = 22'h0134d3;
  assign lutContent_36 = 22'h0127c9;
  assign lutContent_37 = 22'h011b4b;
  assign lutContent_38 = 22'h010f55;
  assign lutContent_39 = 22'h0103e0;
  assign lutContent_40 = 22'h00f8e6;
  assign lutContent_41 = 22'h00ee64;
  assign lutContent_42 = 22'h00e453;
  assign lutContent_43 = 22'h00daae;
  assign lutContent_44 = 22'h00d172;
  assign lutContent_45 = 22'h00c89a;
  assign lutContent_46 = 22'h00c022;
  assign lutContent_47 = 22'h00b805;
  assign lutContent_48 = 22'h00b03f;
  assign lutContent_49 = 22'h00a8ce;
  assign lutContent_50 = 22'h00a1ad;
  assign lutContent_51 = 22'h009ad9;
  assign lutContent_52 = 22'h00944f;
  assign lutContent_53 = 22'h008e0c;
  assign lutContent_54 = 22'h00880d;
  assign lutContent_55 = 22'h00824e;
  assign lutContent_56 = 22'h007ccd;
  assign lutContent_57 = 22'h007788;
  assign lutContent_58 = 22'h00727c;
  assign lutContent_59 = 22'h006da6;
  assign lutContent_60 = 22'h006905;
  assign lutContent_61 = 22'h006496;
  assign lutContent_62 = 22'h006056;
  assign lutContent_63 = 22'h005c45;
  assign lutContent_64 = 22'h00585f;
  assign lutContent_65 = 22'h0054a4;
  assign lutContent_66 = 22'h005111;
  assign lutContent_67 = 22'h004da5;
  assign lutContent_68 = 22'h004a5d;
  assign lutContent_69 = 22'h004739;
  assign lutContent_70 = 22'h004437;
  assign lutContent_71 = 22'h004156;
  assign lutContent_72 = 22'h003e94;
  assign lutContent_73 = 22'h003bef;
  assign lutContent_74 = 22'h003967;
  assign lutContent_75 = 22'h0036fb;
  assign lutContent_76 = 22'h0034a8;
  assign lutContent_77 = 22'h00326f;
  assign lutContent_78 = 22'h00304e;
  assign lutContent_79 = 22'h002e44;
  assign lutContent_80 = 22'h002c50;
  assign lutContent_81 = 22'h002a71;
  assign lutContent_82 = 22'h0028a6;
  assign lutContent_83 = 22'h0026ee;
  assign lutContent_84 = 22'h00254a;
  assign lutContent_85 = 22'h0023b6;
  assign lutContent_86 = 22'h002234;
  assign lutContent_87 = 22'h0020c3;
  assign lutContent_88 = 22'h001f60;
  assign lutContent_89 = 22'h001e0d;
  assign lutContent_90 = 22'h001cc8;
  assign lutContent_91 = 22'h001b91;
  assign lutContent_92 = 22'h001a67;
  assign lutContent_93 = 22'h00194a;
  assign lutContent_94 = 22'h001838;
  assign lutContent_95 = 22'h001733;
  assign lutContent_96 = 22'h001638;
  assign lutContent_97 = 22'h001548;
  assign lutContent_98 = 22'h001462;
  assign lutContent_99 = 22'h001385;
  assign lutContent_100 = 22'h0012b2;
  assign lutContent_101 = 22'h0011e8;
  assign lutContent_102 = 22'h001127;
  assign lutContent_103 = 22'h00106d;
  assign lutContent_104 = 22'h000fbc;
  assign lutContent_105 = 22'h000f11;
  assign lutContent_106 = 22'h000e6f;
  assign lutContent_107 = 22'h000dd3;
  assign lutContent_108 = 22'h000d3d;
  assign lutContent_109 = 22'h000cae;
  assign lutContent_110 = 22'h000c25;
  assign lutContent_111 = 22'h000ba2;
  assign lutContent_112 = 22'h000b24;
  assign lutContent_113 = 22'h000aac;
  assign lutContent_114 = 22'h000a38;
  assign lutContent_115 = 22'h0009ca;
  assign lutContent_116 = 22'h000960;
  assign lutContent_117 = 22'h0008fb;
  assign lutContent_118 = 22'h000899;
  assign lutContent_119 = 22'h00083d;
  assign lutContent_120 = 22'h0007e3;
  assign lutContent_121 = 22'h00078e;
  assign lutContent_122 = 22'h00073d;
  assign lutContent_123 = 22'h0006ee;
  assign lutContent_124 = 22'h0006a3;
  assign lutContent_125 = 22'h00065c;
  assign lutContent_126 = 22'h000617;
  assign lutContent_127 = 22'h0005d5;
  assign lutContent_128 = 22'h000596;
  assign lutContent_129 = 22'h00055a;
  assign lutContent_130 = 22'h000520;
  assign lutContent_131 = 22'h0004e8;
  assign lutContent_132 = 22'h0004b3;
  assign lutContent_133 = 22'h000481;
  assign lutContent_134 = 22'h000450;
  assign lutContent_135 = 22'h000421;
  assign lutContent_136 = 22'h0003f5;
  assign lutContent_137 = 22'h0003ca;
  assign lutContent_138 = 22'h0003a1;
  assign lutContent_139 = 22'h00037a;
  assign lutContent_140 = 22'h000354;
  assign lutContent_141 = 22'h000330;
  assign lutContent_142 = 22'h00030e;
  assign lutContent_143 = 22'h0002ed;
  assign lutContent_144 = 22'h0002cd;
  assign lutContent_145 = 22'h0002af;
  assign lutContent_146 = 22'h000292;
  assign lutContent_147 = 22'h000276;
  assign lutContent_148 = 22'h00025b;
  assign lutContent_149 = 22'h000242;
  assign lutContent_150 = 22'h000229;
  assign lutContent_151 = 22'h000212;
  assign lutContent_152 = 22'h0001fc;
  assign lutContent_153 = 22'h0001e6;
  assign lutContent_154 = 22'h0001d2;
  assign lutContent_155 = 22'h0001be;
  assign lutContent_156 = 22'h0001ab;
  assign lutContent_157 = 22'h000199;
  assign lutContent_158 = 22'h000188;
  assign lutContent_159 = 22'h000177;
  assign lutContent_160 = 22'h000168;
  assign lutContent_161 = 22'h000158;
  assign lutContent_162 = 22'h00014a;
  assign lutContent_163 = 22'h00013c;
  assign lutContent_164 = 22'h00012f;
  assign lutContent_165 = 22'h000122;
  assign lutContent_166 = 22'h000116;
  assign lutContent_167 = 22'h00010a;
  assign lutContent_168 = 22'h0000ff;
  assign lutContent_169 = 22'h0000f4;
  assign lutContent_170 = 22'h0000ea;
  assign lutContent_171 = 22'h0000e0;
  assign lutContent_172 = 22'h0000d6;
  assign lutContent_173 = 22'h0000cd;
  assign lutContent_174 = 22'h0000c5;
  assign lutContent_175 = 22'h0000bc;
  assign lutContent_176 = 22'h0000b4;
  assign lutContent_177 = 22'h0000ad;
  assign lutContent_178 = 22'h0000a5;
  assign lutContent_179 = 22'h00009e;
  assign lutContent_180 = 22'h000098;
  assign lutContent_181 = 22'h000091;
  assign lutContent_182 = 22'h00008b;
  assign lutContent_183 = 22'h000085;
  assign lutContent_184 = 22'h000080;
  assign lutContent_185 = 22'h00007a;
  assign lutContent_186 = 22'h000075;
  assign lutContent_187 = 22'h000070;
  assign lutContent_188 = 22'h00006b;
  assign lutContent_189 = 22'h000067;
  assign lutContent_190 = 22'h000063;
  assign lutContent_191 = 22'h00005e;
  assign lutContent_192 = 22'h00005a;
  assign lutContent_193 = 22'h000057;
  assign lutContent_194 = 22'h000053;
  assign lutContent_195 = 22'h00004f;
  assign lutContent_196 = 22'h00004c;
  assign lutContent_197 = 22'h000049;
  assign lutContent_198 = 22'h000046;
  assign lutContent_199 = 22'h000043;
  assign lutContent_200 = 22'h000040;
  assign lutContent_201 = 22'h00003d;
  assign lutContent_202 = 22'h00003b;
  assign lutContent_203 = 22'h000038;
  assign lutContent_204 = 22'h000036;
  assign lutContent_205 = 22'h000034;
  assign lutContent_206 = 22'h000031;
  assign lutContent_207 = 22'h00002f;
  assign lutContent_208 = 22'h00002d;
  assign lutContent_209 = 22'h00002b;
  assign lutContent_210 = 22'h00002a;
  assign lutContent_211 = 22'h000028;
  assign lutContent_212 = 22'h000026;
  assign lutContent_213 = 22'h000025;
  assign lutContent_214 = 22'h000023;
  assign lutContent_215 = 22'h000022;
  assign lutContent_216 = 22'h000020;
  assign lutContent_217 = 22'h00001f;
  assign lutContent_218 = 22'h00001d;
  assign lutContent_219 = 22'h00001c;
  assign lutContent_220 = 22'h00001b;
  assign lutContent_221 = 22'h00001a;
  assign lutContent_222 = 22'h000019;
  assign lutContent_223 = 22'h000018;
  assign lutContent_224 = 22'h000017;
  assign lutContent_225 = 22'h000016;
  assign lutContent_226 = 22'h000015;
  assign lutContent_227 = 22'h000014;
  assign lutContent_228 = 22'h000013;
  assign lutContent_229 = 22'h000012;
  assign lutContent_230 = 22'h000012;
  assign lutContent_231 = 22'h000011;
  assign lutContent_232 = 22'h000010;
  assign lutContent_233 = 22'h00000f;
  assign lutContent_234 = 22'h00000f;
  assign lutContent_235 = 22'h00000e;
  assign lutContent_236 = 22'h00000e;
  assign lutContent_237 = 22'h00000d;
  assign lutContent_238 = 22'h00000c;
  assign lutContent_239 = 22'h00000c;
  assign lutContent_240 = 22'h00000b;
  assign lutContent_241 = 22'h00000b;
  assign lutContent_242 = 22'h00000a;
  assign lutContent_243 = 22'h00000a;
  assign lutContent_244 = 22'h00000a;
  assign lutContent_245 = 22'h000009;
  assign lutContent_246 = 22'h000009;
  assign lutContent_247 = 22'h000008;
  assign lutContent_248 = 22'h000008;
  assign lutContent_249 = 22'h000008;
  assign lutContent_250 = 22'h000007;
  assign lutContent_251 = 22'h000007;
  assign lutContent_252 = 22'h000007;
  assign lutContent_253 = 22'h000007;
  assign lutContent_254 = 22'h000006;
  assign lutContent_255 = 22'h000006;
  always @(*) begin
    romAddr = 8'h0;
    case(io_activeStage)
      3'b001 : begin
        romAddr = io_config_attack;
      end
      3'b010 : begin
        romAddr = io_config_decay;
      end
      3'b100 : begin
        romAddr = io_config_release;
      end
      default : begin
      end
    endcase
  end

  assign io_phaseInc = rom_spinal_port0;
  assign io_curveSelect = io_config_ctrl[5 : 4];
  assign hwSyncPulse = (io_syncIn && (! syncInD1));
  assign swSyncPulse = (io_config_gate[1] && (! swSyncD1));
  assign hardSyncPulse = (((hwSyncPulse || swSyncPulse) && io_config_ctrl[1]) && (! io_reset));
  assign io_accumDir = ((io_activeStage == 3'b010) || (io_activeStage == 3'b100));
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_1_IDLE : begin
      end
      fsm_1_ATTACK : begin
      end
      fsm_1_DECAY : begin
      end
      fsm_1_SUSTAIN : begin
      end
      fsm_1_RELEASE_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsmResetAccum = 1'b0;
    case(fsm_stateReg)
      fsm_1_IDLE : begin
        if(gateOn) begin
          fsmResetAccum = 1'b1;
        end
      end
      fsm_1_ATTACK : begin
        if(hardSyncPulse) begin
          fsmResetAccum = 1'b1;
        end else begin
          if(!when_EnvelopeCtrl_l107) begin
            if(io_segmentDone) begin
              fsmResetAccum = 1'b1;
            end
          end
        end
      end
      fsm_1_DECAY : begin
        if(hardSyncPulse) begin
          fsmResetAccum = 1'b1;
        end else begin
          if(!when_EnvelopeCtrl_l121) begin
            if(io_segmentDone) begin
              if(when_EnvelopeCtrl_l125) begin
                fsmResetAccum = 1'b1;
              end
            end
          end
        end
      end
      fsm_1_SUSTAIN : begin
        if(hardSyncPulse) begin
          fsmResetAccum = 1'b1;
        end
      end
      fsm_1_RELEASE_1 : begin
        if(hardSyncPulse) begin
          fsmResetAccum = 1'b1;
        end else begin
          if(gateOn) begin
            fsmResetAccum = 1'b1;
          end else begin
            if(io_segmentDone) begin
              fsmResetAccum = 1'b1;
            end
          end
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsmRunAccum = 1'b0;
    case(fsm_stateReg)
      fsm_1_IDLE : begin
        if(gateOn) begin
          fsmRunAccum = 1'b1;
        end
      end
      fsm_1_ATTACK : begin
        fsmRunAccum = 1'b1;
      end
      fsm_1_DECAY : begin
        fsmRunAccum = 1'b1;
      end
      fsm_1_SUSTAIN : begin
      end
      fsm_1_RELEASE_1 : begin
        fsmRunAccum = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsmActiveStage = 3'b000;
    case(fsm_stateReg)
      fsm_1_IDLE : begin
        fsmActiveStage = 3'b000;
      end
      fsm_1_ATTACK : begin
        fsmActiveStage = 3'b001;
      end
      fsm_1_DECAY : begin
        fsmActiveStage = 3'b010;
      end
      fsm_1_SUSTAIN : begin
        fsmActiveStage = 3'b011;
      end
      fsm_1_RELEASE_1 : begin
        fsmActiveStage = 3'b100;
      end
      default : begin
      end
    endcase
  end

  assign io_resetAccum = (fsmResetAccum && (! io_reset));
  assign io_runAccum = (fsmRunAccum && (! io_reset));
  assign io_activeStage = (io_reset ? 3'b000 : fsmActiveStage);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_1_IDLE : begin
        if(gateOn) begin
          fsm_stateNext = fsm_1_ATTACK;
        end
      end
      fsm_1_ATTACK : begin
        if(hardSyncPulse) begin
          fsm_stateNext = fsm_1_ATTACK;
        end else begin
          if(when_EnvelopeCtrl_l107) begin
            fsm_stateNext = fsm_1_RELEASE_1;
          end else begin
            if(io_segmentDone) begin
              fsm_stateNext = fsm_1_DECAY;
            end
          end
        end
      end
      fsm_1_DECAY : begin
        if(hardSyncPulse) begin
          fsm_stateNext = fsm_1_ATTACK;
        end else begin
          if(when_EnvelopeCtrl_l121) begin
            fsm_stateNext = fsm_1_RELEASE_1;
          end else begin
            if(io_segmentDone) begin
              if(when_EnvelopeCtrl_l125) begin
                fsm_stateNext = fsm_1_ATTACK;
              end else begin
                fsm_stateNext = fsm_1_SUSTAIN;
              end
            end
          end
        end
      end
      fsm_1_SUSTAIN : begin
        if(hardSyncPulse) begin
          fsm_stateNext = fsm_1_ATTACK;
        end else begin
          if(when_EnvelopeCtrl_l139) begin
            fsm_stateNext = fsm_1_RELEASE_1;
          end
        end
      end
      fsm_1_RELEASE_1 : begin
        if(hardSyncPulse) begin
          fsm_stateNext = fsm_1_ATTACK;
        end else begin
          if(gateOn) begin
            fsm_stateNext = fsm_1_ATTACK;
          end else begin
            if(io_segmentDone) begin
              fsm_stateNext = fsm_1_IDLE;
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_1_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_1_BOOT;
    end
  end

  assign when_EnvelopeCtrl_l107 = (! gateOn);
  assign when_EnvelopeCtrl_l125 = io_config_ctrl[2];
  assign when_EnvelopeCtrl_l121 = (! gateOn);
  assign when_EnvelopeCtrl_l139 = (! gateOn);
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      syncInD1 <= 1'b0;
      swSyncD1 <= 1'b0;
      fsm_stateReg <= fsm_1_BOOT;
    end else begin
      syncInD1 <= io_syncIn;
      swSyncD1 <= io_config_gate[1];
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule

module Mux (
  input  wire [2:0]    io_waveSelect,
  input  wire [15:0]   io_waves_saw,
  input  wire [15:0]   io_waves_square,
  input  wire [15:0]   io_waves_pwm,
  input  wire [15:0]   io_waves_tri,
  input  wire [15:0]   io_noiseWave,
  output reg  [15:0]   io_sample
);


  always @(*) begin
    case(io_waveSelect)
      3'b000 : begin
        io_sample = io_waves_saw;
      end
      3'b001 : begin
        io_sample = io_waves_square;
      end
      3'b010 : begin
        io_sample = io_waves_pwm;
      end
      3'b011 : begin
        io_sample = io_waves_tri;
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
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [22:0]   lfsr;
  wire                feedback;

  assign feedback = (lfsr[22] ^ lfsr[17]);
  assign io_sample = lfsr[22 : 7];
  always @(posedge io_clk24MHz or posedge io_reset) begin
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
  output wire [15:0]   io_waves_saw,
  output wire [15:0]   io_waves_square,
  output wire [15:0]   io_waves_pwm,
  output wire [15:0]   io_waves_tri
);

  wire       [23:0]   expandedPwm;
  reg        [22:0]   triReflected;
  wire                when_Generators_l32;

  assign io_waves_saw = (io_phase[23 : 8] ^ 16'h8000);
  assign io_waves_square = (io_phase[23] ? 16'h7fff : 16'h8000);
  assign expandedPwm = ({16'd0,io_pwmWidth} <<< 5'd16);
  assign io_waves_pwm = ((io_phase < expandedPwm) ? 16'h7fff : 16'h8000);
  assign when_Generators_l32 = (io_phase[23] == 1'b0);
  always @(*) begin
    if(when_Generators_l32) begin
      triReflected = io_phase[22 : 0];
    end else begin
      triReflected = (~ io_phase[22 : 0]);
    end
  end

  assign io_waves_tri = (triReflected[22 : 7] ^ 16'h8000);

endmodule

module Accumulator (
  input  wire          io_phaseTick,
  input  wire [23:0]   io_freqWord,
  output wire [23:0]   io_phase,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [23:0]   phaseReg;

  assign io_phase = phaseReg;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      phaseReg <= 24'h0;
    end else begin
      if(io_phaseTick) begin
        phaseReg <= (phaseReg + io_freqWord);
      end
    end
  end


endmodule

module RegisterBank (
  input  wire          io_regWrite_valid,
  input  wire [7:0]    io_regWrite_payload_address,
  input  wire [7:0]    io_regWrite_payload_data,
  output wire [23:0]   io_config_freqWord,
  output wire [2:0]    io_config_waveSelect,
  output wire [7:0]    io_config_pwmWidth,
  output wire [7:0]    io_config_volume,
  output wire [7:0]    io_envConfig_ctrl,
  output wire [7:0]    io_envConfig_attack,
  output wire [7:0]    io_envConfig_decay,
  output wire [7:0]    io_envConfig_sustain,
  output wire [7:0]    io_envConfig_release,
  output wire [7:0]    io_envConfig_gate,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [7:0]    freqLowReg;
  reg        [7:0]    freqMidReg;
  reg        [7:0]    freqHighReg;
  reg        [7:0]    freqLowShadow;
  reg        [7:0]    freqMidShadow;
  reg        [7:0]    waveformReg;
  reg        [7:0]    pulseWidthReg;
  reg        [7:0]    volumeReg;
  reg        [7:0]    envCtrlReg;
  reg        [7:0]    envAttackReg;
  reg        [7:0]    envDecayReg;
  reg        [7:0]    envSustainReg;
  reg        [7:0]    envReleaseReg;
  reg        [7:0]    envGateReg;
  wire       [23:0]   frequencyCombined;
  reg        [23:0]   oscFrequencyReg;
  reg        [7:0]    oscWaveformReg;
  reg        [7:0]    oscPulseWidthReg;
  reg        [7:0]    oscVolumeReg;
  reg        [7:0]    syncedEnvCtrl;
  reg        [7:0]    syncedEnvAttack;
  reg        [7:0]    syncedEnvDecay;
  reg        [7:0]    syncedEnvSustain;
  reg        [7:0]    syncedEnvRelease;
  reg        [7:0]    syncedEnvGate;

  assign frequencyCombined = {{freqHighReg,freqMidReg},freqLowReg};
  assign io_config_freqWord = oscFrequencyReg;
  assign io_config_waveSelect = oscWaveformReg[2 : 0];
  assign io_config_pwmWidth = oscPulseWidthReg;
  assign io_config_volume = oscVolumeReg;
  assign io_envConfig_ctrl = syncedEnvCtrl;
  assign io_envConfig_attack = syncedEnvAttack;
  assign io_envConfig_decay = syncedEnvDecay;
  assign io_envConfig_sustain = syncedEnvSustain;
  assign io_envConfig_release = syncedEnvRelease;
  assign io_envConfig_gate = syncedEnvGate;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      freqLowReg <= 8'h0;
      freqMidReg <= 8'h0;
      freqHighReg <= 8'h0;
      freqLowShadow <= 8'h0;
      freqMidShadow <= 8'h0;
      waveformReg <= 8'h0;
      pulseWidthReg <= 8'h0;
      volumeReg <= 8'h0;
      envCtrlReg <= 8'h0;
      envAttackReg <= 8'h0;
      envDecayReg <= 8'h0;
      envSustainReg <= 8'h0;
      envReleaseReg <= 8'h0;
      envGateReg <= 8'h0;
      oscFrequencyReg <= 24'h0;
      oscWaveformReg <= 8'h0;
      oscPulseWidthReg <= 8'h0;
      oscVolumeReg <= 8'h0;
      syncedEnvCtrl <= 8'h0;
      syncedEnvAttack <= 8'h0;
      syncedEnvDecay <= 8'h0;
      syncedEnvSustain <= 8'h0;
      syncedEnvRelease <= 8'h0;
      syncedEnvGate <= 8'h0;
    end else begin
      if(io_regWrite_valid) begin
        case(io_regWrite_payload_address)
          8'h0 : begin
            freqLowShadow <= io_regWrite_payload_data;
          end
          8'h01 : begin
            freqMidShadow <= io_regWrite_payload_data;
          end
          8'h02 : begin
            freqHighReg <= io_regWrite_payload_data;
            freqMidReg <= freqMidShadow;
            freqLowReg <= freqLowShadow;
          end
          8'h03 : begin
            waveformReg <= io_regWrite_payload_data;
          end
          8'h04 : begin
            pulseWidthReg <= io_regWrite_payload_data;
          end
          8'h05 : begin
            volumeReg <= io_regWrite_payload_data;
          end
          8'h40 : begin
            envCtrlReg <= io_regWrite_payload_data;
          end
          8'h41 : begin
            envAttackReg <= io_regWrite_payload_data;
          end
          8'h42 : begin
            envDecayReg <= io_regWrite_payload_data;
          end
          8'h43 : begin
            envSustainReg <= io_regWrite_payload_data;
          end
          8'h44 : begin
            envReleaseReg <= io_regWrite_payload_data;
          end
          8'h45 : begin
            envGateReg <= io_regWrite_payload_data;
          end
          default : begin
          end
        endcase
      end
      oscFrequencyReg <= frequencyCombined;
      oscWaveformReg <= waveformReg;
      oscPulseWidthReg <= pulseWidthReg;
      oscVolumeReg <= volumeReg;
      syncedEnvCtrl <= envCtrlReg;
      syncedEnvAttack <= envAttackReg;
      syncedEnvDecay <= envDecayReg;
      syncedEnvSustain <= envSustainReg;
      syncedEnvRelease <= envReleaseReg;
      syncedEnvGate <= envGateReg;
    end
  end


endmodule

module UartProtocolDecoder (
  input  wire          io_rxByte_valid,
  input  wire [7:0]    io_rxByte_payload,
  output wire          io_regWrite_valid,
  output wire [7:0]    io_regWrite_payload_address,
  output wire [7:0]    io_regWrite_payload_data,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam fsm_BOOT = 2'd0;
  localparam fsm_WAIT_CMD = 2'd1;
  localparam fsm_WAIT_ADDR = 2'd2;
  localparam fsm_WAIT_DATA = 2'd3;

  reg        [7:0]    writeAddressReg;
  reg        [7:0]    writeDataReg;
  reg                 writeEnableReg;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [7:0]    fsm_addressBuffer;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_UartProtocolDecoder_l38;
  `ifndef SYNTHESIS
  reg [71:0] fsm_stateReg_string;
  reg [71:0] fsm_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_BOOT : fsm_stateReg_string = "BOOT     ";
      fsm_WAIT_CMD : fsm_stateReg_string = "WAIT_CMD ";
      fsm_WAIT_ADDR : fsm_stateReg_string = "WAIT_ADDR";
      fsm_WAIT_DATA : fsm_stateReg_string = "WAIT_DATA";
      default : fsm_stateReg_string = "?????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_BOOT : fsm_stateNext_string = "BOOT     ";
      fsm_WAIT_CMD : fsm_stateNext_string = "WAIT_CMD ";
      fsm_WAIT_ADDR : fsm_stateNext_string = "WAIT_ADDR";
      fsm_WAIT_DATA : fsm_stateNext_string = "WAIT_DATA";
      default : fsm_stateNext_string = "?????????";
    endcase
  end
  `endif

  assign io_regWrite_payload_address = writeAddressReg;
  assign io_regWrite_payload_data = writeDataReg;
  assign io_regWrite_valid = writeEnableReg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_WAIT_CMD : begin
      end
      fsm_WAIT_ADDR : begin
      end
      fsm_WAIT_DATA : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_WAIT_CMD : begin
        if(io_rxByte_valid) begin
          if(when_UartProtocolDecoder_l38) begin
            fsm_stateNext = fsm_WAIT_ADDR;
          end
        end
      end
      fsm_WAIT_ADDR : begin
        if(io_rxByte_valid) begin
          fsm_stateNext = fsm_WAIT_DATA;
        end
      end
      fsm_WAIT_DATA : begin
        if(io_rxByte_valid) begin
          fsm_stateNext = fsm_WAIT_CMD;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_WAIT_CMD;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_BOOT;
    end
  end

  assign when_UartProtocolDecoder_l38 = (io_rxByte_payload == 8'h01);
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      writeAddressReg <= 8'h0;
      writeDataReg <= 8'h0;
      writeEnableReg <= 1'b0;
      fsm_addressBuffer <= 8'h0;
      fsm_stateReg <= fsm_BOOT;
    end else begin
      writeEnableReg <= 1'b0;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_WAIT_CMD : begin
        end
        fsm_WAIT_ADDR : begin
          if(io_rxByte_valid) begin
            fsm_addressBuffer <= io_rxByte_payload;
          end
        end
        fsm_WAIT_DATA : begin
          if(io_rxByte_valid) begin
            writeAddressReg <= fsm_addressBuffer;
            writeDataReg <= io_rxByte_payload;
            writeEnableReg <= 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module UartRx (
  input  wire          io_rx,
  output wire          io_byteOut_valid,
  output wire [7:0]    io_byteOut_payload,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire       [2:0]    frameConfig_dataLength;
  wire       [0:0]    frameConfig_stop;
  wire       [1:0]    frameConfig_parity;
  `ifndef SYNTHESIS
  reg [23:0] frameConfig_stop_string;
  reg [31:0] frameConfig_parity_string;
  `endif


  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength (frameConfig_dataLength[2:0]    ), //i
    .io_config_frame_stop       (frameConfig_stop               ), //i
    .io_config_frame_parity     (frameConfig_parity[1:0]        ), //i
    .io_config_clockDivider     (20'h0001a                      ), //i
    .io_write_valid             (                               ), //i
    .io_write_ready             (uartCtrl_1_io_write_ready      ), //o
    .io_write_payload           (                               ), //i
    .io_read_valid              (uartCtrl_1_io_read_valid       ), //o
    .io_read_ready              (1'b1                           ), //i
    .io_read_payload            (uartCtrl_1_io_read_payload[7:0]), //o
    .io_uart_txd                (uartCtrl_1_io_uart_txd         ), //o
    .io_uart_rxd                (io_rx                          ), //i
    .io_readError               (uartCtrl_1_io_readError        ), //o
    .io_writeBreak              (                               ), //i
    .io_readBreak               (uartCtrl_1_io_readBreak        ), //o
    .io_clk24MHz                (io_clk24MHz                    ), //i
    .io_reset                   (io_reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(frameConfig_stop)
      UartStopType_ONE : frameConfig_stop_string = "ONE";
      UartStopType_TWO : frameConfig_stop_string = "TWO";
      default : frameConfig_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(frameConfig_parity)
      UartParityType_NONE : frameConfig_parity_string = "NONE";
      UartParityType_EVEN : frameConfig_parity_string = "EVEN";
      UartParityType_ODD : frameConfig_parity_string = "ODD ";
      default : frameConfig_parity_string = "????";
    endcase
  end
  `endif

  assign frameConfig_dataLength = 3'b111;
  assign frameConfig_parity = UartParityType_NONE;
  assign frameConfig_stop = UartStopType_ONE;
  assign io_byteOut_payload = uartCtrl_1_io_read_payload;
  assign io_byteOut_valid = uartCtrl_1_io_read_valid;

endmodule

module UartCtrl (
  input  wire [2:0]    io_config_frame_dataLength,
  input  wire [0:0]    io_config_frame_stop,
  input  wire [1:0]    io_config_frame_parity,
  input  wire [19:0]   io_config_clockDivider,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  output wire          io_readError,
  input  wire          io_writeBreak,
  output wire          io_readBreak,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 clockDivider_tickReg;
  reg                 io_write_throwWhen_valid;
  wire                io_write_throwWhen_ready;
  wire       [7:0]    io_write_throwWhen_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop       (io_config_frame_stop           ), //i
    .io_configFrame_parity     (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick           (clockDivider_tickReg           ), //i
    .io_write_valid            (io_write_throwWhen_valid       ), //i
    .io_write_ready            (tx_io_write_ready              ), //o
    .io_write_payload          (io_write_throwWhen_payload[7:0]), //i
    .io_cts                    (1'b0                           ), //i
    .io_txd                    (tx_io_txd                      ), //o
    .io_break                  (io_writeBreak                  ), //i
    .io_clk24MHz               (io_clk24MHz                    ), //i
    .io_reset                  (io_reset                       )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop       (io_config_frame_stop           ), //i
    .io_configFrame_parity     (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick           (clockDivider_tickReg           ), //i
    .io_read_valid             (rx_io_read_valid               ), //o
    .io_read_ready             (io_read_ready                  ), //i
    .io_read_payload           (rx_io_read_payload[7:0]        ), //o
    .io_rxd                    (io_uart_rxd                    ), //i
    .io_rts                    (rx_io_rts                      ), //o
    .io_error                  (rx_io_error                    ), //o
    .io_break                  (rx_io_break                    ), //o
    .io_clk24MHz               (io_clk24MHz                    ), //i
    .io_reset                  (io_reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      UartStopType_ONE : io_config_frame_stop_string = "ONE";
      UartStopType_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      UartParityType_NONE : io_config_frame_parity_string = "NONE";
      UartParityType_EVEN : io_config_frame_parity_string = "EVEN";
      UartParityType_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_throwWhen_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_throwWhen_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_throwWhen_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_throwWhen_payload = io_write_payload;
  assign io_write_throwWhen_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      clockDivider_counter <= 20'h0;
      clockDivider_tickReg <= 1'b0;
    end else begin
      clockDivider_tickReg <= clockDivider_tick;
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module UartCtrlRx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  input  wire          io_rxd,
  output wire          io_rts,
  output reg           io_error,
  output wire          io_break,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlRxState_IDLE = 3'd0;
  localparam UartCtrlRxState_START = 3'd1;
  localparam UartCtrlRxState_DATA = 3'd2;
  localparam UartCtrlRxState_PARITY = 3'd3;
  localparam UartCtrlRxState_STOP = 3'd4;

  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  (* keep_hierarchy = "TRUE" *) BufferCC io_rxd_buffercc (
    .io_dataIn   (io_rxd                    ), //i
    .io_dataOut  (io_rxd_buffercc_io_dataOut), //o
    .io_clk24MHz (io_clk24MHz               ), //i
    .io_reset    (io_reset                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlRxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlRxState_START : stateMachine_state_string = "START ";
      UartCtrlRxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlRxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlRxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h68);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= UartCtrlRxState_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        UartCtrlRxState_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= UartCtrlRxState_START;
          end
        end
        UartCtrlRxState_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        UartCtrlRxState_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= UartCtrlRxState_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= UartCtrlRxState_PARITY;
              end
            end
          end
        end
        UartCtrlRxState_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= UartCtrlRxState_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= UartCtrlRxState_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge io_clk24MHz) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b010;
        end
      end
      UartCtrlRxState_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
        end
      end
      UartCtrlRxState_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  input  wire          io_cts,
  output wire          io_txd,
  input  wire          io_break,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlTxState_IDLE = 3'd0;
  localparam UartCtrlTxState_START = 3'd1;
  localparam UartCtrlTxState_DATA = 3'd2;
  localparam UartCtrlTxState_PARITY = 3'd3;
  localparam UartCtrlTxState_STOP = 3'd4;

  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  wire       [2:0]    _zz_stateMachine_state;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  reg [47:0] _zz_stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlTxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_stateMachine_state)
      UartCtrlTxState_IDLE : _zz_stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : _zz_stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : _zz_stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : _zz_stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : _zz_stateMachine_state_string = "STOP  ";
      default : _zz_stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        stateMachine_txd = 1'b0;
      end
      UartCtrlTxState_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      UartCtrlTxState_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign _zz_stateMachine_state = (io_write_valid ? UartCtrlTxState_START : UartCtrlTxState_IDLE);
  assign io_txd = _zz_io_txd;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= UartCtrlTxState_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        UartCtrlTxState_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= UartCtrlTxState_START;
          end
        end
        UartCtrlTxState_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_DATA;
          end
        end
        UartCtrlTxState_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= UartCtrlTxState_STOP;
              end else begin
                stateMachine_state <= UartCtrlTxState_PARITY;
              end
            end
          end
        end
        UartCtrlTxState_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= _zz_stateMachine_state;
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge io_clk24MHz) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
