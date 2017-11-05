
##################################################################################
#iverilog
##################################################################################

%.isim:
	@if [ ! -d $(DEBUGDIR) ]; then \
		echo mkdir $(DEBUGDIR); \
		mkdir $(DEBUGDIR); \
	fi
	( cd $(DEBUGDIR); make -f ../Makefile SRCDIR=.. TARGET=$(@:%.isim=%) gtkwave )

%.vvp: $(TARGET)_sim.v $(SIMVFILES)
	iverilog -o $@ $^

%.vcd: %.vvp
	vvp $<

gtkwave: $(TARGET)_sim.vcd
	gtkwave $<
