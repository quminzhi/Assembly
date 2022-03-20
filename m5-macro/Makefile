# Specify c compiler
CC = gcc

# The CFLAGS variable sets the flags for the compiler
# -g         compile with debug info
# -O0        do not optimize generated code
# -std=gnu99 use the C99 standard language definition with GUN extensions
# -Wall      turn on optional warnings (warnflags configures specific diagnostic
CFLAGS = -Og -std=gnu99 -Wall $$warnflags
export warnflags = -Wfloat-equal -Wtype-limits -Wpointer-arith -Wlogical-op -Wshadow -fno-diagnostics-show-option

# The LDFLAGS variable sets for the linker and the LDLIBS variable lists
# additional libraries being linked. The standard libc is linked by default
# and we require no additional libraries or flags, so these are empty
LDFLAGS = 
LDLIBS =

# The line below defines the variable 'PROGRAMS' to name all of the executables
# to be built by make file
PROGRAMS = m5
ASM = asm

# The first target is the default target to be built when there is no argument
# specified. the ‘%’ matches any nonempty substring.
all: $(PROGRAMS) $(ASM)

$(PROGRAMS): $(PROGRAMS).c
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) -o $(PROGRAMS) $(PROGRAMS).c

$(ASM): $(PROGRAMS).asm
	nasm -f elf64 -g -o $(PROGRAMS).o $(PROGRAMS).asm
	ld $(PROGRAMS).o -o $(PROGRAMS)-asm
clean:
	rm -rf *.o *.s $(PROGRAMS) $(PROGRAMS)-asm
