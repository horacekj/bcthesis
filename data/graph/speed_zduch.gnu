set style line 1 lc rgb '#FF9933' lt 19 lw 2.5
set xlabel "Čas [s]"
set ylabel "Perioda signálu [ticky krystalu]"
set key left top
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

set datafile sep ','

set terminal epslatex size 13cm,8cm color colortext
set output output_file

plot input_file using 1:3 with lines ls 1 title "Zpomalený pohyb", '' using 1:3 with points pointtype 5 lc rgb '#ff9933' notitle
