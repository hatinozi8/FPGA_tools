
ifndef SRCDIR
SRCDIR	= .
endif
WORKDIR		= $(SRCDIR)/work
DEBUGDIR	= $(SRCDIR)/debug
PROJECT		= $(DESIGN)

SYNTHSRCS	= $(PROJECT).nsl $(SRCS)
VFILES 		= $(SYNTHSRCS:%.nsl=%.v) 
RESULT		= result.txt

SIMVFILES	= $(SRCS:%.nsl=%.v)

