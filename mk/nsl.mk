
NSL2VL    	= nsl2vl
NSL2SC    	= nsl2sc

%.v:%.nsl
	$(NSL2VL) $(NSLFLAGS) $< -o $@

%_sim.v:%_sim.nsl
	$(NSL2VL) $(NSLFLAGS) -verisim2 -target $*_sim $<

