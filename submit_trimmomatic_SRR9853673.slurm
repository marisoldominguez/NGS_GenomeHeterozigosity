#!/bin/bash
#SBATCH --job-name=trimmomatic
#
#SBATCH --comment="trimmomatic Acc SRX6608266"
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
module purge
module load Anaconda/3.7
source activate trimmomatic-env

#forward
FOR=/mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/SRR9853673_1.fastq
#reverse
REV=/mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/SRR9853673_2.fastq
#

trimmomatic PE -phred33 -trimlog /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/log.txt $FOR $REV /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/paired_SRR9853673_1.fq.gz /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/unpaired_SRR9853673_1.fq.gz /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/paired_SRR9853673_2.fq.gz /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/unpaired_SRR9853673_2.fq.gz ILLUMINACLIP:/mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/trimmomatic_adapters/adapters/TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:20 TRAILING:20 MINLEN:36


# before running this xcript I created the trimmomatic_adapters folder and run this command to download the lists of adapters from trimmomatic github: git clone https://github.com/timflutre/trimmomatic /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/trimmomatic_adapters

#:4:30:10 allow 4 mismatches, require 30 bp of overlap between R1 and R2 to identify the fragment as being less than the read length, Require 10bp of sequence to match before removing anything

# MINLEN:30 discard any reads that are less than 30bp after trimming

# here the lists pof adapters from trimmomatic: https://github.com/timflutre/trimmomatic/tree/master/adapters
# Fengs list: /mnt/scratch/mathnat/ibb/fcheng/transcriptome/software/trimmomatic/adapters/
#see http://seqanswers.com/forums/showthread.php?t=40133
#see https://kazukinakamae.github.io/2019/10/28/How-to-trim-adapters-using-Trimmomatic/
# see also http://www.usadellab.org/cms/index.php?page=trimmomatic