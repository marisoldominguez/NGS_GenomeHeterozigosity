#!/bin/bash
#SBATCH --job-name=Histo_Readlength
#
#SBATCH --comment="Histogram Read length Acc SRR9853673"
#
#SBATCH --time=90:00:00
#
#SBATCH --mem-per-cpu=60G
#
#SBATCH --mail-user=dominguez@uni-potsdam.de
#SBATCH --mail-type=END,FAIL
#
#SBATCH --chdir=/mnt/scratch/mathnat/ibb/dominguez/
#SBATCH --output=/mnt/scratch/mathnat/ibb/dominguez/SlurmSubmissions/output/slurm-batch.1.%j.%N.out
#SBATCH --error=/mnt/scratch/mathnat/ibb/dominguez/SlurmSubmissions/error/slurm-batch.1.%j.%N.err
#
#SBATCH --partition=All
#
#SBATCH --cpus-per-task=8
#

dir='/mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE'

find $dir/*.fq.gz -not -name \*raw\* -printf "zcat %p | awk '{if(NR%%4==2) print length(\$1)}' | textHistogram -maxBinCount=59 stdin \n" | sh