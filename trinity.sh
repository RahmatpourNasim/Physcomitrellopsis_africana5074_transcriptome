#!/bin/bash
#SBATCH --job-name=Trinity
#SBATCH -o trinity-%j.output
#SBATCH -e trinity-%j.error
#SBATCH --mail-user=nasim.rahmatpour@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --partition=general
#SBATCH --qos=general

module load trinity/2.6.6
Trinity --seqType fq --left paired_1.fq --right paired_2.fq  --min_contig_length 300 --output trinity_run --full_cleanup --max_memory 50G --CPU 8
