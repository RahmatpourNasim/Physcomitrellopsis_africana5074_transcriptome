#!/bin/bash
#SBATCH -J RSEM
#SBATCH -o RSEM_%j.out
#SBATCH -e RSEM_%j.err
#SBATCH -N 1
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -n 1
#SBATCH -c 30
#SBATCH --mem=50G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nasim.rahmatpour@uconn.edu

module load bowtie2/2.3.3.1
module load rsem/1.3.0
module load perl/5.24.0
export PERL5LIB=/labs/Wegrzyn/perl5/lib/perl5

FILE1=/labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/Trimming_Trimmomatic/paired_1.fq
FILE2=/labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/Trimming_Trimmomatic/paired_2.fq

###RSEM1
rsem-prepare-reference -p 30 --bowtie2 trinity_run.Trinity.fasta Transcriptome.Trinity
rsem-calculate-expression -p 30 --bowtie2 --paired-end $FILE1 $FILE2 Transcriptome.Trinity Transcriptome.RSEM


module load trinity/2.6.6
/labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/RSEM/cutoff_FPKM0.5/filter_fasta_by_rsem_values.pl \
        --rsem_output=/labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/RSEM/Transcriptome.RSEM.isoforms.results \
        --fasta=/labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/RSEM/Transcriptome.Trinity.transcripts.fa \
        --output=/labs/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_transcriptome/RSEM/cutoff_FPKM0.5/Transcriptome_fpkm_filtered.fasta \
        --fpkm_cutoff=0.5 \
        --isopct_cutoff=1



