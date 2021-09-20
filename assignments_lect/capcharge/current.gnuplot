set xrange[1:20]
set title "Current vs Time"
set ylabel "Current in amperes"
set xlabel "T in seconds"
plot "capcharge.txt" using 1:2 with lines title "current"
