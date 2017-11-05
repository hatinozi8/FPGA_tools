
##################################################################################
#quartus
##################################################################################

MKPROJ		= $(TOOLTOP)/Quartus/mkproj-$(DESIGN).tcl
LBITS		= $(shell getconf LONG_BIT)
ifeq	($(LBITS),64)
	Q2SH		= quartus_sh --64bit
	Q2PGM		= quartus_pgm --64bit
else
	Q2SH		= quartus_sh 
	Q2PGM		= quartus_pgm 
endif
Q2SHOPT		= -fit "fast fit"

CABLE		= "USB-Blaster"
PMODE		= JTAG



all:
	@if [ ! -d $(WORKDIR) ]; then \
		echo mkdir $(WORKDIR); \
		mkdir $(WORKDIR); \
	fi
	( cd $(WORKDIR); make -f ../Makefile SRCDIR=.. compile )


$(PROJECT).qsf: $(VFILES) $(LIBS) 
	$(Q2SH) -t $(MKPROJ) $(Q2SHOPT) -project $(PROJECT) $^

$(PROJECT).sof: $(PROJECT).qsf 
	$(Q2SH) --flow compile $(PROJECT)

########

compile: $(PROJECT).sof
	@echo "**** $(PROJECT).fit.summary" | tee -a $(RESULT)
	@cat $(PROJECT).fit.summary | tee -a $(RESULT)
	@echo "**** $(PROJECT).tan.rpt" | tee -a $(RESULT)
#	@grep "Info: Fmax" $(PROJECT).tan.rpt | tee -a $(RESULT)

download: config-n

config: all
	$(Q2PGM) -c $(CABLE) -m $(PMODE) -o "p;$(WORKDIR)/$(PROJECT).sof"
config-n: # without re-compile
	$(Q2PGM) -c $(CABLE) -m $(PMODE) -o "p;$(WORKDIR)/$(PROJECT).sof"
