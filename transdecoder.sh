#!/bin/bash
#SBATCH --job-name=Transdecoder
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=10G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mail-user=nasim.rahmatpour@uconn.edu
#SBATCH -o Transdecoder_%j.out
#SBATCH -e Transdecoder_%j.err

module load TransDecoder/3.0.1
module load hmmer/3.1b2
module load cdhit/4.6.5

TransDecoder.LongOrfs -t Transcriptome_fpkm_filtered.fasta

hmmscan --cpu 8 --domtblout pfam.domtblout /isg/shared/databases/Pfam/Pfam-A.hmm Transcriptome_fpkm_filtered.fasta.transdecoder_dir/longest_orfs.pep

TransDecoder.Predict -t Transcriptome_fpkm_filtered.fasta --retain_pfam_hits pfam.domtblout
