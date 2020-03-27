library(stringr)
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(data.table)
#source("/home/egeoffroy/Summary_Statistics/scripts/Man_QQ.R")
#all_dir <- list.dirs("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/", full.names=FALSE)
setwd("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/")
all_files = list.files(pattern = "sig_genes.csv", include.dirs=TRUE, full.names = TRUE, recursive = TRUE)
print(all_files)

list_group <- list()

for(files in all_files){
        #if(str_detect(files, "MESA")){
                if(str_detect(files, "GTEX")){
                        #print(files)
                        list_group <- append(list_group, files)
                }
        #}
}

print(list_group)
new_table <- data.frame(tissue=character(), phenotype=character(), significant_hits=integer(), stringsAsFactors=FALSE)

for(i in 1:length(list_group)){
  file <- paste("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/", str_remove(list_group[i], "./"), sep = "")
  print(file)
  S_Pred_file <- fread(file, header = T,  sep = ',')
  S_Pred_file <- subset(S_Pred_file, select=c("gene_name"))
  tissue <- strsplit(file, "/")
  pheno <- tissue[[1]][7]
  pheno <- gsub("_", ' ', pheno)
  if(pheno == "Waist-hip50"){
        pheno = "Waist-hip ratio Female"
  }
  if(pheno == "Waist-hip51"){
        pheno = "Waist-hip ratio Male"
  }
  if(pheno == "Waist-hip52"){
        pheno = "Waist-hip ratio"
  }
  pheno <- gsub('[[:digit:]]+', '', pheno)
  print(pheno)
  tissue <- tissue[[1]][10]
  tissue <- str_remove(tissue, "GTEX")
  tissue <- str_remove(tissue, "sig_genes.csv")
  tissue <- str_replace_all(tissue, "_", " ")
  S_Pred_file$tissue <- rep(tissue, nrow(S_Pred_file))
  S_Pred_file$phenotype <- rep(pheno, nrow(S_Pred_file))
  S_Pred_file$significant_hits <- rep(nrow(S_Pred_file), nrow(S_Pred_file))
  #num_signif <- nrow(S_Pred_file)
  S_Pred_file <- subset(S_Pred_file, select=c("tissue", "phenotype", "significant_hits"))
  new_table <- rbind(new_table, S_Pred_file)
  print(new_table)
}
new_table <- new_table[order(significant_hits), ]
head(new_table)
new_table <- unique(new_table)
ggplot(new_table, aes(tissue, phenotype, fill= significant_hits)) + 
  geom_tile()
ggsave("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/GTEX_v7_heatmap.png")
