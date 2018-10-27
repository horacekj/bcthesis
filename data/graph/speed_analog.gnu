set style line 1 lc rgb '#EE7700' lt 19 lw 2.5
set style line 2 lc rgb '#003999' lt 17 lw 2.5
set xlabel "Čas [s]"
set ylabel "Perioda signálu [ticky krystalu]" tc rgb '#EE7700'
set ytics nomirror tc rgb '#EE7700'
set y2label "Modelová rychlost [km/h]" tc rgb '#003999'
set y2tics nomirror tc rgb '#003999'
set key left top
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12
set xrange [0:70]

set datafile sep ','

set terminal epslatex size 13cm,8cm color colortext
set output output_file

plot input_file using 1:3 axis x1y1 with lines ls 1 notitle, '' using 1:2 axes x1y2 with lines ls 2 notitle
