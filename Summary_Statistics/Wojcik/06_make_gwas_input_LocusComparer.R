library(data.table)
library(dplyr)
library(stringr)

#all_files <- list.files("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/", pattern = "WojcikG_", full.names = T, recursive = T)
#print(all_files)
all_files <- list.files("/home/egeoffroy", pattern = "_locus.tsv", full.names = T)
print(all_files)
for(file in all_files){
        pheno <- strsplit(file, "_")[[1]][2]
        print(pheno)
        file <- fread(file, header=F, stringsAsFactors=F)
        print(head(file))
        #file <- data.frame(file$rsid, file$`P-val`)
        colnames(file) <- c("rsid", "pval")
        file$pval <- as.numeric(file$pval)
        write.table(file, paste('/home/egeoffroy/GWAS_', pheno, '_locus.tsv', sep = ''), quote=F, row.names=F, sep = '\t')

}
