## Energy convergence
#!/bin/bash
A='/home/prince/testing/bzo'
for ((  n=1;  n<=5;  n++  ))
do
    EN=`head -$n $A/enrgs | tail -1`
    mkdir $A/$EN
    cp $A/INCAR $A/KPOINTS $A/POSCAR $A/POTCAR $A/8-1.sh $A/$EN
    sed -i "s/ENCUT = 500/ENCUT = $EN/g" $A/$EN/INCAR
    cd $A/$EN
    qsub 8-1.sh
done
