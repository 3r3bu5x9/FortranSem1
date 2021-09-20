set xrange [0:5]
set yrange [0:20]
set title "Lagrange interpolation"
set xlabel "X axis"
set ylabel "Y axis"
plot "lagrangeinin.txt" using 1:2 with points pointtype 4 title "input", "lagrangeout.txt" using 1:2 with points pointtype 5 title "output"