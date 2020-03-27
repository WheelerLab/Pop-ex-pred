!/bin/bash
pop=$1
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008025-EFO_0004340-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Body_Mass_Index &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008026-EFO_0003884-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Chronic_kidney &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008027-EFO_0006525-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Smoking &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008028-EFO_0006782-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Coffee &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008029-EFO_0006336-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Diastolic_blood &

nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008030-EFO_0005208-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Glomerular &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008031-EFO_0003884-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_End_renal &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008032-EFO_0004465-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Fasting_glucose &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008033-EFO_0004466-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Fasting_insulin &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008034-EFO_0004541-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Hemoglobin &

nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008035-EFO_0004612-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_HDL &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008036-EFO_0000537-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Hypertension &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008037-EFO_0004611-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_LDL &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008038-EFO_0004528-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Mean_corp_hemo &
nohup python3 /home/wheelerlab3/db2fastenloc/07_prep_sumstats_1000G_LDblocks.py --ldblocks /home/elyse/db2fastenloc/ldetect/AFR_fourier_ls-all.bed -s /home/elyse/Wojcik_build37/31217584-GCST008039-EFO_0004309-build37.f.tsv.gz -a ${pop}_all1Mb_fastenloc.eqtl.annotation.vcf.gz -o ${pop}_Wojcik_Platelet &
