#!/bin/bash

#SBATCH --account=bgmp   ### change this to your actual account for charging
#SBATCH --partition=bgmp     ### queue to submit to
#SBATCH --job-name=alignreads    ### job name
#SBATCH --output=alignreads.out   ### file in which to store job stdout
#SBATCH --error=alignreads.err    ### file in which to store job stderr
#SBATCH --time=60:00                ### wall-clock time limit, in minutes
#SBATCH --nodes=1               ### number of nodes to use
#SBATCH --cpus-per-task=8       ### number of cores for each task

conda activate QAA

set -e

#Library A
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_28_4D_mbnl_S20_L008_R1_001_paired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_28_4D_mbnl_S20_L008_R2_001_paired.fastq.gz \
 --genomeDir /projects/bgmp/tizzard/bioinfo/Bi623/QAA/STAR/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
 --outFileNamePrefix Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b_LibA


#Library B
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_2_2B_control_S2_L008_R1_001_paired.fastq.gz \
 /projects/bgmp/tizzard/bioinfo/Bi623/QAA/quality_trimmed_fastqs/qual_trimmed_2_2B_control_S2_L008_R2_001_paired.fastq.gz \
 --genomeDir /projects/bgmp/tizzard/bioinfo/Bi623/QAA/STAR/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
 --outFileNamePrefix Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b_LibB