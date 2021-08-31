set xlabel "X"
set ylabel "Y"
plot "leastsqout.txt" using 1:2 with point title "Y actual", "leastsqout.txt" using 1:3 with line title "Y est"