#!/bin/bash

#SBATCH --account=bgmp   ### change this to your actual account for charging
#SBATCH --partition=bgmp     ### queue to submit to
#SBATCH --job-name=genomegen    ### job name
#SBATCH --output=genomegen.out   ### file in which to store job stdout
#SBATCH --error=genomegen.err    ### file in which to store job stderr
#SBATCH --time=60:00                ### wall-clock time limit, in minutes
#SBATCH --nodes=1               ### number of nodes to use
#SBATCH --cpus-per-task=8       ### number of cores for each task

conda activate QAA

set -e

/usr/bin/time -v STAR --runThreadN 8 --runMode genomeGenerate \
 --genomeDir /projects/bgmp/tizzard/bioinfo/Bi623/QAA/STAR/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
 --genomeFastaFiles /projects/bgmp/tizzard/bioinfo/Bi623/QAA/STAR/Mus_musculus.GRCm39.dna.primary_assembly.fa \
 --sjdbGTFfile /projects/bgmp/tizzard/bioinfo/Bi623/QAA/STAR/Mus_musculus.GRCm39.112.gtf