.PHONY: clean
.SUFFIXES: .c .o .a .so

.c.o:
	gcc -c $<
.o:
	gcc -o $@ $^

lib%.a: lib%.o
	ar rs $@ $<
lib%.so: lib%.o
	gcc -shared -o $@ $<
lib%.o: %.c
	gcc -fPIC -c $< -o $@ 
%: %.o lib%.a lib%.so
	gcc -o $@ $^

#Standartowe polecenia
all: code2
install:
        sudo apt update
        sudo apt install gcc

clean: 
	rm -f code2 *.o *.a *.so *~ *.out

#Program główny
code2: code2.o libkwadrat.a libszescian.so 

libszescian.o: szescian.c
libkwadrat.o: kwadrat.c

libkwadrat.a: libkwadrat.o
libszescian.so: libszescian.o




