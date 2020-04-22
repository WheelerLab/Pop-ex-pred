library(data.table)
library(dplyr)
library(stringr)
"%&%" = function(a,b) paste(a,b,sep="")
args = commandArgs(trailingOnly=TRUE)
#pheno <- args[1]
phenos <- c('Height53', 'Platelet', 'PR', 'C-reactive', 'QRS_duration', 'QT_interval', 'Waist-hip52', 'Waist-hip51', 'Waist-hip50', 'End_renal', 'LDL_cholesterol', 'HDL_cholesterol', 'Total_cholesterol', 'Mean_corpuscular_hemoglobin', 'Hemoglobin', 'Hypertension', 'Diabetes', "Diastolic_blood", 'Systolic_blood', 'Glomerular', 'Fasting_glucose', "Fasting_insulin", 'Chronic_kidney', 'Body_mass_index', 'Triglyceride', 'Smoking', 'Coffee')
length(phenos)
for(pheno in phenos){
pops <- c("AFA", "ALL", "AFHI", "HIS", "CAU")
for(pop in pops) {
input_path <- '/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/' %&% pheno
sig_genes <- list.files(input_path, pattern = pop %&% '_sig_genes.csv', full.names=T)
print(sig_genes)
input_genenames <- data.frame()
for(sig in sig_genes){
        if(!str_detect(sig, "HapMap") && !str_detect(sig, 'MESA') && !str_detect(sig, 'old')){
        sig1 <- fread(sig, header=T, stringsAsFactors=T)
        sig2 <- as.data.frame(sig1$gene_name)
        print(sig2)
        print('list_sig_genes_' %&% pop %&% '_' %&% pheno %&% '.txt')
        output = paste('list_sig_genes_', pop, '_', pheno, '.txt', sep = '')

        write.table(sig2, file = output, row.names=F, col.names=F, quote=F)
}
}
}
}
#print(as.list(unique(input_genenames)))
#write.table(as.list(unique(input_genenames)), 'list_sig_genes_' %&% pop %&% '_' %&% pheno %&% '.txt', row.names=F, col.names=F, quote=F)
#print(sigs)
