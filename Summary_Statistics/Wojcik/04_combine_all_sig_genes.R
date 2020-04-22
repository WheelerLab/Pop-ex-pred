#!/bin/Rscript 
library(data.table)
library(dplyr)
library(stringr)
setwd("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/")
all_files <- list.files(pattern="AFA_sig_genes.csv", recursive=TRUE, full.names=T)
all_files2 <- list.files(pattern="ALL_sig_genes.csv", recursive=TRUE, full.names=T)
all_files3 <- list.files(pattern="AFHI_sig_genes.csv", recursive=TRUE, full.names=T)
all_files4 <- list.files(pattern="HIS_sig_genes.csv", recursive=TRUE, full.names=T)
all_files5 <- list.files(pattern="CAU_sig_genes.csv", recursive=TRUE, full.names=T)

all_files <- c(all_files, all_files2, all_files3, all_files4, all_files5)

#print(all_files)
output <- data.frame()

for(file in all_files){
  if(!str_detect(file, 'MESA') && !str_detect(file, 'HapMap') && !str_detect(file, 'old')){
  print(file)
  sig_genes <- fread(file, header=T, stringsAsFactors=T)
  sig_genes <- sig_genes[,-1]
  sig_genes <- sig_genes[,-13]
  if(str_detect(file, "/HIS")){
    model <- "HIS"
  }
  if(str_detect(file, "/AFA")){
    model <- "AFA"
  }
  if(str_detect(file, "/AFHI")){
    model <- "AFHI"
  }
  if(str_detect(file, "/CAU")){
    model <- "CAU"
  }
  if(str_detect(file, "/ALL")){
    model <- "ALL"
  }
  Phenotype <- rep(str_split(file, '/')[[1]][2], nrow(sig_genes))
  Model <- rep(model, nrow(sig_genes))
  sig_genes <- cbind(Phenotype, Model, sig_genes)
  output <- rbind(output, sig_genes, fill=T)
  #print(output)
}
}
print(output)
print(unique(output$gene_name))
write.table(unique(output), "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/sig_genes_all_pheno.csv", quote = F, sep = ',', row.names=F)
