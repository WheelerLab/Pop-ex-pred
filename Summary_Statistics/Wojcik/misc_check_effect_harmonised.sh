#!/bin/bash
cd MetaXcan/software
python2 ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db --covariance /home/egeoffroy/MESA/ALL_nested_cv_a
ll_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/ --gwas_file_pattern "31217584-GCST008049-EFO_0004308-build37.f.tsv.gz" --snp_column variant_id --effect_allele_
column effect_allele --non_effect_allele_column other_allele --beta_column beta --pvalue_column p_value --output_file /home/egeoffroy/Wojcik37_White_blood_ALL.csv

#This file runs S-PrediXcan to check if harmonising the data has an effect on the output of S-PrediXcan. We used White-blood cell count as the test file
