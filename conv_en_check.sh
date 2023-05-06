## check whether energy is converged
#!/bin/bash
A='/path_to_directory'
rm conv_en.csv
for ((  n=1;  n<=5;  n++  ))
do
    EN=`head -$n $A/enrgs | tail -1`
#check whether reached required accuracy
    reached=$(grep "reached" $A/$EN/log)
    echo "$EN: $reached"
#checking total energy and energy per atom
    totE=$(grep "free  energy   TOTEN" $A/$EN/OUTCAR|awk END{print}|awk '{print $5}')
    nions=$(grep NIONS $A/$EN/OUTCAR | awk '{print $12}')
    epa=$(echo "$totE / $nions" | bc -l)
    echo "TOTEN:" $totE '|' "Energy_per_atom:" $epa
    echo $EN,$totE,$epa >> conv_en
done

#calculating energy difference
awk -F ',' 'NR==1{s=$3;next}{print $3-s;s=$3}' conv_en > conv_en_diff
paste -d ',' conv_en conv_en_diff > conv_en.csv
#adding header
sed -i '1 i energy,toten,energy_per_atom,ediff_epa' conv_en.csv
#remove temporary files
rm conv_en conv_en_diff
#display on screen
cat conv_en.csv