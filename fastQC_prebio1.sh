#!/bin/sh
#
# Set the name of the job
#$ -N fastQCloop
#
# set the maximum memory usage (per slot)
#$ -l h_vmem=12G
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
#$ -o fastqcloop_logfile
#
#$ -cwd

module load fastqc/0.11.2

OUTPUT_PATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/1.QC/3.post_fastqc"
DATA_PATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/1.QC/2.trim"

ls -1 $DATA_PATH | grep .fq | xargs -n1 -P0 -I {} fastqc --outdir $OUTPUT_PATH --threads 4 $DATA_PATH/{}
