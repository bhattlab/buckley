#!/bin/sh
#Set the name of the job
#$ -N bcl2
#
# set the maximum memory usage (per slot)
#$ -l h_vmem=32G
#
# set the maximum run time
#$ -l h_rt=6:00:00
#
# run a parallel job using pthreads or other shared-memory API
#$ -pe shm 4
#
# send mail when job ends or aborts
#$ -m ea
#
# specify an email address
#$ -M buckley7@stanford.edu
#
# specify the account name
#$ -A bhatt
#
# check for errors in the job submission options
#$ -w w
#
# output logfile
#$ -o bcl2_log
#
#$ -cwd

module load bcl2fastq2/2.17.1.14

DATAPATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/0.data"
bcl2fastq --runfolder-dir  $DATAPATH/Run2_bcl2 --output-dir $DATAPATH/fastqs2 --sample-sheet $DATAPATH/Run2_bcl2/SampleSheet.csv --use-bases-mask 1:y101,I8,I8,y101 --ignore-missing-bcls --ignore-missing-filter --ignore-missing-positions 
