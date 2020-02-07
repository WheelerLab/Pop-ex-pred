library(dplyr)
library(data.table)

group_id <- "AFR"
#dosage <- fread(paste("/home/egeoffroy/AFR_Dosages/chr", test_chr, "_AFR.dosage.txt.gz", sep = ''), header = F, stringsAsFactors = FALSE)

make_dat <- function(dosage, chr){
  for(ex in 1:nrow(expression)){
    genotype <- data.frame()
    gene <- expression[ex, 1]
    print(gene)
    pheno <- expression[ex, -1]
    header <- data.frame("pheno", gene$PROBE_ID, group_id, pheno)
    print(header)
    gene_snps <- snps_in_file %>% filter(V1 == gene$PROBE_ID)
    print(gene_snps)
    if(nrow(gene_snps) > 0){
      dosages <- dosage %>% filter(V2 == gene_snps$V2)
      if(nrow(dosages) > 0){
        for(i in nrow(dosages)){
          print(dosages)
          dosage_info <- dosages[i, c(6:ncol(dosages))]
          print(ncol(dosage_info))
          genotypes <- data.frame("geno", paste("chr", chr, ".", dosages[i, 3], sep = ''), group_id, dosage_info)
          genotype <- rbind(genotype, genotypes)
          colnames(genotype) <- header
          print(genotype)
        }
      }
    }
    write.table(genotype, paste("/home/egeoffroy/dat_files_AFR/", gene$PROBE_ID, ".dat", sep = ''), quote = F)
  }
}

expression <- fread("/home/egeoffroy/AFR_expression_ens.txt", header = TRUE, stringsAsFactors = FALSE)
print(head(expression))
snps_in_file <- fread("/home/egeoffroy/new_PredDB/AFR_unfiltered_total_snps_in_model.txt", header = FALSE, stringsAsFactors = FALSE)

for(chr in 1:22){
  dosage_file <- fread(paste("/home/egeoffroy/AFR_Dosages/chr", chr, "_AFR.dosage.txt.gz", sep = ''), header = F, stringsAsFactors = FALSE)
  make_dat(dosage_file, chr)
}


