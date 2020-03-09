library(dplyr)
library(data.table)

chr <- c(1:22)
test_chr <- 1
group_id <- "AFR"
for(CHR in chr){
    dosage <- fread(paste("/home/egeoffroy/AFR_Dosages/chr", CHR, "_AFR.dosage.txt.gz", sep = ''), header = F, stringsAsFactors = FALSE)

    expression <- fread("/home/egeoffroy/AFR_expression_ens.txt", header = TRUE, stringsAsFactors = FALSE)
    print(head(expression))
    snps_in_file <- fread("/home/egeoffroy/new_PredDB/AFR_unfiltered_total_snps_in_model.txt", header = FALSE, stringsAsFactors = FALSE)
    #print(snps_in_file)
    for(ex in nrow(expression)){
      genotype <- data.frame()
      gene <- expression[ex, 1]
     # names(gene) <- NULL
      print(gene)
      pheno <- expression[ex, -1]
      header <- data.frame("pheno", gene, group_id, pheno)
      names(header) <- NULL
        print(header)
      gene_snps <- snps_in_file %>% filter(V1 == gene$PROBE_ID)
      print(gene_snps)
      if(nrow(gene_snps) > 0){
        print(dosage)
        dosage <- dosage %>% filter(V2 == gene_snps$V2)
        for(i in nrow(dosage)){
          print(dosage)
          dosage_info <- dosage[i, c(6:ncol(dosage))]
          print(ncol(dosage_info))
          genotypes <- data.frame("geno", paste("chr", CHR, ".", dosage[i, 3], sep = ''), group_id, dosage_info)
        }
        genotype <- rbind(genotype, genotypes)
        colnames(genotype) <- header
      }
        write.table(genotype, paste(gene, ".dat", sep = ''), header = T, quote = F)

    }
}
