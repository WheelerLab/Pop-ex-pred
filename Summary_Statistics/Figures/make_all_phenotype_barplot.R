library(stringr)
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
#source("/home/egeoffroy/Summary_Statistics/scripts/Man_QQ.R")
all_dir <- list.dirs("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/", full.names=FALSE)
#print(all_dir)
list_group <- list()
for(dirs in all_dir){
  all_files = list.files(pattern = "sig_genes2.csv", full.names = TRUE, recursive = TRUE)
  print(all_files)
  for(file in all_files){
    #if(str_detect(file, "sig_genes")){
      if(str_detect(file, "ALLMESA")){
        #print(file)
        list_group <- append(list_group, file)
      }
    #}
  }
}
print(list_group)
new_table <- data.frame(phenotype=character(), significant_hits=integer(), stringsAsFactors=FALSE)

for(i in list_group){
  S_Pred_file <- read.table(i, header = T,  sep = ',')
  S_Pred_file <- subset(S_Pred_file, select=c("gene_name"))
  pheno <- strsplit(i, "/")
  print(pheno[[1]][5])
  S_Pred_file$phenotype <- rep(pheno[[1]][5], nrow(S_Pred_file))
  S_Pred_file$significant_hits <- rep(nrow(S_Pred_file), nrow(S_Pred_file))
  #num_signif <- nrow(S_Pred_file)
  S_Pred_file <- subset(S_Pred_file, select=c("phenotype", "significant_hits"))
  new_table <- rbind(new_table, S_Pred_file)
  print(new_table)
}
head(new_table)
new_table <- unique(new_table)
ggplot(new_table, aes(x = phenotype, y = significant_hits, color=phenotype)) + geom_bar(stat = "identity") + labs(title="Wojcik/ALL MESA Model", 
                                                                                                                  x="Phenotype", y = "Number of Hits")
ggsave("AllMESA_Wojcik.pdf")
