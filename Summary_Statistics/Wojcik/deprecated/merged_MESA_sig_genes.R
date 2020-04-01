#Author: Elyse Geoffroy
#Purpose: to merge all of the significant gene files for a given phenotype
dir <- "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik"
pheno <- list.dirs(path = dir, full.names = TRUE, recursive = TRUE)
for (trait in pheno){
  files <- list.files(path = trait, pattern = 'sig_genes.csv', all.files = TRUE, full.names = TRUE)
  print(files)
  for (file in files) {
    dataset <- read.table(file, header=TRUE, sep=",")
    if(length(dataset) > 0){
      if(grepl("AFA", file)){
        model <- rep("AFA", length(dataset))
        AFA <- cbind(dataset, model)
        print(AFA)
      }
      if(grepl("AFHI", file)){
        model <- rep("AFHI", length(dataset))
        AFHI <- cbind(dataset, model)
        print(AFHI)
      }
      if(grepl("HIS", file)){
        model <- rep("HIS", length(dataset))
        HIS <- cbind(dataset, model)
        print(HIS)
      }
      if(grepl("ALL", file)){
        model <- rep("ALL", length(dataset))
        ALL <- cbind(dataset, model)
        print(ALL)
      }
      if(grepl("CAU", file)){
        model <- rep("CAU", length(dataset))
        CAU <- cbind(dataset,model)
        print(CAU)
      }
    }
    
  }
  #dataset <- rbind(AFA, AFHI)
  #dataset <- rbind(dataset, HIS)
  #dataset <- rbind(dataset, ALL)
    
  #print(dataset)
  #write.csv(dataset, file= paste(trait, "/merged_sig_genes.csv"))
}
