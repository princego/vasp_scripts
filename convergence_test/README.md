# Energy and KPOINT convergence test
The directory needs the following files:
- VASP input files: `INCAR`, `KPOINTS`, `POSCAR`, `POTCAR`, `job.sh` (submission script)
- Scripts given in this directory: `1_conv_en.sh`, `2_check_en.sh`, `3_conv_kp.sh`, `4_check_kp.sh`, `enrgs`, `kpts`, `plot_en.gpl`, `plot_kp.gpl`

## Energy convergence
Enter `bash 1_conv_en.sh` in the terminal. The script will automatically create directories with energies from `enrgs` file you have, and submits jobs. <br>
After all calculations finishes enter `bash 2_check_en.sh1`. This script will read total energies, calcualtes energy per atom, and energy difference between the consecutive energies, and writes in a csv file
