#oneCodex Upload script

#   First, ensure that PATH variable in .bash_profile
#   includes path to python 2.7, which in my case is
#   local rather than on the cluster.
#   Also, ensure that .bash_profile includes
#   export ONECODEX_API_KEY=*****.

#!/bin/sh
#
# Set the name of the job
#$ -N oneCodexUpload
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
#$ -o oneCodex_logfile
#
#$ -cwd
#$ -V

DATA_PATH="/srv/gsfs0/projects/bhatt/mbuckley/prebiotic/1.QC/4.concat2"

for sample in $(ls $DATA_PATH)
do
    onecodex upload $DATA_PATH/"$sample"
done
