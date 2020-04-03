library(data.table)
library(dplyr)
dirs <- list.dirs("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/", full.names = T)
print(dirs)

for(dir in dirs){
  ALL <- fread(paste(dir, "ALLMESA_ALL2_sig_genes.csv", sep = ''), header = T, stringsAsFactors = F)
  AFA <- fread(paste(dir, "AFAMESA_AFA2_sig_genes.csv", sep = ''), header = T, stringsAsFactors = F)
  AFHI <- fread(paste(dir, "AFHIMESA_AFHI2_sig_genes.csv", sep = ''), header = T, stringsAsFactors = F)
  HIS <- fread(paste(dir, "HISMESA_HIS2_sig_genes.csv", sep = ''), header = T, stringsAsFactors = F)
  CAU <- fread(paste(dir, "CAUMESA_CAU2_sig_genes.csv", sep = ''), header = T, stringsAsFactors = F) 
  #phenotype <- str_split(dirs, '/')[[1]][7]
  sig_genes <- rbind(ALL, AFA, AFHI, HIS, CAU)
  write.table(sig_genes, paste(dir, 'all_sig_genes.csv', sep = ''), quote = F, row.names = F)
}
