#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=runcutadapt     ### Job Name
#SBATCH --output=runcutadapt.out        ### File in which to store job output
#SBATCH --error=runcutadapt.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp      ### Account used for job submission

conda activate QAA

set -e

#Library A: R1
/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_28_4D_mbnl_S20_L008_R1_001.fastq.gz \
 /projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R1_001.fastq.gz

#Library A: R2
/usr/bin/time -v cutadapt -a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_28_4D_mbnl_S20_L008_R2_001.fastq.gz \
 /projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R2_001.fastq.gz

#Library B: R1
/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_2_2B_control_S2_L008_R1_001.fastq.gz \
 /projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz

 #Library B: R2
 /usr/bin/time -v cutadapt -a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_2_2B_control_S2_L008_R2_001.fastq.gz \
 /projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz