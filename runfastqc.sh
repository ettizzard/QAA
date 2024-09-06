#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=runfastqc     ### Job Name
#SBATCH --output=runfastqc.out        ### File in which to store job output
#SBATCH --error=runfastqc.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp      ### Account used for job submission

conda activate QAA

set -e

/usr/bin/time -v fastqc -o ./fastqc_output/ -f fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R1_001.fastq.gz

/usr/bin/time -v fastqc -o ./fastqc_output/ -f fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R2_001.fastq.gz

/usr/bin/time -v fastqc -o ./fastqc_output/ -f fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz

/usr/bin/time -v fastqc -o ./fastqc_output/ -f fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz 