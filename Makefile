all: main

main: main.c libbar.dylib stage2/libfoo.dylib
	clang main.c -L. -lbar -Lstage2 -lfoo -o main

libbar.dylib: bar.c stage1/libfoo.dylib
	clang -dynamiclib bar.c -rpath stage1 -L stage1 -lfoo -o libbar.dylib

stage1/libfoo.dylib: foo-1.c
	mkdir -p stage1
	clang -dynamiclib foo-1.c -o stage1/libfoo.dylib

stage2/libfoo.dylib: foo-2.c
	mkdir -p stage2
	clang -dynamiclib foo-2.c -o stage2/libfoo.dylib

clean:
	rm -f main libbar.dylib stage1/*.dylib stage2/*.dylib
