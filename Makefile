#Standartowe polecenia
all: code2

clean: 
	rm -f code2 *.o *.a *.so *~ *.out

install: 
	sudo apt update
	sudo apt install gcc


#Program główny
code2: code2.c libkwadrat.a libszescian.so
	gcc -o code2 code2.c libkwadrat.a libszescian.so 

libszescian.o: szescian.c
	gcc -fPIC -c szescian.c -o libszescian.o 

libkwadrat.o: kwadrat.c
	gcc -c kwadrat.c -o libkwadrat.o 

libkwadrat.a: libkwadrat.o
	ar rs libkwadrat.a libkwadrat.o

libszescian.so: libszescian.o
	gcc -shared -o libszescian.so libszescian.o





