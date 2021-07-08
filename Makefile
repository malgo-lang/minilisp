CFLAGS=-O3 -flto `pkg-config --cflags --libs bdw-gc`
LIB_PATH=./base

minilisp: .malgo-work/build/Main.ll .malgo-work/build/Builtin.ll .malgo-work/build/Prelude.ll .malgo-work/build/runtime.c .malgo-work/build/native.c
	clang $(CFLAGS) .malgo-work/build/Main.ll .malgo-work/build/Builtin.ll .malgo-work/build/Prelude.ll .malgo-work/build/runtime.c .malgo-work/build/native.c -o minilisp

.malgo-work/build/Main.ll: src/Main.mlg .malgo-work/build/Builtin.ll .malgo-work/build/Prelude.ll
	mkdir -p .malgo-work/build
	malgo to-ll src/Main.mlg -o .malgo-work/build/Main.ll

.malgo-work/build/Builtin.ll: $(LIB_PATH)/Builtin.mlg
	mkdir -p .malgo-work/build
	malgo to-ll $(LIB_PATH)/Builtin.mlg -o .malgo-work/build/Builtin.ll

.malgo-work/build/Prelude.ll: $(LIB_PATH)/Prelude.mlg .malgo-work/build/Builtin.ll
	mkdir -p .malgo-work/build
	malgo to-ll $(LIB_PATH)/Prelude.mlg -o .malgo-work/build/Prelude.ll

.malgo-work/build/runtime.c: $(LIB_PATH)/runtime.c
	mkdir -p .malgo-work/build
	cp $(LIB_PATH)/runtime.c .malgo-work/build/runtime.c

.malgo-work/build/native.c: src/native.c
	mkdir -p .malgo-work/build
	cp src/native.c .malgo-work/build/native.c

.PHONY: clean

clean:
	rm minilisp .malgo-work/build/Main.ll .malgo-work/build/Main.mlgi .malgo-work/build/Builtin.ll .malgo-work/build/Builtin.mlgi .malgo-work/build/Prelude.ll .malgo-work/build/Prelude.mlgi
