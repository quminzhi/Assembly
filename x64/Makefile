bin = recipes

CFLAGS = -O0 -g -Wall -Werror

all: $(bin)

$(bin): $(bin).o
	gcc $(bin).o -o $(bin)

$(bin).o: $(bin).c
	gcc $(CFLAGS) -c $(bin).c -o $(bin).o

run:
	./$(bin)

asm:
	gcc $(CFLAGS) -c $(bin).c -o $(bin).o
	objdump -d -S $(bin).o > $(bin).s

clean:
	rm -rf *.o *.s $(bin)
