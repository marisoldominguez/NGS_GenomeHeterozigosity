#!/bin/bash

# author: Marisol Dominguez
# date: Abril 2021


# Trimmomatic_trimming_TruSeq3-PE-2adapters_from_SRX6608266

#load conda in HPC:
module purge
module load Anaconda/3.7
source activate trimmomatic-env

#forward
FOR=/path/SRR9853673_1.fastq
#reverse
REV=/path/SRR9853673_2.fastq


trimmomatic PE -phred33 $FOR $REV /path/trimmed/TruSeq3-PE-2/paired_SRR9853673_1.fq.gz /path/trimmed/TruSeq3-PE-2/unpaired_SRR9853673_1.fq.gz /path/trimmed/TruSeq3-PE-2/paired_SRR9853673_2.fq.gz /path/trimmed/TruSeq3-PE-2/unpaired_SRR9853673_2.fq.gz ILLUMINACLIP:/path/trimmomatic_adapters/adapters/TruSeq3-PE-2.fa:2:30:10:2:keepBothReads LEADING:20 TRAILING:20 MINLEN:36


# before running this xcript I created the trimmomatic_adapters folder and run this command to download the lists of adapters from trimmomatic github: git clone https://github.com/timflutre/trimmomatic /path/trimmomatic_adapters

#:4:30:10 allow 4 mismatches, require 30 bp of overlap between R1 and R2 to identify the fragment as being less than the read length, Require 10bp of sequence to match before removing anything

# MINLEN:30 discard any reads that are less than 30bp after trimming

# here the lists pof adapters from trimmomatic: https://github.com/timflutre/trimmomatic/tree/master/adapters