#!/bin/bash

# author: Marisol Dominguez
# date: Abril 2021

#fastqc to download and split reads from ncbi

#load conda in HPC:
module purge
module load Anaconda/3.7
source activate sra-tools-env
fastq-dump --outdir /path --split-3 --gzip SRR9853823

#this command will download reads from project SRR9853823 and split them in 3 files: a left file, a right file, and a singletons file. trimmomatic (for removing adapters needs the F and R reads separatly!)