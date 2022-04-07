#!/bin/bash

# author: Marisol Dominguez
# date: Abril 2021


# Jellyfish_kmer_count_histo_k21_trimmed_TruSeq3-PEadapters_from_SRX6608266

#load conda in HPC:
module purge
module load Anaconda/3.7
source activate jellyfish-env

#jellyfish count
jellyfish count -C -m 21 -s 1000 -t 10 -o /path/trimmed/TruSeq3-PE/Jellyfish/Neso_SRX6608266_trimmed_TruSeq3-PE.k21.jf <(zcat /path/trimmed/TruSeq3-PE/paired_SRR9853673_1.fq.gz) <(zcat /path/trimmed/TruSeq3-PE/paired_SRR9853673_2.fq.gz)

#jellyfish histo
jellyfish histo -t 10 /path/trimmed/TruSeq3-PE/Jellyfish/Neso_SRX6608266_trimmed_TruSeq3-PE.k21.jf > /path/trimmed/TruSeq3-PE/Jellyfish/Neso_SRX6608266_trimmed_TruSeq3-PE.k21.histo

# then load histogram in genomescope