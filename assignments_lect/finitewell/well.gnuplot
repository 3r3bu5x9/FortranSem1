a = 1.88972599
b = -1.88972599
c = 1
set xrange[-8:8]
set yrange[0:c]
set arrow from a,0 to a,c nohead linecolor rgb "grey"
set arrow from b,0 to b,c nohead linecolor rgb "grey"
set title "Wavefunction for a particle in finite well(first,even)"
set xlabel "X"
set ylabel "Y"
plot "wellout1.txt" using 1:2 with lines linetype rgb "red" title "region I", "wellout2.txt" using 1:2 with lines linetype rgb "blue" title "region II", "wellout3.txt" using 1:2 with lines linetype rgb "magenta" title "region III"