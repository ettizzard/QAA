#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=htseq-count     ### Job Name
#SBATCH --output=htseq-count.out        ### File in which to store job output
#SBATCH --error=htseq-count.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp      ### Account used for job submission

conda activate QAA

set -e

#Forward Stranded
/usr/bin/time -v htseq-count --stranded=yes \
 Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b_LibAAligned.out.sam \
 Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b_LibBAligned.out.sam \
 ./STAR/Mus_musculus.GRCm39.112.gtf

#Reverse Stranded
/usr/bin/time -v htseq-count --stranded=reverse \
 Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b_LibAAligned.out.sam \
 Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b_LibBAligned.out.sam \
 ./STAR/Mus_musculus.GRCm39.112.gtf