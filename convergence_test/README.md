# Automated Energy and KPOINT convergence test
The directory needs the following files:
- VASP input files: `INCAR`, `KPOINTS`, `POSCAR`, `POTCAR`, `job.sh` (submission script)
- Scripts given in this directory: `1_conv_en.sh`, `2_check_en.sh`, `3_conv_kp.sh`, `4_check_kp.sh`, `enrgs`, `kpts`, `plot_en.gpl`, `plot_kp.gpl`

## Energy convergence
Enter `bash 1_conv_en.sh` in the terminal. The script will automatically create directories with energies from `enrgs` file you have, and submits jobs. <br>
After all calculations finishes enter `bash 2_check_en.sh`. This script will read total energies, calculates energy per atom, and energy difference between the consecutive energies, and writes to a `conv_en.csv` file, and also plots using the GNU plot.

## KPOINT convergence
First, go to the line 4 of `3_conv_kp.sh` file and set your converged ENCUT value from the energy convergence test above. <br>
Enter `bash 3_conv_kp.sh` in the terminal. The script will automatically create directories with kpoints from `kpts` file you have, and submits jobs. <br>
After all calculations finishes enter `bash 4_check_kp.sh`. This script will read total energies, calculates energy per atom, and energy difference between the consecutive energies, and writes to a `conv_kp.csv` file, and also plots using the GNU plot.

### Additional tips:
- If you are checking energy convergence for 5 energies, then in the `1_conv_en.sh` file line 3, the loop should run from 1 to 5. <br>
- After performing energy convergence for 5 energies, but still didn't reach convergence, then add the 6th energy to the 6th row in `enrgs` file, then in the `1_conv_en.sh` file line 3, the loop should run from 6 to 6. This will submit just one job.
- Depending on the number of times the loop is run in `1_conv_en.sh`, the same number of loops should be in `2_check_en.sh`. The same applies to kpoint convergence also.
