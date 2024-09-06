#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=qsdist     ### Job Name
#SBATCH --output=qsdist.out        ### File in which to store job output
#SBATCH --error=qsdist.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp      ### Account used for job submission

conda activate bgmp_py312

set -e

/usr/bin/time -v /home/tizzard/bgmp/bioinfo/Bi622/Demultiplex/Assignment-the-first/perbaseqsdistributions.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R1_001.fastq.gz -l 101 -r 1

/usr/bin/time -v /home/tizzard/bgmp/bioinfo/Bi622/Demultiplex/Assignment-the-first/perbaseqsdistributions.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R2_001.fastq.gz -l 101 -r 2

/usr/bin/time -v /home/tizzard/bgmp/bioinfo/Bi622/Demultiplex/Assignment-the-first/perbaseqsdistributions.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz -l 101 -r 1

/usr/bin/time -v /home/tizzard/bgmp/bioinfo/Bi622/Demultiplex/Assignment-the-first/perbaseqsdistributions.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz -l 101 -r 1