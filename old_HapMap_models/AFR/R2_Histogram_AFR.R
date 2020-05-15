library(ggplot2)
library(dplyr)
library(RSQLite)
library(data.table)

"%&%" <- function(a,b) paste(a,b,sep='')

driver <- dbDriver("SQLite")
total_genes <- data.frame()
tissues <- c('AFR')
for (tissue in tissues) {
  print(tissue)
  filtered_db <- "/home/egeoffroy/new_PredDB/elastic_net/dbs/" %&% tissue %&% "10_peer_10_pcs_filtered.db"
  in_conn <- dbConnect(driver, filtered_db)
  genes <- dbGetQuery(in_conn, 'select * from extra')
  print(genes)
  genes <- data.frame(genes$gene, genes$genename, genes$test_R2_avg)
  #print(genes)
  total_genes <- rbind(total_genes, genes)
  #write.table(genes, "/home/egeoffroy/new_PredDB/AFR_genes_in_model.txt", quote = F, row.names=F, col.names=F)
}
write.table(total_genes, "/home/egeoffroy/new_PredDB/AFR_genes_in_model.txt", quote = F, row.names=F, col.names=F)
print(total_genes$genes.test_R2_avg)
png("/home/egeoffroy/new_PredDB/R2_AFR.png")
hist(total_genes$genes.test_R2_avg, main="R2 Distribution", xlab = "R2 Average AFR")
dev.off()
