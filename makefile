#makefile : build the project1.out program
FC = gfortran
FFLAGS = -Wall -pedantic -L/usr/local/lib -llapack -lblas -c
LDFLAGS =
FILES = 
FNULL = /dev/null

install:
	apt update && apt upgrade && apt dist-upgrade
	apt install gnuplot gfortran 

all: vizualize.png

functions.mod functions.o: functions.f90
	$(FC) $(FFLAGS) functions.f90

resol.mod resol.o: resol.f90 functions.mod
	$(FC) $(FFLAGS) resol.f90

main.o: main.f90 functions.mod resol.mod
	$(FC) $(FFLAGS) main.f90

project1.out: main.o functions.o resol.o
	$(FC) -o project1.out main.o functions.o resol.o

data.dat: project1.out
	./project1.out > data.dat

vizualize.png: data.dat
	gnuplot draw.gnuplot

clean:
	-rm *.o *.mod *~

fclean: clean
	-rm *.out *.dat *.png

.PHONY: install
