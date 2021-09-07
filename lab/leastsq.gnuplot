set xrange [0:20]
set yrange [0:40]
set title "Least square fit"
set xlabel "X axis"
set ylabel "Y axis"
plot "leastsqout.txt" using 1:2 with points title "input", "leastsqout.txt" using 1:3 with lines title "output"