#!/bin/bash
#SBATCH --job-name=busco
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 6
#SBATCH --mem=10G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mail-user=nasim.rahmatpour@uconn.edu
#SBATCH -o busco_%j.out
#SBATCH -e busco_%j.err

module load busco/3.0.2b
module load blast/2.2.29 

export PATH=/home/CAM/nrahmatpour/software/augustus/3.2.3/bin:/home/CAM/nrahmatpour/software/augustus/3.2.3/scripts:$PATH
export AUGUSTUS_CONFIG_PATH=/home/CAM/nrahmatpour/software/augustus/3.2.3/config

run_BUSCO.py  -i /labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/Busco/nointernal_nocontam/Transcriptome_fpkm_filtered.fasta.transdecoder.pep_no_contam   -o busco.moss.G.out  -l /isg/shared/databases/BUSCO/odb10/embryophyta_odb10 -c 6  -m prot  -f

