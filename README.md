# Physcomitrellopsis_africana5074_transcriptome
Here are the steps in Transcriptome assembly of moss Physcomitrellopsis africana (DNA number= 5074) using BGISEQ-500 short reads.
1) Quality control of short reads by FASTQC
2) Removing the adapters and low quality bases 
3) Assembly of short reads by Trinity 
4) Filtering contigs based on thier low expression by RSEM 
5) Translating contigs into ORFS by Transdecoder
6) Functional annotation by EnTAP

***The summary of each step is shown in Summary_results.txt

