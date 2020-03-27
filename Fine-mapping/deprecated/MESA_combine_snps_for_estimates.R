# I don't think I actually need to do this 

library(dplyr)
library(data.table)
library(stringr)

setwd("/home/wheelerlab3/files_for_revisions_plosgen/en_v7/prepare_data/genotypes/")
all_files = list.files(pattern = "snp", include.dirs=TRUE, full.names = TRUE, recursive = FALSE)
print(all_files)

list_group <- list()

for(files in all_files){
        if(str_detect(files, "AFA")){
                        list_group <- append(list_group, files)   
        }
}

print(list_group)
new_table <- data.frame()

for(i in 1:length(list_group)){
  file <- paste("/home/wheelerlab3/files_for_revisions_plosgen/en_v7/prepare_data/genotypes/", str_remove(list_group[i], "./"), sep = "")
  print(file)
  genotypes <- fread(file, header = T,  sep = '\t')
  new_table <- rbind(new_table, genotypes)
}

write.table("/home/elyse/MESA_AFA_all_snps.txt", new_table, quote = FALSE)
