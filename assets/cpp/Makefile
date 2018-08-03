CC=cc
CCFLAGS=-std=c11 -g
LDFLAGS=-g
EXE=main


SRC=$(wildcard *.c)
OBJS=$(SRC:.c=.o)

main: $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

run: main
	./$(EXE)

taco:
	@echo $(OBJS)

.PHONY: clean
clean:
	@echo "Cleaning..."
	@rm -f $(OBJS) $(EXE)
	@rm -rf main.dSYM
	@echo "Done cleaning"

