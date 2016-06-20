Dat=/tmp/$$
cat<<EOF> ${Dat}.dat
300     400
300     250
212     140
170     180
150     110
150     249
130     110
140     125
140     160
160     190
80      60
80      75
80      110
90      150
80      40
70      70
80      80
70      120
70      40
50      40
50      50
40      50
55      45
50      80
40      22
40      27
30      31
40      20
40      25
30      29
30      30
25      19
25      24
29      10
20      20
20      30
10      9
10      11
10      13
15       5
15       10
11       1
5        5
5        10
1        1
EOF
gawk '{print $2/$1}' ${Dat}.dat | sort -n | cat -n | column -t
gnuplot<<EOF
set size 0.5,0.5
set xlabel "Estimated"
set nokey
set ylabel "Actual"
set title "KLOC"
set arrow 1 from 0,0 to 325,325 nohead
set terminal postscript eps "Helvetica" 12
set output "${Dat}.eps"
set xrange [0:325]
set yrange [0:440]
plot "${Dat}.dat
EOF
epstopdf  ${Dat}.eps
mv  ${Dat}.pdf data.pdf
