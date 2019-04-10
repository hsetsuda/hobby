# compile the macro which used c+11 library and compiler
# and for gaus_random_number.cxx
#Target = monte_poisson_true
#Target = MonteCarlo_poisson
Target = MonteCarlo_poissonV2

ObjSuf = .o
SrcSuf = .cxx

CFLAGS = -std=c++11 
CFLAGS += $(shell root-config --cflags)

LDFLAGS =  $(shell root-config --glibs)

TargetSrc = $(Target:%=%$(SrcSuf))
TargetObj = $(Target:%=%$(ObjSuf))

all	: $(Target)

$(Target) : $(TargetObj)
	$(CXX) -o $@ $@.o $(LDFLAGS)

.cxx.o	:
	$(CXX) $(CFLAGS) -c -o $@ $<

.SUFFIXES: .o .cxx

clean	:
	rm -f *.o
	rm -f *~
	rm -f ../$(Target)
