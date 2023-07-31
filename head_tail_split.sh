# Script to seperate head, and  tail consisting of atomic positions in Cartesian of a vasp file
#Enter the filename you want to split
FILENAME="Al2O3_avg_latt_par.vasp"

#grep a line before "Cartesian" to count the num of atoms later on
LINE=$(cat $FILENAME | grep -B 1 Cartesian | head -1)
echo atoms: $LINE

#tr command transposes row to column, then awk adds the numbers in 1st column
NUMATOMS=$(echo $LINE | tr ' ' '\n' | awk '{sum+=$1} END {print sum}')
echo total atoms: $NUMATOMS

#prints all atoms after "Cartesian" to a file named tail
grep -A $NUMATOMS Cartesian $FILENAME | tail -$NUMATOMS > tail

#print the tags  before (including) "Cartesian" to a file name head
grep -B 7 Cartesian $FILENAME > head
