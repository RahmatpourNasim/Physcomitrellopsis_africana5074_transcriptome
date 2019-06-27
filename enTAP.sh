#!/bin/bash
#SBATCH --job-name=enTAP
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 6
#SBATCH --mem=50G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mail-user=nasim.rahmatpour@uconn.edu
#SBATCH -o enTAP_%j.out
#SBATCH -e enTAP_%j.err

module load perl/5.24.0
module load anaconda/2.4.0
module load diamond/0.9.19
module load eggnog-mapper/0.99.1
/labs/Wegrzyn/EnTAP/EnTAP --runP -i /labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/annotation_EnTAP/Transcriptome_fpkm_filtered.fasta.transdecoder.pep  -d /isg/shared/databases/Diamond/ntnr/nr_protein.87.dmnd --threads 6 --qcoverage 80 --tcoverage 60  --contam fungi --contam bacteria --contam insecta --contam amoeba
