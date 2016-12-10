data() { cat <<EOF
-0.6
-0.44
-0.4
-0.13
0.05
0.07
0.0909091
0.10
0.333333
0.344828
0.5
0.5
0.54
0.55
0.571429
0.625
0.64
0.660377
0.666667
0.675
0.69
0.733333
0.75
0.76
0.78
0.8
0.818182
0.833333
0.846154
0.892857
0.9
0.9375
0.95
0.96
0.966667
1
1
1
1
1
1
1
1.03333
1.05882
1.1
1.14286
1.1875
1.25
1.3
1.33333
1.375
1.5
1.6
1.66
1.66667
1.71429
2.06
2.36
EOF
}
data > /tmp/dat

gnuplot<<EOF
set nokey
set label "median" at 5,0.93
set label "90th" at 5,1.83
set arrow 1 from 0,0.84 to 60,0.84 nohead lt 0
set arrow 2 from 0,1.71 to 60,1.71 nohead lt 0

set terminal postscript eps "Helvetica" 12
set size 0.5,0.5
set xlabel "all errors, sorted"
set ylabel "actual / esitmated LOC"
set output "all.eps
plot "/tmp/dat" with lines lt 1
EOF
epstopdf all.eps
