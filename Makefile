#Standartowe polecenia
all: code2

clean: 
	rm -f code2 *.o *.a *.so *~ *.out

install:
        sudo apt update
        sudo apt install gcc
		
#Program główny
code2: code2.c libkwadrat.a libszescian.so
	gcc -o $@ $^ 

libszescian.o: szescian.c
	gcc -fPIC -c $< -o $@

libkwadrat.o: kwadrat.c
	gcc -c $< -o $@ 

libkwadrat.a: libkwadrat.o
	ar rs $@ $<

libszescian.so: libszescian.o
	gcc -shared -o $@ $<






