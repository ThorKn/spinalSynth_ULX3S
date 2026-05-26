TOPMOD  := SpinalSynth
TOPMOD2 := SpinalSynth
CHIP := 85k
PACKAGE := CABGA381
CONSTRAINTS := ulx3s_v20
VLOGFIL := $(TOPMOD).v

.PHONY: all

all: $(TOPMOD).bit

.PHONY: clean
clean:
	rm -rf $(TOPMOD).json $(TOPMOD).config $(TOPMOD).bit $(TOPMOD)_yosys.log

$(TOPMOD).bit: $(TOPMOD).config
	ecppack $(TOPMOD).config $(TOPMOD).bit

$(TOPMOD).config: $(TOPMOD).json
	nextpnr-ecp5 \
		--$(CHIP) \
		--package $(PACKAGE) \
        --json $(TOPMOD).json \
		--lpf-allow-unconstrained \
		--lpf $(CONSTRAINTS).lpf \
		--textcfg $(TOPMOD).config

$(TOPMOD).json: $(TOPMOD).v
	yosys -l $(TOPMOD)_yosys.log -p "synth_ecp5 -top $(TOPMOD2) -json $(TOPMOD).json" $(TOPMOD).v UartTop.v pll_1.v pll_2.v


