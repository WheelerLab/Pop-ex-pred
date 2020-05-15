library(data.table)
library(dplyr)

pops <- c('ALL', 'AFA', 'AFHI', 'HIS', 'CAU')
phenos <- c('Fasting_glucose', 'Height', 'Platelet', 'Hemoglobin', 'PR', 'QT_interval', 'QRS_duration', 'Diabetes', 'Diastolic_blood', 'Systolic_blood', 'Coffee',  'Fasting_insulin', 'LDL', 'HDL', 'Mean_corp_hemo', 'Smoking', 'Total_cholesterol', 'Triglyceride', 'C-reactive' ,'End-renal', 'Chronic_kidney', 'White_blood', 'Waist-hip50', 'Waist-hip51', 'Waist-hip52')

for(pop in pops){
        for(pheno in phenos){
            data <- fread(paste("coloc/coloc/eQTL_", pop,'_', pheno, ".txt.gz", sep =''), header = T, stringsAsFactors = F)
            data <- data.frame(data$variant_id, data$slope_se, data$slope)
            colnames(data) <- c("variant_id", "slope_se", "slope")
            data$Z <- as.numeric(data$slope)/as.numeric(data$slope_se)
            data <- data.frame(data$variant_id, data$Z)
            #fwrite(data, "eQTL_ecaviar_Z.txt", quote = F, row.names = F, col.names = F)
            write.table(data, paste(pop, '_', pheno, "_eQTL_ecaviar_Z.txt", sep = ''), quote=F, row.names =F, col.names=F)

            gwas <- fread(paste("coloc/coloc/GWAS_", pop, '_', pheno, ".txt.gz", sep =''), header= T, stringsAsFactors = F)
            gwas <- data.frame(gwas$panel_variant_id, gwas$standard_error, gwas$effect_size)
            colnames(gwas) <- c("variant_id", "se", "effect_size")
            gwas$Z <- as.numeric(gwas$effect_size)/as.numeric(gwas$se)
            gwas <- data.frame(gwas$variant_id, gwas$Z)
            #fwrite(gwas, "GWAS_ecaviar_Z.txt", quote = F, row.names = F, col.names = F)
            write.table(gwas, paste(pop, '_', pheno, "_GWAS_ecaviar_z.txt", sep = ''), quote=F, row.names=F, col.names=F)
        }
}
