#!/bin/bash
A=`pwd`
ENCUT=700 #energy obtained from ENCUT convergence
for ((  n=1;  n<=9;  n++  ))
do
        KP=`head -$n $A/kpts | tail -1`
        mkdir $A/k_$KP
        cp $A/INCAR $A/KPOINTS $A/POSCAR $A/POTCAR $A/job.sh $A/k_$KP
        sed -i "s/ENCUT = 500/ENCUT = $ENCUT/g" $A/k_$KP/INCAR

#setting k-points
        cd $A/k_$KP
        KP1=`echo $KP | awk -F 'x' '{print $1" "$2" "$3}'`
        sed -i "4 s/.*/ $KP1/g" KPOINTS
        qsub job.sh
done
