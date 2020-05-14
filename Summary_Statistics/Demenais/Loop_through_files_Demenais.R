library(dplyr)
source("/home/egeoffroy/Summary_Statistics/scripts/Man_QQ.R")
all_dir <- list.dirs("/home/egeoffroy/Summary_Statistics/Summary_Stats/Demenais/", full.names=FALSE)
print(all_dir)
setwd(paste("/home/egeoffroy/Summary_Statistics/Summary_Stats/Demenais/MESA"))
all_files = list.files(pattern = ".csv", full.names = TRUE, recursive = TRUE) #recursive is usually true except for plotting SMultiXcan results


Sum_Stat_Name <- "Demenais" #change for each GWAS Summary Statistic
for (file in all_files) {
        print(file)
        directory <- normalizePath(dirname(file))
        print(directory)
        # read in the csv
        make_plots(file, directory, sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(file)), sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(file)))
}
