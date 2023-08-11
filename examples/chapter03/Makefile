CU_APPS=nestedHelloWorld nestedReduce nestedReduce2 nestedReduceNosync \
	    reduceInteger simpleDeviceQuery simpleDivergence sumMatrix
C_APPS=

all: ${C_APPS} ${CU_APPS}

%: %.cu
	nvcc -O2 -arch=sm_90 -o $@ $< -lcudadevrt --relocatable-device-code true
%: %.c
	g++ -O2 -std=c++17 -o $@ $<
clean:
	rm -f ${CU_APPS} ${C_APPS}
