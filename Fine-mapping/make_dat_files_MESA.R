library(dplyr)
library(data.table)

chr <- c(1:22)
test_chr <- 1
group_id <- c("afa", "his", "cau")
group <- c("AFA", "HIS", "CAU")
j = 1
for(id in group_id){
  for(CHR in chr){
    dosage <- fread(paste("/home/hwheeler1/MESA_dbGaP_55081/mesa_imputation_", id, "/UMich_dosages/chr", CHR, ".maf0.01.r20.8noambig.dosage.txt.gz", sep = ''), header = F, stringsAsFactors = FALSE)

    expression <- fread(paste("/home/rschubert1/MESA_data_for_elyse/", group[j], "_PF10.txt.gz", sep =''), header = TRUE, stringsAsFactors = FALSE)
    print(head(expression))
    snps_in_file <- fread(paste("/home/egeoffroy/new_PredDB/", group[j], "_snps_in_model.txt", sep = ''), header = FALSE, stringsAsFactors = FALSE)
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
          genotypes <- data.frame("geno", paste("chr", test_chr, ".", dosage[i, 3], sep = ''), group_id, dosage_info)
        }
        genotype <- rbind(genotype, genotypes)
        colnames(genotype) <- header
      write.table(paste("/home/egeoffroy/", group[j], "_dat_files/", gene, ".dat", sep = ''), header = T, quote = F)
      }

    }
   }
  j <- j+1
}
