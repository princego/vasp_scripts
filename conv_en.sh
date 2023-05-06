## Energy convergence (keep 5 energies in a seperate file named "enrgs")

#!/bin/bash
A='/path/to/directory'
for ((  n=1;  n<=5;  n++  ))
do
    EN=`head -$n $A/enrgs | tail -1`
    mkdir $A/e_$EN
    cp $A/INCAR $A/KPOINTS $A/POSCAR $A/POTCAR $A/8-1.sh $A/e_$EN
    sed -i "s/ENCUT = 500/ENCUT = $EN/g" $A/e_$EN/INCAR
    cd $A/e_$EN
    qsub 8-1.sh
done
