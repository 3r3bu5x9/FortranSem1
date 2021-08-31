a = 1.88972599
b = -1.88972599
c = 1
set xrange[-8:8]
set yrange[0:c]
set arrow from a,0 to a,c nohead
set arrow from b,0 to b,c nohead
plot "wellout.txt" using 1:2 with dots