#make histogram to compare all of the significant genes found by each model
library(stringr)
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(data.table)
#source("/home/egeoffroy/Summary_Statistics/scripts/Man_QQ.R")
#all_dir <- list.dirs("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/", full.names=FALSE)
setwd("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/White_blood/GTEX/")
all_files = list.files(pattern = "sig_genes.csv", include.dirs=TRUE, full.names = TRUE, recursive = TRUE)
print(all_files)

list_group <- list()

for(files in all_files){
        #if(str_detect(files, "MESA")){
                #if(str_detect(files, "ALL2")){
                        #print(files)
                        list_group <- append(list_group, files)
                #}
        #}
}

print(list_group)
new_table <- data.frame(phenotype=character(), significant_hits=integer(), stringsAsFactors=FALSE)

for(i in 1:length(list_group)){
  file <- paste("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/White_blood/", str_remove(list_group[i], "./"), sep = "")
  print(file)
  S_Pred_file <- fread(file, header = T,  sep = ',')
  S_Pred_file <- subset(S_Pred_file, select=c("gene_name"))
  tissue <- strsplit(file, "/")
  tissue <- tissue[[1]][8]
  print(tissue)
  S_Pred_file$phenotype <- rep(tissue, nrow(S_Pred_file))
  S_Pred_file$significant_hits <- rep(nrow(S_Pred_file), nrow(S_Pred_file))
  #num_signif <- nrow(S_Pred_file)
  S_Pred_file <- subset(S_Pred_file, select=c("phenotype", "significant_hits"))
  new_table <- rbind(new_table, S_Pred_file)
  print(new_table)
}
new_table <- new_table[order(significant_hits), ]
head(new_table)
new_table <- unique(new_table)
ggplot(new_table, aes(x = reorder(phenotype, -significant_hits), y = significant_hits, fill=phenotype)) + coord_flip()+ geom_bar(stat = "identity") + labs(title="Wojcik White Blood/GTEx", 
                                                                                                                  x="Phenotype", y = "Number of Hits")
ggsave("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/GTEX_Whiteblood_Wojcik.png")
