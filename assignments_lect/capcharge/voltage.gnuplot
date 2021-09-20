set xrange[1:20]
set title "Voltage vs Time"
set ylabel "V in volts"
set xlabel "T in seconds"
plot "capcharge.txt" using 1:3 with lines title "Voltage"