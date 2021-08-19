all: linked.bc

input-rx_brake_routine.bc: input-rx_brake_routine.ll
	llvm-as input-rx_brake_routine.ll

glue.bc: glue.c
	clang -emit-llvm -g -c glue.c -target i386-pc-linux-gnu-elf

linked.bc: input-rx_brake_routine.bc glue.bc
	llvm-link input-rx_brake_routine.bc glue.bc -o linked.bc

clean:
	rm -f input-rx_brake_routine.bc
	rm -f glue.bc
	rm -f linked.bc
	rm -rf klee-*
