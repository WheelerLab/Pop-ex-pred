# GWAS Summary Statistics

https://www.ebi.ac.uk/gwas/

https://docs.google.com/spreadsheets/d/1fRoGqGHPf2-1-7KyINZn1FIxCyZrCNwuIldNfXpZuIc/edit?usp=sharing

## S-PrediXcan
We ran S-PrediXcan using each of the MESA models and all of the GTEx v7 and v8 models with the all available non-European GWAS Summary Statistics from the GWAS Catalog.

## S-MultiXcan
After running all of the GTEx Tissues with S-PrediXcan, you can run S-MultiXcan. S-MultiXcan looks for trait associations across all of the GTEx tissues. 

```
/home/egeoffroy/anaconda2/bin/python ./SMulTiXcan.py --models_folder GTEX_model_path --models_name_pattern "gtex_v7_(.*)_imputed_europeans_tw_0.5_signif.db" --snp_covariance snp_covariance_file --metaxcan_folder file_leading_to_SPrediXcan_output --metaxcan_file_name_parse_pattern "(.*).csv" --gwas_folder GWAS_SS_folder --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --cutoff_condition_number 30 --verbosity 7 --throw --output output_path
```

