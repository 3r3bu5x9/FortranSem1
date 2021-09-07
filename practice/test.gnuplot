set xrange [-1:1]
set yrange [-5:5]
set xlabel "X axis"
set ylabel "Y axis"
set title "Various graphs"
set xzeroaxis
set yzeroaxis
plot 2*x+1 with lines title "2x+1", exp(x) with lines title "exp(x)"