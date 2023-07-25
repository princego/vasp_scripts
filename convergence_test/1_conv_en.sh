#!/bin/bash
A=`pwd`
for ((  n=1;  n<=6;  n++  ))
do
        EN=`head -$n $A/enrgs | tail -1`
        mkdir $A/e_$EN
        cp $A/INCAR $A/KPOINTS $A/POSCAR $A/POTCAR $A/e_$EN
        sed -i "/ENCUT/c\   ENCUT  = $EN" $A/e_$EN/INCAR
        cd $A/e_$EN
        qsub ~/bin/8-2.sh
        cd $A
done
