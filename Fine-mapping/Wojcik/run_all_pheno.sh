#!/bin/bash
declare -a pops
pops=(ALL CAU AFHI HIS)
for pop in "${pops[@]}"
do
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Body_mass_index --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008025-EFO_0004340-build37.f.tsv.gz

python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Chronic_kidney --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008026-EFO_0003884-build37.f.tsv.gz

python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Smoking --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008027-EFO_0006525-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Coffee --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008028-EFO_0006782-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Diastolic_blood --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008029-EFO_0006336-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Glomerular --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008030-EFO_0005208-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_End-renal --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008031-EFO_0003884-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Fasting_glucose --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008032-EFO_0004465-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Fasting_insulin --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008033-EFO_0004466-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Hemoglobin --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008034-EFO_0004541-build37.f.tsv.gz

python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_HDL --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008035-EFO_0004612-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Hypertension --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008036-EFO_0000537-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_LDL --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008037-EFO_0004611-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Mean_corpuscular_hemoglobin --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008038-EFO_0004528-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Platelet --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008039-EFO_0004309-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_PR --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008042-EFO_0004462-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_QT_interval --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008043-EFO_0004682-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Systolic_blood --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008044-EFO_0006335-build37.f.tsv.gz

python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Total_cholesterol --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008045-EFO_0004574-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Triglyceride --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008046-EFO_0004530-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Diabetes --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008048-EFO_0001360-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_White_blood --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008049-EFO_0004308-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Waist-hip50 --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008050-EFO_0004343-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Waist-hip51 --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008051-EFO_0004343-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Waist-hip52 --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008052-EFO_0004343-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_Height --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008053-EFO_0004339-build37.f.tsv.gz

python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_QRS_duration --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008054-EFO_0005055-build37.f.tsv.gz
python3 /home/elyse/FACT5/finemap.py --fastenloc_SS --pop ${pop} --LD /home/wheelerlab3/db2fastenloc/ldetect-data/AFR_fourier_ls-all.bed --pheno_id Wojcik_C-reactive --gwas_SS /home/elyse/Wojcik_build37/31217584-GCST008055-EFO_0004458-build37.f.tsv.gz
done
