set terminal png
set output 'bichain_vary_length.png'

set autoscale
set xlabel "Chain length"

set ylabel "Fabric resources per core"
set y2label "Time (ns)"

set yrange[800:1300]

set ytics nomirror
set y2range[2:5]
set y2tics 0, 0.5

set style fill solid border -1
set style histogram cluster gap 1
set style data linespoints

set datafile separator ","

plot "bichain_vary_length.csv" using 1:($2/$1) title "Slice Registers",\
    "bichain_vary_length.csv" using 1:($3/$1) title "Slice LUTs",\
    "bichain_vary_length.csv" using 1:4 axes x1y2 title "Clock period"
