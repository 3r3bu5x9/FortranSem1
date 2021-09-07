set xrange [0:10]
set yrange [0:50]
set title "Graph1"
set xzeroaxis
set yzeroaxis
plot "data.txt" using 1:2 with linespoint title "col2 vs col1", "data.txt" using 1:3 with linespoint title "col3 vs col1"