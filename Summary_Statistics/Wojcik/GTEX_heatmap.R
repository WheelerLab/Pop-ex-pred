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

