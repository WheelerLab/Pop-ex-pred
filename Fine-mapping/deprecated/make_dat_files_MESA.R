#!/bin/Rscript
library(dplyr)
library(data.table)

chr <- c(1:22)
group_id <- c("AFA", "AFHI", "HIS", "CAU", "ALL")
#group <- c("AFA")
j = 1
expression <- fread(paste("/home/wheelerlab3/files_for_revisions_plosgen/en_v7/prepare_data/expression/meqtl_sorted_", group_id[j], "_MESA_Epi_GEX_data_sidno_Nk-20.txt", sep =''), header =$
snps_in_file <- fread(paste("/home/elyse/", group_id[j], "_snps_in_model.txt", sep = ''), header = F, stringsAsFactors = FALSE)

for(id in group_id){
  for(CHR in chr){
    #dosage <- fread(paste("/home/wheelerlab3/files_for_revisions_plosgen/en_v7/prepare_data/genotypes/AFA_", CHR, "_snp.txt", sep = ''), header = T, stringsAsFactors = FALSE)

    for(ex in 1:nrow(expression)){
      dosage <- fread(paste("/home/wheelerlab3/files_for_revisions_plosgen/en_v7/prepare_data/genotypes/", group_id[j], "_", CHR, "_snp.txt", sep = ''), header = T, stringsAsFactors = FALS$
      individuals <- names(expression)[-1]
      print(length(individuals))
      genotype <- data.frame()
      gene <- expression[ex, 1]
      print(gene$PROBE_ID)
      pheno <- expression[ex, -1]
      header <- data.frame("pheno", gene, group_id, pheno)
      names(header) <- NULL
      #print(header)
      gene_snps <- snps_in_file %>% filter(V1 == gene$PROBE_ID)
      print(gene_snps)
      snps <- gene_snps$V3
      if(nrow(gene_snps) > 0){
        #print(intersect(dosage$id, snps))

        dosage_rows <- which(dosage$id %in% snps)
        dosage <- dosage[dosage_rows, ]
 #       print(dosage)
        for(i in 1:nrow(dosage)){
          #print(dosage)
          dosage_info <- dosage[i, ]
#          print(dosage_info)
          genotypes <- data.frame("geno", paste("chr", CHR, ".", dosage_info$id, sep = ''), group_id[j], dosage[i, ])
        }
        genotype <- rbind(genotype, genotypes)
        print(genotype)

        attempt <- c("pheno", "pheno_id", "group_id", individuals)
        colnames(genotype) <- attempt
        #colnames(genotype) <- c("pheno", "snp", "pop", names(dosage)[1:]) 
      #  write.table(genotype, paste("/home/elyse/AFA_dat_files/", gene$PROBE_ID, ".dat", sep = ''), quote = F)
      }
        write.table(genotype, paste("/home/elyse/", group_id[j], "_dat_files/", gene$PROBE_ID, ".dat", sep = ''), quote = F, row.names=F)
    }
   }
  j <- j+1
}
