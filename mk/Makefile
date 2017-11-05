
SRCDIR		=.
TOOLTOP		=$(SRCDIR)
VPATH		= $(SRCDIR):$(TOOLTOP):$(SRCDIR)/DAC:$(SRCDIR)/ADC
NSLINC		= -I$(SRCDIR) -I$(SRCDIR)/DAC -I$(SRCDIR)/ADC
ifndef DESIGN
DESIGN		= DE0_CV
endif
TARGET		=
NSLFLAGS  	= -sim -neg_res $(NSLINC)
NSLSCFLAGS	= $(NSLFLAGS) -sc_split_header -sc_trace
VERIOPT		= 
SRCS		= TOP.nsl DAC.nsl MUL28.nsl CNV.nsl MUL28_FP.nsl VGEN.nsl ADC.nsl CALC.nsl ADD.nsl
LIBS		=


#######
# Systemc Env
#######
SCLIBS		=sig_gen.cpp
SCMOD		=FPGA.h LPF.h 
#EXTRA_LIBS	=-X11


CXXFLAGS	= -O3



include $(TOOLTOP)/mk/env.mk
include $(TOOLTOP)/mk/nsl.mk
include $(TOOLTOP)/mk/quartus.mk
include $(TOOLTOP)/mk/iverilog.mk
include $(TOOLTOP)/mk/verilator.mk
include $(TOOLTOP)/mk/systemc.mk

clean:
	rm -rf - $(WORKDIR)
	rm -rf - $(DEBUGDIR)
