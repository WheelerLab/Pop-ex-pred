#!/bin/Rscript 
library(data.table)
library(dplyr)
library(stringr)
setwd("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/")
all_files <- list.files(pattern="AFA2_sig_genes.csv", recursive=TRUE, full.names=T)
all_files2 <- list.files(pattern="ALL2_sig_genes.csv", recursive=TRUE, full.names=T)
all_files3 <- list.files(pattern="AFHI2_sig_genes.csv", recursive=TRUE, full.names=T)
all_files4 <- list.files(pattern="HIS2_sig_genes.csv", recursive=TRUE, full.names=T)
all_files5 <- list.files(pattern="CAU2_sig_genes.csv", recursive=TRUE, full.names=T)

all_files <- c(all_files, all_files2, all_files3, all_files4, all_files5)

print(all_files)
output <- data.frame()

for(file in all_files){
  sig_genes <- fread(file, header=T, stringsAsFactors=T)
  if(str_detect(file, "HIS")){
    model <- "HIS"
  }
  if(str_detect(file, "AFA")){
    model <- "AFA"
  }
  if(str_detect(file, "AFHI")){
    model <- "AFHI"
  }
  if(str_detect(file, "CAU")){
    model <- "CAU"
  }
  if(str_detect(file, "ALL")){
    model <- "ALL"
  }
  phenotype <- rep(str_split(file, '/')[[1]][2], nrow(sig_genes))
  model <- rep(model, nrow(sig_genes))
  sig_genes <- cbind(phenotype, model, sig_genes)
  output <- rbind(output, sig_genes, fill=T)
  print(output)
}
write.table(output, "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/sig_genes_all_pheno.txt", quote = F)

