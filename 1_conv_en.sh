#!/bin/bash
A=`pwd`
for ((  n=1;  n<=6;  n++  ))
do
        EN=`head -$n $A/enrgs | tail -1`
        mkdir $A/e_$EN
        cp $A/INCAR $A/KPOINTS $A/POSCAR $A/POTCAR $A/job.sh $A/e_$EN
        sed -i "s/ENCUT = 500/ENCUT = $EN/g" $A/e_$EN/INCAR
        cd $A/e_$EN
        qsub job.sh
done
