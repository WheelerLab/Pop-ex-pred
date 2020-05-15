#!/bin/bash
#PBS -N testjob2
#PBS -S /bin/bash
#PBS -l walltime=24:00:00
#PBS -l nodes=1:ppn=2
#PBS -l mem=8gb
#PBS -o logs/${PBS_JOBNAME}.o${PBS_JOBID}.log
#PBS -e logs/${PBS_JOBNAME}.e${PBS_JOBID}.err
cd /home/egeoffroy/model_scripts

bash  Run_Combine_Dosages.sh

echo "Hi ${USER}, your script ran!" > testjob_output2.txt
echo "Done" >> testjob_output2.txt
