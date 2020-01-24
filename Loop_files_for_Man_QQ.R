#Run through all of the GTEx files

library(dplyr)
source("/home/egeoffroy/Summary_Statistics/scripts/Man_QQ.R")
all_dir <- list.dirs("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Fasting_glucose/", full.names=FALSE)
print(all_dir)
        setwd(paste("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Fasting_glucose/"))
        all_files = list.files(pattern = ".csv", full.names = TRUE, recursive = FALSE) #recursive is usually true except for plotting SMultiXcan results
        print(all_files)        
        
#print(all_files)

Sum_Stat_Name <- "Wojcik" #GWAS Summary Statistics Name for filing
for (file in all_files) {
 print(file)
 directory <- normalizePath(dirname(file))
 print(directory) 
 # read in the csv
 make_plots(file, directory, sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(file)), sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(file)))
 
}
