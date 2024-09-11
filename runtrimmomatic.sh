#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=runtrimmomatic     ### Job Name
#SBATCH --output=runtrimmomatic.out        ### File in which to store job output
#SBATCH --error=runtrimmomatic.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp      ### Account used for job submission

conda activate QAA

set -e

#Library A
/usr/bin/time -v java -jar /projects/bgmp/tizzard/miniforge3/envs/QAA/share/trimmomatic/trimmomatic.jar PE \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_28_4D_mbnl_S20_L008_R1_001.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_28_4D_mbnl_S20_L008_R2_001.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_28_4D_mbnl_S20_L008_R1_001_paired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_28_4D_mbnl_S20_L008_R1_001_unpaired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_28_4D_mbnl_S20_L008_R2_001_paired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_28_4D_mbnl_S20_L008_R2_001_unpaired.fastq.gz \
 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

#Library B
/usr/bin/time -v java -jar /projects/bgmp/tizzard/miniforge3/envs/QAA/share/trimmomatic/trimmomatic.jar PE \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_2_2B_control_S2_L008_R1_001.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/adapter_trimmed_fastqs/adapter_trimmed_2_2B_control_S2_L008_R2_001.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_2_2B_control_S2_L008_R1_001_paired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_2_2B_control_S2_L008_R1_001_unpaired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_2_2B_control_S2_L008_R2_001_paired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_2_2B_control_S2_L008_R2_001_unpaired.fastq.gz \
 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35