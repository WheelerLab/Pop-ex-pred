#This is not all of the test and models 
#This is a script to run the MESA ALL, AFA, AFHI, and HIS models through Wojcik GWAS Summary #Statistics
#!/bin/bash
cd /home/egeoffroy/MetaXcan/software/

#For QRS Interval
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_duration/WojcikGL_31217584_GCST008054/SumStats/ --gwas_file_pattern ".*gz"  --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_interval/MESA_ALL2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_duration/WojcikGL_31217584_GCST008054/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_interval/MESA_AFA2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_duration/WojcikGL_31217584_GCST008054/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_interval/MESA_AFHI2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_duration/WojcikGL_31217584_GCST008054/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_interval/MESA_HIS2.csv

#For Coffee Consumption
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/WojcikGL_31217584_GCST008028/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/MESA_ALL2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/WojcikGL_31217584_GCST008028/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/MESA_AFA2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/WojcikGL_31217584_GCST008028/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/MESA_AFHI2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/WojcikGL_31217584_GCST008028/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/MESA_HIS2.csv

#For Diabetes
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/WojcikGL_31217584_GCST008048/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/MESA_ALL2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/WojcikGL_31217584_GCST008048/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/MESA_AFA2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/WojcikGL_31217584_GCST008048/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/MESA_AFHI2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/WojcikGL_31217584_GCST008048/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/MESA_HIS2.csv

#For End Stage Renal Disease
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/WojcikGL_31217584_GCST008031/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/MESA_ALL2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/WojcikGL_31217584_GCST008031/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/MESA_AFA2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/WojcikGL_31217584_GCST008031/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-alleSummary_Statistics/scripts/MESA/MESA_Wojcik.sh

#For Height 
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/WojcikGL_31217584_GCST008053/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/MESA_ALL2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/WojcikGL_31217584_GCST008053/SumStats/  --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/MESA_AFA2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/WojcikGL_31217584_GCST008053/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/MESA_AFHI2.csv

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_10_peer_3pcs.txt.gz --gwas_folder /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/WojcikGL_31217584_GCST008053/SumStats/ --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file /home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/MESA_HIS2.csv


#For Fasting Insulin
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$

#For Hemoglobin AC
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$

#For LDL Cholesterol Levels
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$

#For PR
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$


#For QT Interval
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$

#For Smoking
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$

#Total Cholesterol
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$


#For Waist Hip Ratio 50
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$



#For Waist Hip Ratio 51
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$


#For Waist Hip Ratio 52
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$


#For White Blood Cell count
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$


#For Triglyceride Levels
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$

#For Systolic Blood
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances_$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$


#For QRS duration
/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/ALL_imputed_10_peer_3_pcs__v2.db  --covariance /home/egeoffroy/MESA/ALL_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFA_imputed_10_peer_3_pcs_v2.db  --covariance /home/egeoffroy/MESA/AFA_nested_cv_all_covariances$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/AFHI_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/AFHI_nested_cv_all_covariance$

/home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/MESA/HIS_imputed_10_peer_3_pcs_v2.db --covariance /home/egeoffroy/MESA/HIS_nested_cv_all_covariances_$

