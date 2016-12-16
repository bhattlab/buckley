#!/bin/sh
#
# set the name of the job
#$ -N trim
#
# set the maximum memory usage (per slot)
#$ -l h_vmem=10G
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
#$ -o trim_logfile
#
#$ -cwd

module load python/2.7
module load trim_galore/0.4.1

OUTPUT_PATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/1.QC/2.trim2"
PROJECT_PATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/1.QC/1.dedup2"
SAMPLE_NAMES="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/0.data/fastqs2/samples_list.txt"

for x in $(cat $SAMPLE_NAMES)
do
    trim_galore --quality 20 --fastqc --length 60 --output_dir $OUTPUT_PATH --clip_R1 2 --three_prime_clip_R2 4 --paired $PROJECT_PATH/"$x"_nodup_PE1.fastq $PROJECT_PATH/"$x"_nodup_PE2.fastq
done
