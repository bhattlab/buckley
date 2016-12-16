#!/bin/sh
#Set the name of the job
#$ -N dedup_pb1
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
#$ -o dedup_logfile
#
#$ -cwd

OUTPUT_PATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/1.QC/1.dedup2"
DATA_PATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/0.data/fastqs2"

for foo in $(cat $DATA_PATH/samples_list.txt)
do
   /srv/gsfs0/projects/bhatt/moss/tools/qc/Super-Deduper/super_deduper --start 15 --length 80 --output-prefix $OUTPUT_PATH/"$foo" --read1 $DATA_PATH/"$foo"_R1_001.fastq.gz --read2 $DATA_PATH/"$foo"_R2_001.fastq.gz
done

# Joyce: --start 5 --length 90
