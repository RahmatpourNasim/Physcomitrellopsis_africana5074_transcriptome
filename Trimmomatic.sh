#!/bin/bash
#SBATCH --job-name=Trimmomatic
#SBATCH -o Trimmomatic-%j.output
#SBATCH -e Trimmomatic-%j.error
#SBATCH --mail-user=nasim.rahmatpour@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --partition=general
#SBATCH --qos=general

module load Trimmomatic/0.36

java -jar $Trimmomatic PE -threads 8 CL100118899_L01_573_1.fq CL100118899_L01_573_2.fq  paired_1.fq unpaired_1.fq paired_2.fq unpaired_2.fq ILLUMINACLIP:/labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/Trimming_Trimmomatic/adapter.fasta:2:30:10 -phred33 SLIDINGWINDOW:4:25 MINLEN:36

