CC = cc
CFLAGS = -g

PROGS = code2 

.PHONY: clean
.SUFFIXES: .c .o .a .so

.c.o:
	$(CC) $(CFLAGS) -c $<
.o:
	$(CC) $(CFLAGS) -o $@ $^

lib%.a: lib%.o
	$(AR) rsc $@ $<
lib%.so: lib%.o
	$(CC) $(CFLAGS) -shared -o $@ $<
lib%.o: %.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@ 
%: %.o lib%.a lib%.so
	$(CC) $(CFLAGS) -o $@ $^

#Standartowe polecenia

all: $(PROGS)

install: 
	sudo apt update
	sudo apt install gcc

clean: 
	$(RM) $(PROGS) *.o *.a *.so *~ *.out
#Program główny
code2: code2.o libkwadrat.a libszescian.so 

libszescian.o: szescian.c
libkwadrat.o: kwadrat.c

libkwadrat.a: libkwadrat.o
libszescian.so: libszescian.o





