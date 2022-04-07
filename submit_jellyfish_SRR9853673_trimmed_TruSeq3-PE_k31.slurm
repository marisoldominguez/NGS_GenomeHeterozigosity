#!/bin/bash
#SBATCH --job-name=jellyfish
#
#SBATCH --comment="jellyfish_k31_trimmed TruSeq3-PE_Acc SRX6608266"
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
source activate jellyfish-env

#jellyfish count
# should have changed -s (memory) to 60000000000 (60 Gb) !!

jellyfish count -C -m 31 -s 1000 -t 10 -o /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/Jellyfish/Neso_SRX6608266_trimmed_TruSeq3-PE.k31.jf <(zcat /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/paired_SRR9853673_1.fq.gz) <(zcat /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/paired_SRR9853673_2.fq.gz)

#jellyfish histo
jellyfish histo -t 10 /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/Jellyfish/Neso_SRX6608266_trimmed_TruSeq3-PE.k31.jf > /mnt/scratch/mathnat/ibb/dominguez/YelCar_GenomeAssembly/Nesospiza_acunhae/SRX6608266/trimmed/TruSeq3-PE/Jellyfish/Neso_SRX6608266_trimmed_TruSeq3-PE.k31.histo

# then load histogram in genomescope

#see http://www.annasyme.com/docs/jellyfish.html