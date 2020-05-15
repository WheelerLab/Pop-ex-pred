library(ggplot2)
library(dplyr)
library(RSQLite)
library(data.table)

"%&%" <- function(a,b) paste(a,b,sep='')

driver <- dbDriver("SQLite")

tissues <- c('AFR')
for (tissue in tissues) {
  print(tissue)
  filtered_db <- "/home/egeoffroy/new_PredDB/elastic_net/dbs/" %&% tissue %&% "10_peer_10_pcs_filtered.db"
  in_conn <- dbConnect(driver, filtered_db)
  snps <- dbGetQuery(in_conn, 'select * from weights')
  print(snps)
  snps <- data.frame(snps$gene, snps$rsid)
  write.table(snps, "/home/egeoffroy/new_PredDB/AFR_snps_in_model.txt", quote = F, row.names=F, col.names=F)
}
