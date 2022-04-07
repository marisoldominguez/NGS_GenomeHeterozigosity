#!/bin/bash
#SBATCH --job-name=fastq
#
#SBATCH --comment="fastq acc SRX6608269"
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
#SBATCH --cpus-per-task=10
#
module purge
module load Anaconda/3.7
source activate sra-tools-env
fastq-dump --outdir /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608269 --split-3 --gzip SRR9853823

#see https://edwards.sdsu.edu/research/fastq-dump/