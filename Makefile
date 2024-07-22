CC = mpicc
CFLAGS = -O3 -Wall -Wextra

.PHONY: all clean

all: mpitrace.so

mpitrace.so: mpitrace.c
	$(CC) $(CFLAGS) -fPIC -shared -o $@ $^

mpitrace.c: mpi-function-list.txt
	./henkan.rb < mpi-function-list.txt > mpitrace.c

clean:
	rm -f *.o *.so
