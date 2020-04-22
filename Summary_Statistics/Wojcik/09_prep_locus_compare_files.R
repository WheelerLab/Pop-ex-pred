library(data.table)
library(dplyr)
library(stringr)
library(locuscomparer)
"%&%" = function(a,b) paste(a,b,sep="")
args = commandArgs(trailingOnly=TRUE)
phenos <- c('PR', 'White_blood', 'Diabetes', 'Chronic_kidney', 'Height53', 'QRS_duration', 'QT_interval', 'Mean_corpuscular_hemoglobin', 'Hemoglobin', 'LDL_cholesterol', 'HDL_cholesterol', 'Total_cholesterol', 'Triglyceride', 'Diabetes', 'White_blood', 'Waist-hip51', 'PR', 'Platelet', 'C-reactive')
pops <- c('ALL', 'AFA', 'AFHI','CAU', 'HIS')
for(pheno in phenos){
for(pop in pops){
weight_files <- list.files(paste('/home/egeoffroy/sig_genes_models/', pheno, '/', sep =''), pattern = 'weights')
print(weight_files)
eqtl_file <- fread(paste('/home/egeoffroy/coloc/eQTL_', pop, '_', pheno, '.txt.gz', sep = ''), header=T, stringsAsFactors=F)



setwd('/home/egeoffroy/sig_genes_models/' %&% pheno)
for(file in weight_files){
        if(str_detect(file, pop)){
        gene <- strsplit(file, '_')[[1]][2]
        print(gene)
        weight <- fread(file, header=T, stringsAsFactors=F)
        print(nrow(weight))
        if(nrow(weight) != 0){
                gwas <- fread(paste('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/GWAS_Results/GWAS_', pheno, '_locus.tsv', sep =''), header=T, stringsAsFactors=F)
                colnames(gwas) <- c("rsid", "pval")
                gwas1 <- gwas %>% filter(gwas$rsid %in% weight$rs)
                print(head(gwas1))
                write.table(gwas1, paste('/home/egeoffroy/sig_genes_models/', pheno, '/GWAS_', pop, '_', gene, '_pval.txt', sep = ''), quote=F, row.names=F)
                print(head(eqtl_file))
                eqtl1 <- eqtl_file %>% filter(eqtl_file$variant_id %in% weight$rs)
                eqtl1 <- eqtl1 %>% filter(eqtl1$gene_id %in% weight$gene)
                print(head(eqtl1))
                print(nrow(eqtl1))
                #print(names(eqtl1))
                eqtl1 <- eqtl1 %>% select(variant_id, pval_nominal)
                colnames(eqtl1) <- c("rsid", "pval")
                write.table(unique(eqtl1), paste('/home/egeoffroy/sig_genes_models/', pheno,'/eQTL_', pop, '_', gene, '.txt', sep =''), quote=F, row.names=F)
                gwas_fn <- '/home/egeoffroy/sig_genes_models/' %&% pheno %&% '/GWAS_'%&% pop %&% '_' %&% gene %&% '_pval.txt'
                print(gwas_fn)

                eqtl_fn <- paste('/home/egeoffroy/sig_genes_models/', pheno,'/eQTL_', pop, '_', gene, '.txt', sep ='')
                print(eqtl_fn)
                
        }
}
}
}
}
