CFLAGS=-emit-llvm -g
COMPILER=clang

all: rename_symbols_pass linked.bc

.PHONY: vuln.bc
vuln.bc:
	make -C vuln
	PREFIX=vuln opt -load-pass-plugin rename_symbols_pass/Build/libhw1.so -passes='hw1' vuln/linked.bc -o vuln.bc &> /dev/null

.PHONY: patched.bc
patched.bc:
	make -C patched
	PREFIX=patched opt -load-pass-plugin rename_symbols_pass/Build/libhw1.so -passes='hw1' patched/linked.bc -o patched.bc &> /dev/null

linked.bc: vuln.bc patched.bc superglue.bc
	llvm-link vuln.bc patched.bc superglue.bc -o linked.bc
	llvm-dis linked.bc
	vim -s fix.vim linked.ll
	llvm-as linked.ll

superglue.bc: superglue.c
	$(COMPILER) -c -Iinc $(CFLAGS) superglue.c -I/usr/include/klee -target i386-pc-linux-gnu-elf

.PHONY: rename_symbols_pass
rename_symbols_pass:
	cd rename_symbols_pass; cmake -B Build
	make -C rename_symbols_pass/Build

clean:
	rm -f vuln.bc
	rm -f patched.bc
	make -C vuln clean
	make -C patched clean
	rm -f linked.bc
	rm -rf klee-*
	rm -rf superglue.bc
