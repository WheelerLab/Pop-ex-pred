#S-PrediXcan for HapMap  and Morris
#!/bin/bash
cd /home/egeoffroy/MetaXcan/software/

#For Glomerular Filtration Rate
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/dbs/ALL_10_peer_10_pcs_filtered.db --covariance /home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/ALL_covar_troubleshooted.txt --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Morris/MorrisAP_30604766_GCST007344/ --gwas_file_pattern ".*gz"  --snp_column SNV --effect_allele_column Effect_allele --non_effect_allele_column Other_allele --beta_column Effect --pvalue_column P_value --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Morris/HapMap_ALL.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/dbs/Asian_10_peer_10_pcs_filtered.db --covariance /home/egeoffroy/HapMap/ASN_covars.txt --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Morris/MorrisAP_30604766_GCST007344/ --gwas_file_pattern ".*gz"  --snp_column SNV --effect_allele_column Effect_allele --non_effect_allele_column Other_allele --beta_column Effect --pvalue_column P_value --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Morris/HapMap_ASN.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/new_PredDB/elastic_net/dbs/AFR10_peer_10_pcs_filtered.db --covariance /home/egeoffroy/new_PredDB/AFR_covars.txt --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Morris/MorrisAP_30604766_GCST007344/ --gwas_file_pattern ".*gz"  --snp_column SNV --effect_allele_column Effect_allele --non_effect_allele_column Other_allele --beta_column Effect --pvalue_column P_value --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Morris/HapMap_AFR.csv
