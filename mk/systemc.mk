
##################################################################################
#SystemC
##################################################################################


SCFILES		=$(SRCS:%.nsl=%.sc)
INCDIR		=$(SYSTEMC_INCLUDE_DIRS) -I$(DEBUGDIR) -I$(SRCDIR) -I$(TOOLTOP)
LIBDIR		=$(SYSTEMC_LIBRARY_DIRS)
SCFLAGS		= -g
SCLINK		=-lsystemc-ams -lsystemc $(EXTRA_LIBS)
SCOBJS		=$(SCFILES:%.sc=%.o) $(SCLIBS:%.cpp=%.o)

NSLSCFLAGS	= $(NSLFLAGS) -sc_split_header -sc_trace


%.scsim:
	@if [ ! -d $(DEBUGDIR) ]; then \
		echo mkdir $(DEBUGDIR); \
		mkdir $(DEBUGDIR); \
	fi
	( cd $(DEBUGDIR); make -f ../Makefile SRCDIR=.. PROJECT=$(@:%.scsim=%) $(@:%.scsim=%).run )


%.sc:%.nsl
	$(NSL2SC) $(NSLSCFLAGS) $< -o $@
	echo '#include "NSL_SC.cpp"'>> $*.sc

$(PROJECT)_sim.cpp:$(PROJECT)_sim.nsl $(SCFILES)
	$(NSL2SC) $(NSLSCFLAGS) -scsim2 -target $* $< -o $@

$(PROJECT)_sim.o:$(PROJECT)_sim.cpp $(SCFILES)
	$(CXX) $(CXXFLAGS) $(SCFLAGS) $(INCDIR) -o $@ -c $< 

%.o:%.cpp
	$(CXX) $(CXXFLAGS) $(SCFLAGS) $(INCDIR) -o $@ -c $< 

%.o:%.sc NSL_SC.cpp
	$(CXX) $(CXXFLAGS) $(SCFLAGS) -x c++ $(INCDIR) -o $@ -c $< 

$(PROJECT).exe:$(PROJECT)_sim.o $(SCOBJS) NSL_SC.cpp $(SCMOD)
	$(CXX) $(CXXFLAGS) $(SCFLAGS) $(INCDIR) $(LIBDIR) $< $(SCLINK) $(SCOBJS) -o $@
	#$(CXX) $(CXXFLAGS) $(SCFLAGS) $(INCDIR) $(LIBDIR) $< $(SCFILES:%.cpp=../%.cpp) -o $@
	#$(CXX) $(CXXFLAGS) -x c++ -g $(INCDIR) $(LIBDIR) $< -lsystemc-ams -lsystemc $(SCFILES:%.cpp=../%.cpp)  -o $@
	#$(CXX) $(CXXFLAGS) $(INCDIR) $(LIBDIR) -o $@ $(LIBSC) $< $(SCFILES)

$(PROJECT).run: $(PROJECT).exe
	$(DEBUGDIR)/$(PROJECT).exe
