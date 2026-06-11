// Generator : SpinalHDL v1.14.0    git head : 95a5e6c65c54acfc4707c8fe6ef8b5d297cfcbde
// Component : Synth
// Git hash  : 4fe52c106e225f33b564a449f65aca787eb372ec

`timescale 1ns/1ps

module Synth (
  input  wire          io_clk24MHz,
  input  wire          io_reset,
  input  wire          io_uartRx,
  output wire          io_i2sBclk,
  output wire          io_i2sLrclk,
  output wire          io_i2sData
);

  wire       [23:0]   core_uart_io_voiceConfig_osc_freqWord;
  wire       [2:0]    core_uart_io_voiceConfig_osc_waveSelect;
  wire       [7:0]    core_uart_io_voiceConfig_osc_pwmWidth;
  wire       [7:0]    core_uart_io_voiceConfig_osc_volume;
  wire       [7:0]    core_uart_io_voiceConfig_env_ctrl;
  wire       [7:0]    core_uart_io_voiceConfig_env_attack;
  wire       [7:0]    core_uart_io_voiceConfig_env_decay;
  wire       [7:0]    core_uart_io_voiceConfig_env_sustain;
  wire       [7:0]    core_uart_io_voiceConfig_env_release;
  wire       [7:0]    core_uart_io_voiceConfig_env_gate;
  wire       [7:0]    core_uart_io_voiceConfig_filter_ctrl;
  wire       [1:0]    core_uart_io_voiceConfig_filter_mode;
  wire       [7:0]    core_uart_io_voiceConfig_filter_cutoff;
  wire       [7:0]    core_uart_io_voiceConfig_filter_resonance;
  wire                core_timingGen_io_phaseTick;
  wire                core_timingGen_io_sampleTick;
  wire                core_voice_io_sampleOut_valid;
  wire       [15:0]   core_voice_io_sampleOut_payload;
  wire                core_decimator_io_sampleOut_valid;
  wire       [15:0]   core_decimator_io_sampleOut_payload;
  wire                core_transmitter_io_bclk;
  wire                core_transmitter_io_lrclk;
  wire                core_transmitter_io_sdata;

  Uart core_uart (
    .io_rx                           (io_uartRx                                     ), //i
    .io_voiceConfig_osc_freqWord     (core_uart_io_voiceConfig_osc_freqWord[23:0]   ), //o
    .io_voiceConfig_osc_waveSelect   (core_uart_io_voiceConfig_osc_waveSelect[2:0]  ), //o
    .io_voiceConfig_osc_pwmWidth     (core_uart_io_voiceConfig_osc_pwmWidth[7:0]    ), //o
    .io_voiceConfig_osc_volume       (core_uart_io_voiceConfig_osc_volume[7:0]      ), //o
    .io_voiceConfig_env_ctrl         (core_uart_io_voiceConfig_env_ctrl[7:0]        ), //o
    .io_voiceConfig_env_attack       (core_uart_io_voiceConfig_env_attack[7:0]      ), //o
    .io_voiceConfig_env_decay        (core_uart_io_voiceConfig_env_decay[7:0]       ), //o
    .io_voiceConfig_env_sustain      (core_uart_io_voiceConfig_env_sustain[7:0]     ), //o
    .io_voiceConfig_env_release      (core_uart_io_voiceConfig_env_release[7:0]     ), //o
    .io_voiceConfig_env_gate         (core_uart_io_voiceConfig_env_gate[7:0]        ), //o
    .io_voiceConfig_filter_ctrl      (core_uart_io_voiceConfig_filter_ctrl[7:0]     ), //o
    .io_voiceConfig_filter_mode      (core_uart_io_voiceConfig_filter_mode[1:0]     ), //o
    .io_voiceConfig_filter_cutoff    (core_uart_io_voiceConfig_filter_cutoff[7:0]   ), //o
    .io_voiceConfig_filter_resonance (core_uart_io_voiceConfig_filter_resonance[7:0]), //o
    .io_clk24MHz                     (io_clk24MHz                                   ), //i
    .io_reset                        (io_reset                                      )  //i
  );
  TimingGenerator core_timingGen (
    .io_phaseTick  (core_timingGen_io_phaseTick ), //o
    .io_sampleTick (core_timingGen_io_sampleTick), //o
    .io_clk24MHz   (io_clk24MHz                 ), //i
    .io_reset      (io_reset                    )  //i
  );
  Voice core_voice (
    .io_phaseTick               (core_timingGen_io_phaseTick                   ), //i
    .io_syncIn                  (1'b0                                          ), //i
    .io_config_osc_freqWord     (core_uart_io_voiceConfig_osc_freqWord[23:0]   ), //i
    .io_config_osc_waveSelect   (core_uart_io_voiceConfig_osc_waveSelect[2:0]  ), //i
    .io_config_osc_pwmWidth     (core_uart_io_voiceConfig_osc_pwmWidth[7:0]    ), //i
    .io_config_osc_volume       (core_uart_io_voiceConfig_osc_volume[7:0]      ), //i
    .io_config_env_ctrl         (core_uart_io_voiceConfig_env_ctrl[7:0]        ), //i
    .io_config_env_attack       (core_uart_io_voiceConfig_env_attack[7:0]      ), //i
    .io_config_env_decay        (core_uart_io_voiceConfig_env_decay[7:0]       ), //i
    .io_config_env_sustain      (core_uart_io_voiceConfig_env_sustain[7:0]     ), //i
    .io_config_env_release      (core_uart_io_voiceConfig_env_release[7:0]     ), //i
    .io_config_env_gate         (core_uart_io_voiceConfig_env_gate[7:0]        ), //i
    .io_config_filter_ctrl      (core_uart_io_voiceConfig_filter_ctrl[7:0]     ), //i
    .io_config_filter_mode      (core_uart_io_voiceConfig_filter_mode[1:0]     ), //i
    .io_config_filter_cutoff    (core_uart_io_voiceConfig_filter_cutoff[7:0]   ), //i
    .io_config_filter_resonance (core_uart_io_voiceConfig_filter_resonance[7:0]), //i
    .io_sampleOut_valid         (core_voice_io_sampleOut_valid                 ), //o
    .io_sampleOut_payload       (core_voice_io_sampleOut_payload[15:0]         ), //o
    .io_reset                   (io_reset                                      ), //i
    .io_clk24MHz                (io_clk24MHz                                   )  //i
  );
  Decimator core_decimator (
    .io_sampleTick        (core_timingGen_io_sampleTick             ), //i
    .io_sampleIn_valid    (core_voice_io_sampleOut_valid            ), //i
    .io_sampleIn_payload  (core_voice_io_sampleOut_payload[15:0]    ), //i
    .io_sampleOut_valid   (core_decimator_io_sampleOut_valid        ), //o
    .io_sampleOut_payload (core_decimator_io_sampleOut_payload[15:0]), //o
    .io_clk24MHz          (io_clk24MHz                              ), //i
    .io_reset             (io_reset                                 )  //i
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
  assign io_i2sBclk = core_transmitter_io_bclk;
  assign io_i2sLrclk = core_transmitter_io_lrclk;
  assign io_i2sData = core_transmitter_io_sdata;

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

module Voice (
  input  wire          io_phaseTick,
  input  wire          io_syncIn,
  input  wire [23:0]   io_config_osc_freqWord,
  input  wire [2:0]    io_config_osc_waveSelect,
  input  wire [7:0]    io_config_osc_pwmWidth,
  input  wire [7:0]    io_config_osc_volume,
  input  wire [7:0]    io_config_env_ctrl,
  input  wire [7:0]    io_config_env_attack,
  input  wire [7:0]    io_config_env_decay,
  input  wire [7:0]    io_config_env_sustain,
  input  wire [7:0]    io_config_env_release,
  input  wire [7:0]    io_config_env_gate,
  input  wire [7:0]    io_config_filter_ctrl,
  input  wire [1:0]    io_config_filter_mode,
  input  wire [7:0]    io_config_filter_cutoff,
  input  wire [7:0]    io_config_filter_resonance,
  output wire          io_sampleOut_valid,
  output wire [15:0]   io_sampleOut_payload,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);

  wire       [9:0]    envAttenuator_io_volume;
  wire                osc_io_sample_valid;
  wire       [15:0]   osc_io_sample_payload;
  wire                envGen_io_envelopeOut_valid;
  wire       [9:0]    envGen_io_envelopeOut_payload;
  wire                envGen_io_envelopeOutSigned_valid;
  wire       [9:0]    envGen_io_envelopeOutSigned_payload;
  wire                envAttenuator_io_sampleOut_valid;
  wire       [15:0]   envAttenuator_io_sampleOut_payload;
  wire                attenuator_2_io_sampleOut_valid;
  wire       [15:0]   attenuator_2_io_sampleOut_payload;
  wire                svf_1_io_sampleOut_valid;
  wire       [15:0]   svf_1_io_sampleOut_payload;
  wire                envBypassed;
  wire                filterBypassed;

  Oscillator osc (
    .io_phaseTick         (io_phaseTick                 ), //i
    .io_config_freqWord   (io_config_osc_freqWord[23:0] ), //i
    .io_config_waveSelect (io_config_osc_waveSelect[2:0]), //i
    .io_config_pwmWidth   (io_config_osc_pwmWidth[7:0]  ), //i
    .io_config_volume     (io_config_osc_volume[7:0]    ), //i
    .io_sample_valid      (osc_io_sample_valid          ), //o
    .io_sample_payload    (osc_io_sample_payload[15:0]  ), //o
    .io_clk24MHz          (io_clk24MHz                  ), //i
    .io_reset             (io_reset                     )  //i
  );
  EnvelopeGenerator envGen (
    .io_phaseTick                 (io_phaseTick                            ), //i
    .io_syncIn                    (io_syncIn                               ), //i
    .io_config_ctrl               (io_config_env_ctrl[7:0]                 ), //i
    .io_config_attack             (io_config_env_attack[7:0]               ), //i
    .io_config_decay              (io_config_env_decay[7:0]                ), //i
    .io_config_sustain            (io_config_env_sustain[7:0]              ), //i
    .io_config_release            (io_config_env_release[7:0]              ), //i
    .io_config_gate               (io_config_env_gate[7:0]                 ), //i
    .io_envelopeOut_valid         (envGen_io_envelopeOut_valid             ), //o
    .io_envelopeOut_payload       (envGen_io_envelopeOut_payload[9:0]      ), //o
    .io_envelopeOutSigned_valid   (envGen_io_envelopeOutSigned_valid       ), //o
    .io_envelopeOutSigned_payload (envGen_io_envelopeOutSigned_payload[9:0]), //o
    .io_reset                     (io_reset                                ), //i
    .io_clk24MHz                  (io_clk24MHz                             )  //i
  );
  Attenuator envAttenuator (
    .io_sampleIn_valid    (osc_io_sample_valid                     ), //i
    .io_sampleIn_payload  (osc_io_sample_payload[15:0]             ), //i
    .io_volume            (envAttenuator_io_volume[9:0]            ), //i
    .io_phaseTick         (io_phaseTick                            ), //i
    .io_sampleOut_valid   (envAttenuator_io_sampleOut_valid        ), //o
    .io_sampleOut_payload (envAttenuator_io_sampleOut_payload[15:0]), //o
    .io_reset             (io_reset                                ), //i
    .io_clk24MHz          (io_clk24MHz                             )  //i
  );
  Attenuator_1 attenuator_2 (
    .io_sampleIn_valid    (envAttenuator_io_sampleOut_valid        ), //i
    .io_sampleIn_payload  (envAttenuator_io_sampleOut_payload[15:0]), //i
    .io_volume            (io_config_osc_volume[7:0]               ), //i
    .io_phaseTick         (io_phaseTick                            ), //i
    .io_sampleOut_valid   (attenuator_2_io_sampleOut_valid         ), //o
    .io_sampleOut_payload (attenuator_2_io_sampleOut_payload[15:0] ), //o
    .io_reset             (io_reset                                ), //i
    .io_clk24MHz          (io_clk24MHz                             )  //i
  );
  SVF svf_1 (
    .io_phaseTick         (io_phaseTick                           ), //i
    .io_config_ctrl       (io_config_filter_ctrl[7:0]             ), //i
    .io_config_mode       (io_config_filter_mode[1:0]             ), //i
    .io_config_cutoff     (io_config_filter_cutoff[7:0]           ), //i
    .io_config_resonance  (io_config_filter_resonance[7:0]        ), //i
    .io_sampleIn_valid    (attenuator_2_io_sampleOut_valid        ), //i
    .io_sampleIn_payload  (attenuator_2_io_sampleOut_payload[15:0]), //i
    .io_sampleOut_valid   (svf_1_io_sampleOut_valid               ), //o
    .io_sampleOut_payload (svf_1_io_sampleOut_payload[15:0]       ), //o
    .io_reset             (io_reset                               ), //i
    .io_clk24MHz          (io_clk24MHz                            )  //i
  );
  assign envBypassed = io_config_env_ctrl[1];
  assign envAttenuator_io_volume = (envBypassed ? 10'h3ff : envGen_io_envelopeOut_payload);
  assign filterBypassed = io_config_filter_ctrl[1];
  assign io_sampleOut_valid = (filterBypassed ? attenuator_2_io_sampleOut_valid : svf_1_io_sampleOut_valid);
  assign io_sampleOut_payload = (filterBypassed ? attenuator_2_io_sampleOut_payload : svf_1_io_sampleOut_payload);

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
  output wire [23:0]   io_voiceConfig_osc_freqWord,
  output wire [2:0]    io_voiceConfig_osc_waveSelect,
  output wire [7:0]    io_voiceConfig_osc_pwmWidth,
  output wire [7:0]    io_voiceConfig_osc_volume,
  output wire [7:0]    io_voiceConfig_env_ctrl,
  output wire [7:0]    io_voiceConfig_env_attack,
  output wire [7:0]    io_voiceConfig_env_decay,
  output wire [7:0]    io_voiceConfig_env_sustain,
  output wire [7:0]    io_voiceConfig_env_release,
  output wire [7:0]    io_voiceConfig_env_gate,
  output wire [7:0]    io_voiceConfig_filter_ctrl,
  output wire [1:0]    io_voiceConfig_filter_mode,
  output wire [7:0]    io_voiceConfig_filter_cutoff,
  output wire [7:0]    io_voiceConfig_filter_resonance,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  wire                rxModule_io_byteOut_valid;
  wire       [7:0]    rxModule_io_byteOut_payload;
  wire                protocolDecoder_io_regWrite_valid;
  wire       [7:0]    protocolDecoder_io_regWrite_payload_address;
  wire       [7:0]    protocolDecoder_io_regWrite_payload_data;
  wire       [23:0]   registerBank_1_io_voiceConfig_osc_freqWord;
  wire       [2:0]    registerBank_1_io_voiceConfig_osc_waveSelect;
  wire       [7:0]    registerBank_1_io_voiceConfig_osc_pwmWidth;
  wire       [7:0]    registerBank_1_io_voiceConfig_osc_volume;
  wire       [7:0]    registerBank_1_io_voiceConfig_env_ctrl;
  wire       [7:0]    registerBank_1_io_voiceConfig_env_attack;
  wire       [7:0]    registerBank_1_io_voiceConfig_env_decay;
  wire       [7:0]    registerBank_1_io_voiceConfig_env_sustain;
  wire       [7:0]    registerBank_1_io_voiceConfig_env_release;
  wire       [7:0]    registerBank_1_io_voiceConfig_env_gate;
  wire       [7:0]    registerBank_1_io_voiceConfig_filter_ctrl;
  wire       [1:0]    registerBank_1_io_voiceConfig_filter_mode;
  wire       [7:0]    registerBank_1_io_voiceConfig_filter_cutoff;
  wire       [7:0]    registerBank_1_io_voiceConfig_filter_resonance;

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
    .io_regWrite_valid               (protocolDecoder_io_regWrite_valid                  ), //i
    .io_regWrite_payload_address     (protocolDecoder_io_regWrite_payload_address[7:0]   ), //i
    .io_regWrite_payload_data        (protocolDecoder_io_regWrite_payload_data[7:0]      ), //i
    .io_voiceConfig_osc_freqWord     (registerBank_1_io_voiceConfig_osc_freqWord[23:0]   ), //o
    .io_voiceConfig_osc_waveSelect   (registerBank_1_io_voiceConfig_osc_waveSelect[2:0]  ), //o
    .io_voiceConfig_osc_pwmWidth     (registerBank_1_io_voiceConfig_osc_pwmWidth[7:0]    ), //o
    .io_voiceConfig_osc_volume       (registerBank_1_io_voiceConfig_osc_volume[7:0]      ), //o
    .io_voiceConfig_env_ctrl         (registerBank_1_io_voiceConfig_env_ctrl[7:0]        ), //o
    .io_voiceConfig_env_attack       (registerBank_1_io_voiceConfig_env_attack[7:0]      ), //o
    .io_voiceConfig_env_decay        (registerBank_1_io_voiceConfig_env_decay[7:0]       ), //o
    .io_voiceConfig_env_sustain      (registerBank_1_io_voiceConfig_env_sustain[7:0]     ), //o
    .io_voiceConfig_env_release      (registerBank_1_io_voiceConfig_env_release[7:0]     ), //o
    .io_voiceConfig_env_gate         (registerBank_1_io_voiceConfig_env_gate[7:0]        ), //o
    .io_voiceConfig_filter_ctrl      (registerBank_1_io_voiceConfig_filter_ctrl[7:0]     ), //o
    .io_voiceConfig_filter_mode      (registerBank_1_io_voiceConfig_filter_mode[1:0]     ), //o
    .io_voiceConfig_filter_cutoff    (registerBank_1_io_voiceConfig_filter_cutoff[7:0]   ), //o
    .io_voiceConfig_filter_resonance (registerBank_1_io_voiceConfig_filter_resonance[7:0]), //o
    .io_clk24MHz                     (io_clk24MHz                                        ), //i
    .io_reset                        (io_reset                                           )  //i
  );
  assign io_voiceConfig_osc_freqWord = registerBank_1_io_voiceConfig_osc_freqWord;
  assign io_voiceConfig_osc_waveSelect = registerBank_1_io_voiceConfig_osc_waveSelect;
  assign io_voiceConfig_osc_pwmWidth = registerBank_1_io_voiceConfig_osc_pwmWidth;
  assign io_voiceConfig_osc_volume = registerBank_1_io_voiceConfig_osc_volume;
  assign io_voiceConfig_env_ctrl = registerBank_1_io_voiceConfig_env_ctrl;
  assign io_voiceConfig_env_attack = registerBank_1_io_voiceConfig_env_attack;
  assign io_voiceConfig_env_decay = registerBank_1_io_voiceConfig_env_decay;
  assign io_voiceConfig_env_sustain = registerBank_1_io_voiceConfig_env_sustain;
  assign io_voiceConfig_env_release = registerBank_1_io_voiceConfig_env_release;
  assign io_voiceConfig_env_gate = registerBank_1_io_voiceConfig_env_gate;
  assign io_voiceConfig_filter_ctrl = registerBank_1_io_voiceConfig_filter_ctrl;
  assign io_voiceConfig_filter_mode = registerBank_1_io_voiceConfig_filter_mode;
  assign io_voiceConfig_filter_cutoff = registerBank_1_io_voiceConfig_filter_cutoff;
  assign io_voiceConfig_filter_resonance = registerBank_1_io_voiceConfig_filter_resonance;

endmodule

module SVF (
  input  wire          io_phaseTick,
  input  wire [7:0]    io_config_ctrl,
  input  wire [1:0]    io_config_mode,
  input  wire [7:0]    io_config_cutoff,
  input  wire [7:0]    io_config_resonance,
  input  wire          io_sampleIn_valid,
  input  wire [15:0]   io_sampleIn_payload,
  output wire          io_sampleOut_valid,
  output wire [15:0]   io_sampleOut_payload,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);

  wire       [11:0]   mapper_io_cutoffCoeff;
  wire       [7:0]    mapper_io_resonanceCoeff;
  wire       [23:0]   core_io_lp;
  wire       [23:0]   core_io_bp;
  wire       [23:0]   core_io_hp;
  wire                core_io_done;
  wire       [15:0]   mux_io_sampleOut;
  wire                disable_1;
  wire                bypass;
  reg        [15:0]   outReg;

  ParameterMapper mapper (
    .io_cutoff         (io_config_cutoff[7:0]        ), //i
    .io_resonance      (io_config_resonance[7:0]     ), //i
    .io_cutoffCoeff    (mapper_io_cutoffCoeff[11:0]  ), //o
    .io_resonanceCoeff (mapper_io_resonanceCoeff[7:0])  //o
  );
  FilterCore core (
    .io_phaseTick      (io_phaseTick                 ), //i
    .io_clear          (disable_1                    ), //i
    .io_sampleIn       (io_sampleIn_payload[15:0]    ), //i
    .io_cutoffCoeff    (mapper_io_cutoffCoeff[11:0]  ), //i
    .io_resonanceCoeff (mapper_io_resonanceCoeff[7:0]), //i
    .io_lp             (core_io_lp[23:0]             ), //o
    .io_bp             (core_io_bp[23:0]             ), //o
    .io_hp             (core_io_hp[23:0]             ), //o
    .io_done           (core_io_done                 ), //o
    .io_clk24MHz       (io_clk24MHz                  ), //i
    .io_reset          (io_reset                     )  //i
  );
  FilterMux mux (
    .io_mode      (io_config_mode[1:0]   ), //i
    .io_lp        (core_io_lp[23:0]      ), //i
    .io_bp        (core_io_bp[23:0]      ), //i
    .io_hp        (core_io_hp[23:0]      ), //i
    .io_sampleOut (mux_io_sampleOut[15:0])  //o
  );
  assign disable_1 = io_config_ctrl[0];
  assign bypass = io_config_ctrl[1];
  assign io_sampleOut_payload = ((! disable_1) ? outReg : 16'h0);
  assign io_sampleOut_valid = (io_phaseTick && (! io_reset));
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      outReg <= 16'h0;
    end else begin
      if(core_io_done) begin
        outReg <= mux_io_sampleOut;
      end
    end
  end


endmodule

module Attenuator_1 (
  input  wire          io_sampleIn_valid,
  input  wire [15:0]   io_sampleIn_payload,
  input  wire [7:0]    io_volume,
  input  wire          io_phaseTick,
  output wire          io_sampleOut_valid,
  output wire [15:0]   io_sampleOut_payload,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);

  wire       [16:0]   _zz_scaledSample;
  wire       [8:0]    volumeSigned;
  wire       [24:0]   product;
  wire       [15:0]   scaledSample;
  reg        [15:0]   outReg;
  reg                 validReg;

  assign _zz_scaledSample = (product >>> 4'd8);
  assign volumeSigned = {1'b0,io_volume};
  assign product = ($signed(io_sampleIn_payload) * $signed(volumeSigned));
  assign scaledSample = _zz_scaledSample[15:0];
  assign io_sampleOut_payload = outReg;
  assign io_sampleOut_valid = ((io_phaseTick && validReg) && (! io_reset));
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      outReg <= 16'h0;
      validReg <= 1'b0;
    end else begin
      if(io_sampleIn_valid) begin
        outReg <= scaledSample;
      end
      if(io_phaseTick) begin
        validReg <= io_sampleIn_valid;
      end
    end
  end


endmodule

module Attenuator (
  input  wire          io_sampleIn_valid,
  input  wire [15:0]   io_sampleIn_payload,
  input  wire [9:0]    io_volume,
  input  wire          io_phaseTick,
  output wire          io_sampleOut_valid,
  output wire [15:0]   io_sampleOut_payload,
  input  wire          io_reset,
  input  wire          io_clk24MHz
);

  wire       [16:0]   _zz_scaledSample;
  wire       [10:0]   volumeSigned;
  wire       [26:0]   product;
  wire       [15:0]   scaledSample;
  reg        [15:0]   outReg;
  reg                 validReg;

  assign _zz_scaledSample = (product >>> 4'd10);
  assign volumeSigned = {1'b0,io_volume};
  assign product = ($signed(io_sampleIn_payload) * $signed(volumeSigned));
  assign scaledSample = _zz_scaledSample[15:0];
  assign io_sampleOut_payload = outReg;
  assign io_sampleOut_valid = ((io_phaseTick && validReg) && (! io_reset));
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      outReg <= 16'h0;
      validReg <= 1'b0;
    end else begin
      if(io_sampleIn_valid) begin
        outReg <= scaledSample;
      end
      if(io_phaseTick) begin
        validReg <= io_sampleIn_valid;
      end
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

  wire                shaper_io_disable;
  wire                ctrl_io_resetAccum;
  wire                ctrl_io_runAccum;
  wire                ctrl_io_accumDir;
  wire       [21:0]   ctrl_io_phaseInc;
  wire       [1:0]    ctrl_io_curveSelect;
  wire       [2:0]    ctrl_io_activeStage;
  wire                accumulator_io_segmentDone;
  wire       [7:0]    accumulator_io_baseIndex;
  wire       [1:0]    accumulator_io_fraction;
  wire                shaper_io_envelopeOut_valid;
  wire       [9:0]    shaper_io_envelopeOut_payload;
  wire                shaper_io_envelopeOutSigned_valid;
  wire       [9:0]    shaper_io_envelopeOutSigned_payload;

  EnvelopeCtrl ctrl (
    .io_syncIn         (io_syncIn                 ), //i
    .io_config_ctrl    (io_config_ctrl[7:0]       ), //i
    .io_config_attack  (io_config_attack[7:0]     ), //i
    .io_config_decay   (io_config_decay[7:0]      ), //i
    .io_config_sustain (io_config_sustain[7:0]    ), //i
    .io_config_release (io_config_release[7:0]    ), //i
    .io_config_gate    (io_config_gate[7:0]       ), //i
    .io_segmentDone    (accumulator_io_segmentDone), //i
    .io_resetAccum     (ctrl_io_resetAccum        ), //o
    .io_runAccum       (ctrl_io_runAccum          ), //o
    .io_accumDir       (ctrl_io_accumDir          ), //o
    .io_phaseInc       (ctrl_io_phaseInc[21:0]    ), //o
    .io_curveSelect    (ctrl_io_curveSelect[1:0]  ), //o
    .io_activeStage    (ctrl_io_activeStage[2:0]  ), //o
    .io_reset          (io_reset                  ), //i
    .io_clk24MHz       (io_clk24MHz               )  //i
  );
  EnvelopeAccumulator accumulator (
    .io_resetAccum   (ctrl_io_resetAccum           ), //i
    .io_runAccum     (ctrl_io_runAccum             ), //i
    .io_accumDir     (ctrl_io_accumDir             ), //i
    .io_phaseInc     (ctrl_io_phaseInc[21:0]       ), //i
    .io_sustainLevel (io_config_sustain[7:0]       ), //i
    .io_activeStage  (ctrl_io_activeStage[2:0]     ), //i
    .io_segmentDone  (accumulator_io_segmentDone   ), //o
    .io_baseIndex    (accumulator_io_baseIndex[7:0]), //o
    .io_fraction     (accumulator_io_fraction[1:0] ), //o
    .io_reset        (io_reset                     ), //i
    .io_clk24MHz     (io_clk24MHz                  )  //i
  );
  EnvelopeShaper shaper (
    .io_phaseTick                 (io_phaseTick                            ), //i
    .io_baseIndex                 (accumulator_io_baseIndex[7:0]           ), //i
    .io_fraction                  (accumulator_io_fraction[1:0]            ), //i
    .io_curveSelect               (ctrl_io_curveSelect[1:0]                ), //i
    .io_activeStage               (ctrl_io_activeStage[2:0]                ), //i
    .io_accumDir                  (ctrl_io_accumDir                        ), //i
    .io_disable                   (shaper_io_disable                       ), //i
    .io_envelopeOut_valid         (shaper_io_envelopeOut_valid             ), //o
    .io_envelopeOut_payload       (shaper_io_envelopeOut_payload[9:0]      ), //o
    .io_envelopeOutSigned_valid   (shaper_io_envelopeOutSigned_valid       ), //o
    .io_envelopeOutSigned_payload (shaper_io_envelopeOutSigned_payload[9:0]), //o
    .io_reset                     (io_reset                                ), //i
    .io_clk24MHz                  (io_clk24MHz                             )  //i
  );
  assign shaper_io_disable = io_config_ctrl[0];
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

  wire       [23:0]   accumulator_io_phase;
  wire       [15:0]   generators_io_waves_saw;
  wire       [15:0]   generators_io_waves_square;
  wire       [15:0]   generators_io_waves_pwm;
  wire       [15:0]   generators_io_waves_tri;
  wire       [15:0]   noise_io_sample;
  wire       [15:0]   mux_io_sample;

  OscAccumulator accumulator (
    .io_phaseTick (io_phaseTick              ), //i
    .io_freqWord  (io_config_freqWord[23:0]  ), //i
    .io_phase     (accumulator_io_phase[23:0]), //o
    .io_clk24MHz  (io_clk24MHz               ), //i
    .io_reset     (io_reset                  )  //i
  );
  OscGenerators generators (
    .io_phase        (accumulator_io_phase[23:0]      ), //i
    .io_pwmWidth     (io_config_pwmWidth[7:0]         ), //i
    .io_waves_saw    (generators_io_waves_saw[15:0]   ), //o
    .io_waves_square (generators_io_waves_square[15:0]), //o
    .io_waves_pwm    (generators_io_waves_pwm[15:0]   ), //o
    .io_waves_tri    (generators_io_waves_tri[15:0]   )  //o
  );
  OscNoise noise (
    .io_phaseTick (io_phaseTick         ), //i
    .io_sample    (noise_io_sample[15:0]), //o
    .io_clk24MHz  (io_clk24MHz          ), //i
    .io_reset     (io_reset             )  //i
  );
  OscMux mux (
    .io_waveSelect   (io_config_waveSelect[2:0]       ), //i
    .io_waves_saw    (generators_io_waves_saw[15:0]   ), //i
    .io_waves_square (generators_io_waves_square[15:0]), //i
    .io_waves_pwm    (generators_io_waves_pwm[15:0]   ), //i
    .io_waves_tri    (generators_io_waves_tri[15:0]   ), //i
    .io_noiseWave    (noise_io_sample[15:0]           ), //i
    .io_sample       (mux_io_sample[15:0]             )  //o
  );
  assign io_sample_valid = io_phaseTick;
  assign io_sample_payload = mux_io_sample;

endmodule

module RegisterBank (
  input  wire          io_regWrite_valid,
  input  wire [7:0]    io_regWrite_payload_address,
  input  wire [7:0]    io_regWrite_payload_data,
  output wire [23:0]   io_voiceConfig_osc_freqWord,
  output wire [2:0]    io_voiceConfig_osc_waveSelect,
  output wire [7:0]    io_voiceConfig_osc_pwmWidth,
  output wire [7:0]    io_voiceConfig_osc_volume,
  output wire [7:0]    io_voiceConfig_env_ctrl,
  output wire [7:0]    io_voiceConfig_env_attack,
  output wire [7:0]    io_voiceConfig_env_decay,
  output wire [7:0]    io_voiceConfig_env_sustain,
  output wire [7:0]    io_voiceConfig_env_release,
  output wire [7:0]    io_voiceConfig_env_gate,
  output wire [7:0]    io_voiceConfig_filter_ctrl,
  output wire [1:0]    io_voiceConfig_filter_mode,
  output wire [7:0]    io_voiceConfig_filter_cutoff,
  output wire [7:0]    io_voiceConfig_filter_resonance,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [7:0]    oscFreqLowReg;
  reg        [7:0]    oscFreqMidReg;
  reg        [7:0]    oscFreqHighReg;
  reg        [7:0]    oscWaveformReg;
  reg        [7:0]    oscPulseWidthReg;
  reg        [7:0]    oscVolumeReg;
  reg        [7:0]    oscFreqLowShadow;
  reg        [7:0]    oscFreqMidShadow;
  reg        [7:0]    envCtrlReg;
  reg        [7:0]    envAttackReg;
  reg        [7:0]    envDecayReg;
  reg        [7:0]    envSustainReg;
  reg        [7:0]    envReleaseReg;
  reg        [7:0]    envGateReg;
  reg        [7:0]    filterCtrlReg;
  reg        [7:0]    filterModeReg;
  reg        [7:0]    filterCutoffReg;
  reg        [7:0]    filterResReg;
  wire       [23:0]   oscFrequencyCombined;
  reg        [23:0]   syncedOscFreqWord;
  reg        [7:0]    syncedOscWaveSelect;
  reg        [7:0]    syncedOscPwmWidth;
  reg        [7:0]    syncedOscVolume;
  reg        [7:0]    syncedEnvCtrl;
  reg        [7:0]    syncedEnvAttack;
  reg        [7:0]    syncedEnvDecay;
  reg        [7:0]    syncedEnvSustain;
  reg        [7:0]    syncedEnvRelease;
  reg        [7:0]    syncedEnvGate;
  reg        [7:0]    syncedFilterCtrl;
  reg        [7:0]    syncedFilterMode;
  reg        [7:0]    syncedFilterCutoff;
  reg        [7:0]    syncedFilterRes;

  assign oscFrequencyCombined = {{oscFreqHighReg,oscFreqMidReg},oscFreqLowReg};
  assign io_voiceConfig_osc_freqWord = syncedOscFreqWord;
  assign io_voiceConfig_osc_waveSelect = syncedOscWaveSelect[2 : 0];
  assign io_voiceConfig_osc_pwmWidth = syncedOscPwmWidth;
  assign io_voiceConfig_osc_volume = syncedOscVolume;
  assign io_voiceConfig_env_ctrl = syncedEnvCtrl;
  assign io_voiceConfig_env_attack = syncedEnvAttack;
  assign io_voiceConfig_env_decay = syncedEnvDecay;
  assign io_voiceConfig_env_sustain = syncedEnvSustain;
  assign io_voiceConfig_env_release = syncedEnvRelease;
  assign io_voiceConfig_env_gate = syncedEnvGate;
  assign io_voiceConfig_filter_ctrl = syncedFilterCtrl;
  assign io_voiceConfig_filter_mode = syncedFilterMode[1 : 0];
  assign io_voiceConfig_filter_cutoff = syncedFilterCutoff;
  assign io_voiceConfig_filter_resonance = syncedFilterRes;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      oscFreqLowReg <= 8'h0;
      oscFreqMidReg <= 8'h0;
      oscFreqHighReg <= 8'h0;
      oscWaveformReg <= 8'h0;
      oscPulseWidthReg <= 8'h0;
      oscVolumeReg <= 8'h0;
      oscFreqLowShadow <= 8'h0;
      oscFreqMidShadow <= 8'h0;
      envCtrlReg <= 8'h0;
      envAttackReg <= 8'h0;
      envDecayReg <= 8'h0;
      envSustainReg <= 8'h0;
      envReleaseReg <= 8'h0;
      envGateReg <= 8'h0;
      filterCtrlReg <= 8'h0;
      filterModeReg <= 8'h0;
      filterCutoffReg <= 8'h0;
      filterResReg <= 8'h0;
      syncedOscFreqWord <= 24'h0;
      syncedOscWaveSelect <= 8'h0;
      syncedOscPwmWidth <= 8'h0;
      syncedOscVolume <= 8'h0;
      syncedEnvCtrl <= 8'h0;
      syncedEnvAttack <= 8'h0;
      syncedEnvDecay <= 8'h0;
      syncedEnvSustain <= 8'h0;
      syncedEnvRelease <= 8'h0;
      syncedEnvGate <= 8'h0;
      syncedFilterCtrl <= 8'h0;
      syncedFilterMode <= 8'h0;
      syncedFilterCutoff <= 8'h0;
      syncedFilterRes <= 8'h0;
    end else begin
      if(io_regWrite_valid) begin
        case(io_regWrite_payload_address)
          8'h30 : begin
            oscFreqLowShadow <= io_regWrite_payload_data;
          end
          8'h31 : begin
            oscFreqMidShadow <= io_regWrite_payload_data;
          end
          8'h32 : begin
            oscFreqHighReg <= io_regWrite_payload_data;
            oscFreqMidReg <= oscFreqMidShadow;
            oscFreqLowReg <= oscFreqLowShadow;
          end
          8'h33 : begin
            oscWaveformReg <= io_regWrite_payload_data;
          end
          8'h34 : begin
            oscPulseWidthReg <= io_regWrite_payload_data;
          end
          8'h35 : begin
            oscVolumeReg <= io_regWrite_payload_data;
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
          8'h50 : begin
            filterCtrlReg <= io_regWrite_payload_data;
          end
          8'h51 : begin
            filterModeReg <= io_regWrite_payload_data;
          end
          8'h52 : begin
            filterCutoffReg <= io_regWrite_payload_data;
          end
          8'h53 : begin
            filterResReg <= io_regWrite_payload_data;
          end
          default : begin
          end
        endcase
      end
      syncedOscFreqWord <= oscFrequencyCombined;
      syncedOscWaveSelect <= oscWaveformReg;
      syncedOscPwmWidth <= oscPulseWidthReg;
      syncedOscVolume <= oscVolumeReg;
      syncedEnvCtrl <= envCtrlReg;
      syncedEnvAttack <= envAttackReg;
      syncedEnvDecay <= envDecayReg;
      syncedEnvSustain <= envSustainReg;
      syncedEnvRelease <= envReleaseReg;
      syncedEnvGate <= envGateReg;
      syncedFilterCtrl <= filterCtrlReg;
      syncedFilterMode <= filterModeReg;
      syncedFilterCutoff <= filterCutoffReg;
      syncedFilterRes <= filterResReg;
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

module FilterMux (
  input  wire [1:0]    io_mode,
  input  wire [23:0]   io_lp,
  input  wire [23:0]   io_bp,
  input  wire [23:0]   io_hp,
  output reg  [15:0]   io_sampleOut
);

  reg        [23:0]   selected;
  wire                when_FilterMux_l25;
  wire                when_FilterMux_l27;

  always @(*) begin
    case(io_mode)
      2'b00 : begin
        selected = io_lp;
      end
      2'b01 : begin
        selected = io_bp;
      end
      2'b10 : begin
        selected = io_hp;
      end
      default : begin
        selected = io_lp;
      end
    endcase
  end

  assign when_FilterMux_l25 = ($signed(24'h007fff) < $signed(selected));
  always @(*) begin
    if(when_FilterMux_l25) begin
      io_sampleOut = 16'h7fff;
    end else begin
      if(when_FilterMux_l27) begin
        io_sampleOut = 16'h8000;
      end else begin
        io_sampleOut = selected[15:0];
      end
    end
  end

  assign when_FilterMux_l27 = ($signed(selected) < $signed(24'hff8000));

endmodule

module FilterCore (
  input  wire          io_phaseTick,
  input  wire          io_clear,
  input  wire [15:0]   io_sampleIn,
  input  wire [11:0]   io_cutoffCoeff,
  input  wire [7:0]    io_resonanceCoeff,
  output wire [23:0]   io_lp,
  output wire [23:0]   io_bp,
  output wire [23:0]   io_hp,
  output reg           io_done,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam fsm_2_BOOT = 4'd0;
  localparam fsm_2_IDLE = 4'd1;
  localparam fsm_2_CALC_RES = 4'd2;
  localparam fsm_2_SUB_INPUT = 4'd3;
  localparam fsm_2_CALC_HP = 4'd4;
  localparam fsm_2_CALC_BP_TERM = 4'd5;
  localparam fsm_2_UPDATE_BP = 4'd6;
  localparam fsm_2_CALC_LP_TERM = 4'd7;
  localparam fsm_2_UPDATE_LP = 4'd8;

  wire       [23:0]   _zz_addOut;
  wire       [23:0]   _zz_addOut_1;
  wire       [8:0]    _zz_multIn2;
  wire       [39:0]   _zz_resTerm;
  wire       [12:0]   _zz_multIn2_1;
  wire       [35:0]   _zz_bpTerm;
  wire       [12:0]   _zz_multIn2_2;
  wire       [35:0]   _zz_lpTerm;
  reg        [23:0]   lpReg;
  reg        [23:0]   bpReg;
  reg        [23:0]   hpReg;
  reg        [15:0]   sampleInReg;
  reg        [23:0]   resTerm;
  reg        [23:0]   tempSub;
  reg        [23:0]   bpTerm;
  reg        [23:0]   lpTerm;
  reg        [23:0]   multIn1;
  reg        [23:0]   multIn2;
  wire       [47:0]   multOut;
  reg        [23:0]   addIn1;
  reg        [23:0]   addIn2;
  reg                 isSub;
  wire       [23:0]   addOut;
  wire       [23:0]   addOutResized;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  `ifndef SYNTHESIS
  reg [95:0] fsm_stateReg_string;
  reg [95:0] fsm_stateNext_string;
  `endif


  assign _zz_addOut = ($signed(addIn1) - $signed(addIn2));
  assign _zz_addOut_1 = ($signed(addIn1) + $signed(addIn2));
  assign _zz_multIn2 = {1'b0,io_resonanceCoeff};
  assign _zz_resTerm = (multOut >>> 4'd8);
  assign _zz_multIn2_1 = {1'b0,io_cutoffCoeff};
  assign _zz_bpTerm = (multOut >>> 4'd12);
  assign _zz_multIn2_2 = {1'b0,io_cutoffCoeff};
  assign _zz_lpTerm = (multOut >>> 4'd12);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_2_BOOT : fsm_stateReg_string = "BOOT        ";
      fsm_2_IDLE : fsm_stateReg_string = "IDLE        ";
      fsm_2_CALC_RES : fsm_stateReg_string = "CALC_RES    ";
      fsm_2_SUB_INPUT : fsm_stateReg_string = "SUB_INPUT   ";
      fsm_2_CALC_HP : fsm_stateReg_string = "CALC_HP     ";
      fsm_2_CALC_BP_TERM : fsm_stateReg_string = "CALC_BP_TERM";
      fsm_2_UPDATE_BP : fsm_stateReg_string = "UPDATE_BP   ";
      fsm_2_CALC_LP_TERM : fsm_stateReg_string = "CALC_LP_TERM";
      fsm_2_UPDATE_LP : fsm_stateReg_string = "UPDATE_LP   ";
      default : fsm_stateReg_string = "????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_2_BOOT : fsm_stateNext_string = "BOOT        ";
      fsm_2_IDLE : fsm_stateNext_string = "IDLE        ";
      fsm_2_CALC_RES : fsm_stateNext_string = "CALC_RES    ";
      fsm_2_SUB_INPUT : fsm_stateNext_string = "SUB_INPUT   ";
      fsm_2_CALC_HP : fsm_stateNext_string = "CALC_HP     ";
      fsm_2_CALC_BP_TERM : fsm_stateNext_string = "CALC_BP_TERM";
      fsm_2_UPDATE_BP : fsm_stateNext_string = "UPDATE_BP   ";
      fsm_2_CALC_LP_TERM : fsm_stateNext_string = "CALC_LP_TERM";
      fsm_2_UPDATE_LP : fsm_stateNext_string = "UPDATE_LP   ";
      default : fsm_stateNext_string = "????????????";
    endcase
  end
  `endif

  always @(*) begin
    multIn1 = 24'h0;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
      end
      fsm_2_CALC_RES : begin
        multIn1 = bpReg;
      end
      fsm_2_SUB_INPUT : begin
      end
      fsm_2_CALC_HP : begin
      end
      fsm_2_CALC_BP_TERM : begin
        multIn1 = hpReg;
      end
      fsm_2_UPDATE_BP : begin
      end
      fsm_2_CALC_LP_TERM : begin
        multIn1 = bpReg;
      end
      fsm_2_UPDATE_LP : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    multIn2 = 24'h0;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
      end
      fsm_2_CALC_RES : begin
        multIn2 = {{15{_zz_multIn2[8]}}, _zz_multIn2};
      end
      fsm_2_SUB_INPUT : begin
      end
      fsm_2_CALC_HP : begin
      end
      fsm_2_CALC_BP_TERM : begin
        multIn2 = {{11{_zz_multIn2_1[12]}}, _zz_multIn2_1};
      end
      fsm_2_UPDATE_BP : begin
      end
      fsm_2_CALC_LP_TERM : begin
        multIn2 = {{11{_zz_multIn2_2[12]}}, _zz_multIn2_2};
      end
      fsm_2_UPDATE_LP : begin
      end
      default : begin
      end
    endcase
  end

  assign multOut = ($signed(multIn1) * $signed(multIn2));
  always @(*) begin
    addIn1 = 24'h0;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
      end
      fsm_2_CALC_RES : begin
      end
      fsm_2_SUB_INPUT : begin
        addIn1 = {{8{sampleInReg[15]}}, sampleInReg};
      end
      fsm_2_CALC_HP : begin
        addIn1 = tempSub;
      end
      fsm_2_CALC_BP_TERM : begin
      end
      fsm_2_UPDATE_BP : begin
        addIn1 = bpReg;
      end
      fsm_2_CALC_LP_TERM : begin
      end
      fsm_2_UPDATE_LP : begin
        addIn1 = lpReg;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    addIn2 = 24'h0;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
      end
      fsm_2_CALC_RES : begin
      end
      fsm_2_SUB_INPUT : begin
        addIn2 = lpReg;
      end
      fsm_2_CALC_HP : begin
        addIn2 = resTerm;
      end
      fsm_2_CALC_BP_TERM : begin
      end
      fsm_2_UPDATE_BP : begin
        addIn2 = bpTerm;
      end
      fsm_2_CALC_LP_TERM : begin
      end
      fsm_2_UPDATE_LP : begin
        addIn2 = lpTerm;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    isSub = 1'b0;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
      end
      fsm_2_CALC_RES : begin
      end
      fsm_2_SUB_INPUT : begin
        isSub = 1'b1;
      end
      fsm_2_CALC_HP : begin
        isSub = 1'b1;
      end
      fsm_2_CALC_BP_TERM : begin
      end
      fsm_2_UPDATE_BP : begin
        isSub = 1'b0;
      end
      fsm_2_CALC_LP_TERM : begin
      end
      fsm_2_UPDATE_LP : begin
        isSub = 1'b0;
      end
      default : begin
      end
    endcase
  end

  assign addOut = (isSub ? _zz_addOut : _zz_addOut_1);
  assign addOutResized = addOut;
  always @(*) begin
    io_done = 1'b0;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
      end
      fsm_2_CALC_RES : begin
      end
      fsm_2_SUB_INPUT : begin
      end
      fsm_2_CALC_HP : begin
      end
      fsm_2_CALC_BP_TERM : begin
      end
      fsm_2_UPDATE_BP : begin
      end
      fsm_2_CALC_LP_TERM : begin
      end
      fsm_2_UPDATE_LP : begin
        io_done = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
      end
      fsm_2_CALC_RES : begin
      end
      fsm_2_SUB_INPUT : begin
      end
      fsm_2_CALC_HP : begin
      end
      fsm_2_CALC_BP_TERM : begin
      end
      fsm_2_UPDATE_BP : begin
      end
      fsm_2_CALC_LP_TERM : begin
      end
      fsm_2_UPDATE_LP : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign io_lp = lpReg;
  assign io_bp = bpReg;
  assign io_hp = hpReg;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_2_IDLE : begin
        if(io_phaseTick) begin
          fsm_stateNext = fsm_2_CALC_RES;
        end
      end
      fsm_2_CALC_RES : begin
        fsm_stateNext = fsm_2_SUB_INPUT;
      end
      fsm_2_SUB_INPUT : begin
        fsm_stateNext = fsm_2_CALC_HP;
      end
      fsm_2_CALC_HP : begin
        fsm_stateNext = fsm_2_CALC_BP_TERM;
      end
      fsm_2_CALC_BP_TERM : begin
        fsm_stateNext = fsm_2_UPDATE_BP;
      end
      fsm_2_UPDATE_BP : begin
        fsm_stateNext = fsm_2_CALC_LP_TERM;
      end
      fsm_2_CALC_LP_TERM : begin
        fsm_stateNext = fsm_2_UPDATE_LP;
      end
      fsm_2_UPDATE_LP : begin
        fsm_stateNext = fsm_2_IDLE;
      end
      default : begin
      end
    endcase
    if(io_clear) begin
      fsm_stateNext = fsm_2_IDLE;
    end
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_2_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_2_BOOT;
    end
  end

  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      lpReg <= 24'h0;
      bpReg <= 24'h0;
      hpReg <= 24'h0;
      sampleInReg <= 16'h0;
      resTerm <= 24'h0;
      tempSub <= 24'h0;
      bpTerm <= 24'h0;
      lpTerm <= 24'h0;
      fsm_stateReg <= fsm_2_BOOT;
    end else begin
      if(io_clear) begin
        lpReg <= 24'h0;
        bpReg <= 24'h0;
        hpReg <= 24'h0;
      end
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_2_IDLE : begin
          if(io_phaseTick) begin
            sampleInReg <= io_sampleIn;
          end
        end
        fsm_2_CALC_RES : begin
          resTerm <= _zz_resTerm[23:0];
        end
        fsm_2_SUB_INPUT : begin
          tempSub <= addOutResized;
        end
        fsm_2_CALC_HP : begin
          hpReg <= addOutResized;
        end
        fsm_2_CALC_BP_TERM : begin
          bpTerm <= _zz_bpTerm[23:0];
        end
        fsm_2_UPDATE_BP : begin
          bpReg <= addOutResized;
        end
        fsm_2_CALC_LP_TERM : begin
          lpTerm <= _zz_lpTerm[23:0];
        end
        fsm_2_UPDATE_LP : begin
          lpReg <= addOutResized;
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module ParameterMapper (
  input  wire [7:0]    io_cutoff,
  input  wire [7:0]    io_resonance,
  output wire [11:0]   io_cutoffCoeff,
  output wire [7:0]    io_resonanceCoeff
);

  wire       [11:0]   cutoffRom_spinal_port0;
  wire       [7:0]    resonanceRom_spinal_port0;
  reg [11:0] cutoffRom [0:255];
  reg [7:0] resonanceRom [0:255];

  initial begin
    $readmemb("Synth.v_toplevel_core_voice_svf_1_mapper_cutoffRom.bin",cutoffRom);
  end
  assign cutoffRom_spinal_port0 = cutoffRom[io_cutoff];
  initial begin
    $readmemb("Synth.v_toplevel_core_voice_svf_1_mapper_resonanceRom.bin",resonanceRom);
  end
  assign resonanceRom_spinal_port0 = resonanceRom[io_resonance];
  assign io_cutoffCoeff = cutoffRom_spinal_port0;
  assign io_resonanceCoeff = resonanceRom_spinal_port0;

endmodule

module EnvelopeShaper (
  input  wire          io_phaseTick,
  input  wire [7:0]    io_baseIndex,
  input  wire [1:0]    io_fraction,
  input  wire [1:0]    io_curveSelect,
  input  wire [2:0]    io_activeStage,
  input  wire          io_accumDir,
  input  wire          io_disable,
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
  wire       [11:0]   _zz_interp;
  wire       [11:0]   _zz_finalValUnipolar;
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
  wire       [9:0]    finalValUnipolar;
  reg        [9:0]    _zz_io_envelopeOut_payload;
  wire       [9:0]    finalValBipolar;
  reg        [9:0]    _zz_io_envelopeOutSigned_payload;
  reg                 outValid;
  reg [7:0] linRom [0:256];
  reg [7:0] expRom [0:256];
  reg [7:0] logRom [0:256];
  reg [7:0] sigRom [0:256];

  assign _zz_addr1 = {1'd0, io_baseIndex};
  assign _zz_y0Shifted = ({2'd0,y0Signed} <<< 2'd2);
  assign _zz_deltaShifted = ({1'd0,delta} <<< 1'd1);
  assign _zz_interp = ($signed(y0Shifted) + $signed(deltaShifted));
  assign _zz_finalValUnipolar = interp;
  initial begin
    $readmemb("Synth.v_toplevel_core_voice_envGen_shaper_linRom.bin",linRom);
  end
  assign linRom_spinal_port0 = linRom[addr0];
  assign linRom_spinal_port1 = linRom[addr1];
  initial begin
    $readmemb("Synth.v_toplevel_core_voice_envGen_shaper_expRom.bin",expRom);
  end
  assign expRom_spinal_port0 = expRom[addr0];
  assign expRom_spinal_port1 = expRom[addr1];
  initial begin
    $readmemb("Synth.v_toplevel_core_voice_envGen_shaper_logRom.bin",logRom);
  end
  assign logRom_spinal_port0 = logRom[addr0];
  assign logRom_spinal_port1 = logRom[addr1];
  initial begin
    $readmemb("Synth.v_toplevel_core_voice_envGen_shaper_sigRom.bin",sigRom);
  end
  assign sigRom_spinal_port0 = sigRom[addr0];
  assign sigRom_spinal_port1 = sigRom[addr1];
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
  always @(*) begin
    case(io_fraction)
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
  assign io_envelopeOut_payload = _zz_io_envelopeOut_payload;
  assign finalValBipolar = (finalValUnipolar ^ 10'h200);
  assign io_envelopeOutSigned_payload = _zz_io_envelopeOutSigned_payload;
  assign io_envelopeOut_valid = outValid;
  assign io_envelopeOutSigned_valid = outValid;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      _zz_io_envelopeOut_payload <= 10'h0;
      _zz_io_envelopeOutSigned_payload <= 10'h0;
      outValid <= 1'b0;
    end else begin
      _zz_io_envelopeOut_payload <= (io_disable ? 10'h0 : finalValUnipolar);
      _zz_io_envelopeOutSigned_payload <= (io_disable ? 10'h0 : finalValBipolar);
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
  reg        [7:0]    romAddr;
  wire                disable_1;
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
  wire                when_EnvelopeCtrl_l86;
  wire                when_EnvelopeCtrl_l102;
  wire                when_EnvelopeCtrl_l123;
  wire                when_EnvelopeCtrl_l119;
  wire                when_EnvelopeCtrl_l140;
  `ifndef SYNTHESIS
  reg [71:0] fsm_stateReg_string;
  reg [71:0] fsm_stateNext_string;
  `endif

  reg [21:0] rom [0:255];

  initial begin
    $readmemb("Synth.v_toplevel_core_voice_envGen_ctrl_rom.bin",rom);
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
  assign disable_1 = io_config_ctrl[0];
  assign hwSyncPulse = (io_syncIn && (! syncInD1));
  assign swSyncPulse = (io_config_gate[1] && (! swSyncD1));
  assign hardSyncPulse = (((hwSyncPulse || swSyncPulse) && io_config_ctrl[3]) && (! io_reset));
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
        if(when_EnvelopeCtrl_l86) begin
          fsmResetAccum = 1'b1;
        end
      end
      fsm_1_ATTACK : begin
        if(disable_1) begin
          fsmResetAccum = 1'b1;
        end else begin
          if(hardSyncPulse) begin
            fsmResetAccum = 1'b1;
          end else begin
            if(!when_EnvelopeCtrl_l102) begin
              if(io_segmentDone) begin
                fsmResetAccum = 1'b1;
              end
            end
          end
        end
      end
      fsm_1_DECAY : begin
        if(disable_1) begin
          fsmResetAccum = 1'b1;
        end else begin
          if(hardSyncPulse) begin
            fsmResetAccum = 1'b1;
          end else begin
            if(!when_EnvelopeCtrl_l119) begin
              if(io_segmentDone) begin
                if(when_EnvelopeCtrl_l123) begin
                  fsmResetAccum = 1'b1;
                end
              end
            end
          end
        end
      end
      fsm_1_SUSTAIN : begin
        if(disable_1) begin
          fsmResetAccum = 1'b1;
        end else begin
          if(hardSyncPulse) begin
            fsmResetAccum = 1'b1;
          end
        end
      end
      fsm_1_RELEASE_1 : begin
        if(disable_1) begin
          fsmResetAccum = 1'b1;
        end else begin
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
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsmRunAccum = 1'b0;
    case(fsm_stateReg)
      fsm_1_IDLE : begin
        if(when_EnvelopeCtrl_l86) begin
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
        if(when_EnvelopeCtrl_l86) begin
          fsm_stateNext = fsm_1_ATTACK;
        end
      end
      fsm_1_ATTACK : begin
        if(disable_1) begin
          fsm_stateNext = fsm_1_IDLE;
        end else begin
          if(hardSyncPulse) begin
            fsm_stateNext = fsm_1_ATTACK;
          end else begin
            if(when_EnvelopeCtrl_l102) begin
              fsm_stateNext = fsm_1_RELEASE_1;
            end else begin
              if(io_segmentDone) begin
                fsm_stateNext = fsm_1_DECAY;
              end
            end
          end
        end
      end
      fsm_1_DECAY : begin
        if(disable_1) begin
          fsm_stateNext = fsm_1_IDLE;
        end else begin
          if(hardSyncPulse) begin
            fsm_stateNext = fsm_1_ATTACK;
          end else begin
            if(when_EnvelopeCtrl_l119) begin
              fsm_stateNext = fsm_1_RELEASE_1;
            end else begin
              if(io_segmentDone) begin
                if(when_EnvelopeCtrl_l123) begin
                  fsm_stateNext = fsm_1_ATTACK;
                end else begin
                  fsm_stateNext = fsm_1_SUSTAIN;
                end
              end
            end
          end
        end
      end
      fsm_1_SUSTAIN : begin
        if(disable_1) begin
          fsm_stateNext = fsm_1_IDLE;
        end else begin
          if(hardSyncPulse) begin
            fsm_stateNext = fsm_1_ATTACK;
          end else begin
            if(when_EnvelopeCtrl_l140) begin
              fsm_stateNext = fsm_1_RELEASE_1;
            end
          end
        end
      end
      fsm_1_RELEASE_1 : begin
        if(disable_1) begin
          fsm_stateNext = fsm_1_IDLE;
        end else begin
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

  assign when_EnvelopeCtrl_l86 = (gateOn && (! disable_1));
  assign when_EnvelopeCtrl_l102 = (! gateOn);
  assign when_EnvelopeCtrl_l123 = io_config_ctrl[2];
  assign when_EnvelopeCtrl_l119 = (! gateOn);
  assign when_EnvelopeCtrl_l140 = (! gateOn);
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

module OscMux (
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

module OscNoise (
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

module OscGenerators (
  input  wire [23:0]   io_phase,
  input  wire [7:0]    io_pwmWidth,
  output wire [15:0]   io_waves_saw,
  output wire [15:0]   io_waves_square,
  output wire [15:0]   io_waves_pwm,
  output wire [15:0]   io_waves_tri
);

  wire       [23:0]   expandedPwm;
  reg        [22:0]   triReflected;
  wire                when_OscGenerators_l32;

  assign io_waves_saw = (io_phase[23 : 8] ^ 16'h8000);
  assign io_waves_square = (io_phase[23] ? 16'h7fff : 16'h8000);
  assign expandedPwm = ({16'd0,io_pwmWidth} <<< 5'd16);
  assign io_waves_pwm = ((io_phase < expandedPwm) ? 16'h7fff : 16'h8000);
  assign when_OscGenerators_l32 = (io_phase[23] == 1'b0);
  always @(*) begin
    if(when_OscGenerators_l32) begin
      triReflected = io_phase[22 : 0];
    end else begin
      triReflected = (~ io_phase[22 : 0]);
    end
  end

  assign io_waves_tri = (triReflected[22 : 7] ^ 16'h8000);

endmodule

module OscAccumulator (
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
