set title "Euler's method"
set xlabel "X"
set ylabel "Y"
plot "eulerout.txt" using 1:2 title "approx", exp(x) with lines