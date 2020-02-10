#This is a script to run the GTEX models through Wojcik Gwas Summary #Statistics
#!/bin/bash
declare -a GTEX_files
#GTEX_files=("Stomach" "Brain_Cerebellar_Hemisphere" "Brain_Caudate_basal_ganglia" "Whole_Blood")
# "Adipose_Subcutaneous" "Adipose_Visceral_Omentum" "Adrenal_Gland" "Artery_Aorta" "Artery_Coronary" "Artery_Tibial" "Brain_Amygdala" "Brain_Anterior_cingulate_cortex_BA24" "Brain_Cerebellum" "Brain_Cortex" "Brain_Frontal_Cortex_BA9" "Brain_Hippocampus" "Brain_Hypothalamus" "Brain_Nucleus_accumbens_basal_ganglia" "Brain_Putamen_basal_ganglia" "Brain_Spinal_cord_cervical_c-1" "Brain_Substantia_nigra" "Breast_Mammary_Tissue" "Cells_EBV-transformed_lymphocytes" "Cells_Transformed_fibroblasts" "Colon_Sigmoid" "Colon_Transverse" "Esophagus_Gastroesophageal_Junction" "Esophagus_Mucosa" "Esophagus_Muscularis" "Heart_Atrial_Appendage" "Heart_Left_Ventricle" "Liver" "Lung" "Minor_Salivary_Gland" "Muscle_Skeletal" "Nerve_Tibial" "Ovary" "Pancreas" "Pituitary" "Prostate" "Skin_Not_Sun_Exposed_Suprapubic" "Skin_Sun_Exposed_Lower_leg"  "Small_Intestine_Terminal_Ileum" "Spleen" "Testis" "Thyroid" "Uterus" "Vagina" "Whole_Blood")
#GTEX_files=("Whole_Blood")
declare -a Wojcik_files
#Wojcik_files=("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Chronic_kidney/WojcikGL_31217584_GCST008026" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diabetes/WojcikGL_31217584_GCST008048" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Fasting_glucose/WojcikGL_31217584_GCST008032" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Hemoglobin/WojcikGL_31217584_GCST008034" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Mean_corpuscular_hemoglobin/WojcikGL_31217584_GCST008038" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/PR/WojcikGL_31217584_GCST008042" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Systolic_blood/WojcikGL_31217584_GCST008044" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Waist-hip50/WojcikGL_31217584_GCST008050" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Waist-hip51/WojcikGL_31217584_GCST008051" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Waist-hip52/WojcikGL_31217584_GCST008052" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/White_blood/WojcikGL_31217584_GCST008049" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Coffee/WojcikGL_31217584_GCST008028" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Diastolic_blood/WojcikGL_31217584_GCST008029" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Fasting_insulin/WojcikGL_31217584_GCST008033" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/HDL_cholesterol/WojcikGL_31217584_GCST008035" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Hypertension/WojcikGL_31217584_GCST008036" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/QRS_duration/WojcikGL_31217584_GCST008054" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Total_cholesterol/WojcikGL_31217584_GCST008045" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Body_mass_index/WojcikGL_31217584_GCST008025" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/C-reactive/WojcikGL_31217584_GCST008055" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/End_renal/WojcikGL_31217584_GCST008031" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Glomerular/WojcikGL_31217584_GCST008030" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Height53/WojcikGL_31217584_GCST008053" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LDL_cholesterol/WojcikGL_31217584_GCST008037" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Platelet/WojcikGL_31217584_GCST008039" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Smoking/WojcikGL_31217584_GCST008027" "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Triglyceride/WojcikGL_31217584_GCST008046")
Wojcik_files=("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Waist-hip52/WojcikGL_31217584_GCST008052")

for i in "${GTEX_files[@]}" 
do
        :
        #GTEX=$(echo $i| cut -d '/' -f 6)
        #echo $GTEX
        echo $i
        for pheno in "${Wojcik_files[@]}"
        do
                : 
                sum_stat=$(find $pheno -type f -name "*WojcikG*")
                echo $sum_stat
                
                Wojcik=$(echo $pheno| cut -d '/' -f 7)
                #mkdir ${pheno}/SumStats/
                cp $sum_stat ${pheno}
                output="/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/${Wojcik}/GTEX/${i}.csv"
                echo $output
                cd /home/egeoffroy/MetaXcan/software
                /home/egeoffroy/anaconda2/bin/python ./MetaXcan.py --model_db_path /home/egeoffroy/GTEX/gtex_v7_${i}_imputed_europeans_tw_0.5_signif.db --covariance /home/egeoffroy/GTEX/gtex_v7_${i}_imputed_eur_covariances.txt.gz --gwas_folder ${pheno} --gwas_file_pattern ".*gz" --snp_column rsid --effect_allele_column Effect-allele --non_effect_allele_column Other-allele --beta_column Beta --pvalue_column P-val --output_file $output
                
        done
done
