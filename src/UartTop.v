// Generator : SpinalHDL v1.14.0    git head : 95a5e6c65c54acfc4707c8fe6ef8b5d297cfcbde
// Component : UartTop
// Git hash  : f28e5246e47621897928c8e4246981628e554546

`timescale 1ns/1ps

module UartTop (
  input  wire          io_clk24MHz,
  input  wire          io_reset,
  input  wire          io_uartRx,
  output wire          io_i2sBclk,
  output wire          io_i2sLrclk,
  output wire          io_i2sData
);

  wire       [7:0]    core_uartRxModule_io_data;
  wire                core_uartRxModule_io_dataValid;
  wire                core_protocolDecoder_io_writeEnable;
  wire       [7:0]    core_protocolDecoder_io_writeAddress;
  wire       [7:0]    core_protocolDecoder_io_writeData;
  wire       [23:0]   core_registerBank_io_oscFrequency;
  wire       [7:0]    core_registerBank_io_oscWaveform;
  wire       [7:0]    core_registerBank_io_oscPulseWidth;
  wire       [7:0]    core_registerBank_io_oscVolume;
  wire                core_oscillatorWrapper_io_i2s_bclk;
  wire                core_oscillatorWrapper_io_i2s_lrclk;
  wire                core_oscillatorWrapper_io_i2s_sdata;

  UartRx core_uartRxModule (
    .io_rx        (io_uartRx                     ), //i
    .io_data      (core_uartRxModule_io_data[7:0]), //o
    .io_dataValid (core_uartRxModule_io_dataValid), //o
    .io_clk24MHz  (io_clk24MHz                   ), //i
    .io_reset     (io_reset                      )  //i
  );
  UartProtocolDecoder core_protocolDecoder (
    .io_rxData       (core_uartRxModule_io_data[7:0]           ), //i
    .io_rxDataValid  (core_uartRxModule_io_dataValid           ), //i
    .io_writeEnable  (core_protocolDecoder_io_writeEnable      ), //o
    .io_writeAddress (core_protocolDecoder_io_writeAddress[7:0]), //o
    .io_writeData    (core_protocolDecoder_io_writeData[7:0]   ), //o
    .io_clk24MHz     (io_clk24MHz                              ), //i
    .io_reset        (io_reset                                 )  //i
  );
  RegisterBank core_registerBank (
    .io_writeEnable   (core_protocolDecoder_io_writeEnable      ), //i
    .io_writeAddress  (core_protocolDecoder_io_writeAddress[7:0]), //i
    .io_writeData     (core_protocolDecoder_io_writeData[7:0]   ), //i
    .io_oscFrequency  (core_registerBank_io_oscFrequency[23:0]  ), //o
    .io_oscWaveform   (core_registerBank_io_oscWaveform[7:0]    ), //o
    .io_oscPulseWidth (core_registerBank_io_oscPulseWidth[7:0]  ), //o
    .io_oscVolume     (core_registerBank_io_oscVolume[7:0]      ), //o
    .io_clk24MHz      (io_clk24MHz                              ), //i
    .io_reset         (io_reset                                 )  //i
  );
  OscillatorWrapper core_oscillatorWrapper (
    .io_oscFrequency  (core_registerBank_io_oscFrequency[23:0]), //i
    .io_oscWaveform   (core_registerBank_io_oscWaveform[7:0]  ), //i
    .io_oscPulseWidth (core_registerBank_io_oscPulseWidth[7:0]), //i
    .io_oscVolume     (core_registerBank_io_oscVolume[7:0]    ), //i
    .io_i2s_bclk      (core_oscillatorWrapper_io_i2s_bclk     ), //o
    .io_i2s_lrclk     (core_oscillatorWrapper_io_i2s_lrclk    ), //o
    .io_i2s_sdata     (core_oscillatorWrapper_io_i2s_sdata    ), //o
    .io_clk24MHz      (io_clk24MHz                            ), //i
    .io_reset         (io_reset                               )  //i
  );
  assign io_i2sBclk = core_oscillatorWrapper_io_i2s_bclk;
  assign io_i2sLrclk = core_oscillatorWrapper_io_i2s_lrclk;
  assign io_i2sData = core_oscillatorWrapper_io_i2s_sdata;

endmodule

module OscillatorWrapper (
  input  wire [23:0]   io_oscFrequency,
  input  wire [7:0]    io_oscWaveform,
  input  wire [7:0]    io_oscPulseWidth,
  input  wire [7:0]    io_oscVolume,
  output wire          io_i2s_bclk,
  output wire          io_i2s_lrclk,
  output wire          io_i2s_sdata,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  wire       [2:0]    oscillatorCore_io_waveSelect;
  wire                oscillatorCore_io_i2s_bclk;
  wire                oscillatorCore_io_i2s_lrclk;
  wire                oscillatorCore_io_i2s_sdata;

  OscillatorTop oscillatorCore (
    .io_freqWord   (io_oscFrequency[23:0]            ), //i
    .io_waveSelect (oscillatorCore_io_waveSelect[2:0]), //i
    .io_pwmWidth   (io_oscPulseWidth[7:0]            ), //i
    .io_i2s_bclk   (oscillatorCore_io_i2s_bclk       ), //o
    .io_i2s_lrclk  (oscillatorCore_io_i2s_lrclk      ), //o
    .io_i2s_sdata  (oscillatorCore_io_i2s_sdata      ), //o
    .io_clk24MHz   (io_clk24MHz                      ), //i
    .io_reset      (io_reset                         )  //i
  );
  assign oscillatorCore_io_waveSelect = io_oscWaveform[2 : 0];
  assign io_i2s_bclk = oscillatorCore_io_i2s_bclk;
  assign io_i2s_lrclk = oscillatorCore_io_i2s_lrclk;
  assign io_i2s_sdata = oscillatorCore_io_i2s_sdata;

endmodule

module RegisterBank (
  input  wire          io_writeEnable,
  input  wire [7:0]    io_writeAddress,
  input  wire [7:0]    io_writeData,
  output wire [23:0]   io_oscFrequency,
  output wire [7:0]    io_oscWaveform,
  output wire [7:0]    io_oscPulseWidth,
  output wire [7:0]    io_oscVolume,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [7:0]    freqLowReg;
  reg        [7:0]    freqMidReg;
  reg        [7:0]    freqHighReg;
  reg        [7:0]    waveformReg;
  reg        [7:0]    pulseWidthReg;
  reg        [7:0]    volumeReg;
  wire       [23:0]   frequencyCombined;
  reg        [23:0]   oscFrequencyReg;
  reg        [7:0]    oscWaveformReg;
  reg        [7:0]    oscPulseWidthReg;
  reg        [7:0]    oscVolumeReg;

  assign frequencyCombined = {{freqHighReg,freqMidReg},freqLowReg};
  assign io_oscFrequency = oscFrequencyReg;
  assign io_oscWaveform = oscWaveformReg;
  assign io_oscPulseWidth = oscPulseWidthReg;
  assign io_oscVolume = oscVolumeReg;
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      freqLowReg <= 8'h0;
      freqMidReg <= 8'h0;
      freqHighReg <= 8'h0;
      waveformReg <= 8'h0;
      pulseWidthReg <= 8'h0;
      volumeReg <= 8'h0;
      oscFrequencyReg <= 24'h0;
      oscWaveformReg <= 8'h0;
      oscPulseWidthReg <= 8'h0;
      oscVolumeReg <= 8'h0;
    end else begin
      if(io_writeEnable) begin
        case(io_writeAddress)
          8'h0 : begin
            freqLowReg <= io_writeData;
          end
          8'h01 : begin
            freqMidReg <= io_writeData;
          end
          8'h02 : begin
            freqHighReg <= io_writeData;
          end
          8'h03 : begin
            waveformReg <= io_writeData;
          end
          8'h04 : begin
            pulseWidthReg <= io_writeData;
          end
          8'h05 : begin
            volumeReg <= io_writeData;
          end
          default : begin
          end
        endcase
      end
      oscFrequencyReg <= frequencyCombined;
      oscWaveformReg <= waveformReg;
      oscPulseWidthReg <= pulseWidthReg;
      oscVolumeReg <= volumeReg;
    end
  end


endmodule

module UartProtocolDecoder (
  input  wire [7:0]    io_rxData,
  input  wire          io_rxDataValid,
  output wire          io_writeEnable,
  output wire [7:0]    io_writeAddress,
  output wire [7:0]    io_writeData,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam State_1_WAIT_CMD = 2'd0;
  localparam State_1_WAIT_ADDR = 2'd1;
  localparam State_1_WAIT_DATA = 2'd2;

  reg        [1:0]    state_2;
  reg        [7:0]    addressReg;
  reg                 writeEnableReg;
  reg        [7:0]    writeAddressReg;
  reg        [7:0]    writeDataReg;
  wire                when_UartProtocolDecoder_l64;
  `ifndef SYNTHESIS
  reg [71:0] state_2_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(state_2)
      State_1_WAIT_CMD : state_2_string = "WAIT_CMD ";
      State_1_WAIT_ADDR : state_2_string = "WAIT_ADDR";
      State_1_WAIT_DATA : state_2_string = "WAIT_DATA";
      default : state_2_string = "?????????";
    endcase
  end
  `endif

  assign io_writeEnable = writeEnableReg;
  assign io_writeAddress = writeAddressReg;
  assign io_writeData = writeDataReg;
  assign when_UartProtocolDecoder_l64 = (io_rxData == 8'h01);
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      state_2 <= State_1_WAIT_CMD;
      addressReg <= 8'h0;
      writeEnableReg <= 1'b0;
      writeAddressReg <= 8'h0;
      writeDataReg <= 8'h0;
    end else begin
      writeEnableReg <= 1'b0;
      case(state_2)
        State_1_WAIT_CMD : begin
          if(io_rxDataValid) begin
            if(when_UartProtocolDecoder_l64) begin
              state_2 <= State_1_WAIT_ADDR;
            end
          end
        end
        State_1_WAIT_ADDR : begin
          if(io_rxDataValid) begin
            addressReg <= io_rxData;
            state_2 <= State_1_WAIT_DATA;
          end
        end
        default : begin
          if(io_rxDataValid) begin
            writeAddressReg <= addressReg;
            writeDataReg <= io_rxData;
            writeEnableReg <= 1'b1;
            state_2 <= State_1_WAIT_CMD;
          end
        end
      endcase
    end
  end


endmodule

module UartRx (
  input  wire          io_rx,
  output wire [7:0]    io_data,
  output wire          io_dataValid,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);
  localparam State_IDLE = 3'd0;
  localparam State_START = 3'd1;
  localparam State_DATA = 3'd2;
  localparam State_STOP = 3'd3;
  localparam State_DONE = 3'd4;

  reg        [2:0]    state_2;
  reg        [7:0]    baudCounter;
  reg        [2:0]    bitCounter;
  reg        [7:0]    shiftReg;
  reg        [7:0]    dataReg;
  reg                 dataValidReg;
  wire                when_UartRx_l72;
  wire                when_UartRx_l83;
  wire                when_UartRx_l88;
  wire                when_UartRx_l105;
  wire                when_UartRx_l112;
  wire                when_UartRx_l130;
  wire                when_UartRx_l135;
  `ifndef SYNTHESIS
  reg [39:0] state_2_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(state_2)
      State_IDLE : state_2_string = "IDLE ";
      State_START : state_2_string = "START";
      State_DATA : state_2_string = "DATA ";
      State_STOP : state_2_string = "STOP ";
      State_DONE : state_2_string = "DONE ";
      default : state_2_string = "?????";
    endcase
  end
  `endif

  assign io_data = dataReg;
  assign io_dataValid = dataValidReg;
  assign when_UartRx_l72 = (io_rx == 1'b0);
  assign when_UartRx_l83 = (baudCounter == 8'h67);
  assign when_UartRx_l88 = (io_rx == 1'b0);
  assign when_UartRx_l105 = (baudCounter == 8'hcf);
  assign when_UartRx_l112 = (bitCounter == 3'b111);
  assign when_UartRx_l130 = (baudCounter == 8'hcf);
  assign when_UartRx_l135 = (io_rx == 1'b1);
  always @(posedge io_clk24MHz or posedge io_reset) begin
    if(io_reset) begin
      state_2 <= State_IDLE;
      baudCounter <= 8'h0;
      bitCounter <= 3'b000;
      shiftReg <= 8'h0;
      dataReg <= 8'h0;
      dataValidReg <= 1'b0;
    end else begin
      dataValidReg <= 1'b0;
      case(state_2)
        State_IDLE : begin
          baudCounter <= 8'h0;
          bitCounter <= 3'b000;
          if(when_UartRx_l72) begin
            state_2 <= State_START;
          end
        end
        State_START : begin
          if(when_UartRx_l83) begin
            baudCounter <= 8'h0;
            if(when_UartRx_l88) begin
              state_2 <= State_DATA;
            end else begin
              state_2 <= State_IDLE;
            end
          end else begin
            baudCounter <= (baudCounter + 8'h01);
          end
        end
        State_DATA : begin
          if(when_UartRx_l105) begin
            baudCounter <= 8'h0;
            shiftReg[bitCounter] <= io_rx;
            if(when_UartRx_l112) begin
              bitCounter <= 3'b000;
              state_2 <= State_STOP;
            end else begin
              bitCounter <= (bitCounter + 3'b001);
            end
          end else begin
            baudCounter <= (baudCounter + 8'h01);
          end
        end
        State_STOP : begin
          if(when_UartRx_l130) begin
            baudCounter <= 8'h0;
            if(when_UartRx_l135) begin
              dataReg <= shiftReg;
              state_2 <= State_DONE;
            end else begin
              state_2 <= State_IDLE;
            end
          end else begin
            baudCounter <= (baudCounter + 8'h01);
          end
        end
        default : begin
          dataValidReg <= 1'b1;
          state_2 <= State_IDLE;
        end
      endcase
    end
  end


endmodule

module OscillatorTop (
  input  wire [23:0]   io_freqWord,
  input  wire [2:0]    io_waveSelect,
  input  wire [7:0]    io_pwmWidth,
  output wire          io_i2s_bclk,
  output wire          io_i2s_lrclk,
  output wire          io_i2s_sdata,
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  wire                timingGen_io_phaseTick;
  wire                timingGen_io_sampleTick;
  wire       [15:0]   oscillator_1_io_sample;
  wire       [15:0]   decimator_1_io_sampleOut;
  wire                decimator_1_io_valid;
  wire                transmitter_io_bclk;
  wire                transmitter_io_lrclk;
  wire                transmitter_io_sdata;

  TimingGenerator timingGen (
    .io_phaseTick  (timingGen_io_phaseTick ), //o
    .io_sampleTick (timingGen_io_sampleTick), //o
    .io_clk24MHz   (io_clk24MHz            ), //i
    .io_reset      (io_reset               )  //i
  );
  Oscillator oscillator_1 (
    .io_phaseTick  (timingGen_io_phaseTick      ), //i
    .io_freqWord   (io_freqWord[23:0]           ), //i
    .io_waveSelect (io_waveSelect[2:0]          ), //i
    .io_pwmWidth   (io_pwmWidth[7:0]            ), //i
    .io_sample     (oscillator_1_io_sample[15:0]), //o
    .io_clk24MHz   (io_clk24MHz                 ), //i
    .io_reset      (io_reset                    )  //i
  );
  Decimator decimator_1 (
    .io_phaseTick  (timingGen_io_phaseTick        ), //i
    .io_sampleTick (timingGen_io_sampleTick       ), //i
    .io_sampleIn   (oscillator_1_io_sample[15:0]  ), //i
    .io_sampleOut  (decimator_1_io_sampleOut[15:0]), //o
    .io_valid      (decimator_1_io_valid          ), //o
    .io_clk24MHz   (io_clk24MHz                   ), //i
    .io_reset      (io_reset                      )  //i
  );
  I2STransmitter transmitter (
    .io_sampleIn (decimator_1_io_sampleOut[15:0]), //i
    .io_valid    (decimator_1_io_valid          ), //i
    .io_bclk     (transmitter_io_bclk           ), //o
    .io_lrclk    (transmitter_io_lrclk          ), //o
    .io_sdata    (transmitter_io_sdata          ), //o
    .io_clk24MHz (io_clk24MHz                   ), //i
    .io_reset    (io_reset                      )  //i
  );
  assign io_i2s_bclk = transmitter_io_bclk;
  assign io_i2s_lrclk = transmitter_io_lrclk;
  assign io_i2s_sdata = transmitter_io_sdata;

endmodule

module I2STransmitter (
  input  wire [15:0]   io_sampleIn,
  input  wire          io_valid,
  output wire          io_bclk,
  output wire          io_lrclk,
  output wire          io_sdata,
  input  wire          io_clk24MHz,
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
  always @(posedge io_clk24MHz or posedge io_reset) begin
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
  input  wire          io_clk24MHz,
  input  wire          io_reset
);

  reg        [15:0]   sampleReg;
  reg                 io_sampleTick_regNext;

  assign io_sampleOut = sampleReg;
  assign io_valid = io_sampleTick_regNext;
  always @(posedge io_clk24MHz or posedge io_reset) begin
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
  input  wire          io_clk24MHz,
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
    .io_clk24MHz  (io_clk24MHz                 ), //i
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
    .io_clk24MHz  (io_clk24MHz            ), //i
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
