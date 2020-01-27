library(data.table)
library(R.utils)
dir <- "/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik"
pheno <- list.dirs(path = dir, full.names = TRUE, recursive = TRUE)
for (trait in pheno){
  files <- list.files(path = trait, pattern = '.gz', all.files = TRUE, full.names = TRUE)
  print(files)
  for (file in files) {
        dataset <- fread(file)
    #dataset <- read.table(gzfile(file))  
    #dataset <- read.table(file, header=TRUE, sep=",")
    colnames(dataset)[colnames(dataset)=="Chr"] <- "CHR"
    print(colnames(dataset))
  }
}
