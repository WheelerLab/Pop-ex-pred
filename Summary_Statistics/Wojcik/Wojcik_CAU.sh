
#This is a script to run the CAU MESA models through Wojcik GWAS Summary Statistics
#!/bin/bash
cd /home/egeoffroy/MetaXcan/software/

#For QRS Interval
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_duration/WojcikGL_31217584_GCST008054/SumStats/ --gwas_file_pattern ".*gz"  --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_interval/MESA_CAU.csv

#For Coffee Consumption
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/WojcikGL_31217584_GCST008028/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/MESA_CAU.csv

#For Diabetes
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/WojcikGL_31217584_GCST008048/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/MESA_CAU.csv

#For End Stage Renal Disease
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/WojcikGL_31217584_GCST008031/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/MESA_CAU.csv

#For Fasting Insulin
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Fasting_insulin/WojcikGL_31217584_GCST008033/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Fasting_insulin/MESA_CAU.csv

#For Hemoglobin AC
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Hemoglobin/WojcikGL_31217584_GCST008034/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Hemoglobin/MESA_CAU.csv

#For LDL Cholesterol Levels
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LDL_cholesterol/WojcikGL_31217584_GCST008037/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LDL_cholesterol/MESA_CAU.csv

#For PR
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/PR/WojcikGL_31217584_GCST008042/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/PR/MESA_CAU.csv

#For QT Interval
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QT_interval/SumStats/ —gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QT_interval/MESA_CAU.csv

#For Smoking 
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Smoking/WojcikGL_31217584_GCST008027/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Smoking/MESA_CAU.csv

#Total Cholesterol
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Total_cholesterol/WojcikGL_31217584_GCST008045/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Total_cholesterol/MESA_CAU.csv

#For Waist Hip Ratio 50
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Waist-hip50/WojcikGL_31217584_GCST008050/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Waist-hip50/MESA_CAU.csv

#For Waist Hip Ratio 51
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/CAU_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/CAU_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /homSummary_Statistics/scripts/MESA/MESA_Wojcik_CAU.sh
