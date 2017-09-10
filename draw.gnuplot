set term pngcairo 

set output "vizualize.png"
set xlabel "ddl"
plot "data.dat" using 1:2 title "error" with lines lw 3, \
	 "data.dat" using 1:3 title "time" with lines lw 3,

set output "logvizualize.png"
plot "data.dat" using 1:4 title "log(error)" with lines lw 3, \
	 "data.dat" using 1:5 title "log(time)" with lines lw 3,
