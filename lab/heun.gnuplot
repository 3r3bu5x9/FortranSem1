set title "Heun's method"
set xlabel "X"
set ylabel "Y"
plot "heunout.txt" using 1:2 title "approx", exp(x) with lines