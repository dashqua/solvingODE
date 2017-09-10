# solvingODE
A Fortran based program which computes numerically a physical phenomenon described with an equation.
Just ask for the relation with math.

This is an occasion to practice Fortran 90 . The code can help to get used to the F90 statements (use module, allocation, data structure,...) and the features of a makefile. Feel free, to copy or get inspired by my code.
Plus, I didn't feel the need to organize my files into several directories because I assume the few files are self-explanatory.

Installation
-
  git clone https://github.com/dashqua/solvingODE.git  
  cd solvingODE  

Use
-
I suggest to start with:  
  make install  
Then simply run:  
  make  
To clean the current directory:  
  make clean  
Further cleaning:  
  make fclean  

Data produced
-
The program mainly resolves a system of equation: Ax = b, where A is a tridiagonal matrix (then I used TDMA/Thomas Algorithm).
The output though is the plot of the time of computation and the value of the error versus the degree of liberty, that is to say the number of equations or the dimension of the squarred matrix. The whole data is eventually plotted into 2 files (normal and log representation) as following:  
![GitHub Logo](/vizualize.png)  
![GitHub Logo](/logvizualize.png)  
