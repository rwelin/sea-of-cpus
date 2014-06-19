set terminal png
set output 'comp64.png'

set autoscale

set ylabel "Fabric resources per core"
set y2label "Time (ns)"

set grid y
set yrange[700:1400]
set xtics ("Chain" 1, "Bi-chain" 2, "2D grid" 3) 
set ytics nomirror
set y2range[3:5]
set y2tics 0, 0.5

set datafile separator ","

plot "comp64.csv" using ($2/64) title "Slice Registers" with linespoints,\
    "comp64.csv" using ($3/64) title "Slice LUTs" with linespoints,\
    "comp64.csv" using 4 axes x1y2 title "Clock period" with linespoints
