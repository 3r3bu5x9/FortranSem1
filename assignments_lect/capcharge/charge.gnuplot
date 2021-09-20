set xrange[1:20]
set title "Charge vs Time"
set ylabel "Q in coulombs"
set xlabel "T in seconds"
plot "capcharge.txt" using 1:4 with lines title "Charge"