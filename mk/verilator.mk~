
##################################################################################
#verilator
##################################################################################

%.vsim:
	@if [ ! -d $(DEBUGDIR) ]; then \
		echo mkdir $(DEBUGDIR); \
		mkdir $(DEBUGDIR); \
	fi
	( cd $(DEBUGDIR); make -f ../Makefile SRCDIR=.. TARGET=$(@:%.sim=%) V$(@:%.sim=%) )

V$(TARGET).h: $(SIMVFILES) $(TARGET)_main.cpp
	sed -i -e "s/#1//" *.v
	verilator --cc $(VERIOPT) $(TARGET).v --exe $(SRCDIR)/$(TARGET)_main.cpp

V$(TARGET): V$(TARGET).h 
	@echo "simulation"
	(cd obj_dir; make -j -f V$(TARGET).mk V$(TARGET) )

%.vrun:%.vsim
	(time $(DEBUGDIR)/obj_dir/V$(@:%.vrun=%))

%.vrerun:
	(time $(DEBUGDIR)/obj_dir/V$(@:%.vrerun=%))

