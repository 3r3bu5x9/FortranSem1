set xrange [0:10]
set yrange [0:40]
set title "Graph2"
set xzeroaxis
set yzeroaxis
plot "data.txt" using 1:2 with linespoint title "col2 vs col1", 5*x+1 with lines title "5x+1"