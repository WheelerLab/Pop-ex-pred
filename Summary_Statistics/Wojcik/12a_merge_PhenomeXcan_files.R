library(dplyr)
library(data.table)

pvalues <- fread('sig_genes_all_pheno_phenom_pvalues.txt', header = F, stringsAsFactors=F)
rcp <- fread('/home/egeoffroy/sig_genes_all_pheno_phenom_rcp.txt', header = F, stringsAsFactors=F)

rcp <- rcp %>% select(V2, V3, V4)
pvalues <- pvalues %>% select(V2, V3, V4)


total <- merge(pvalues, rcp, by = c('V2', 'V3'), all = TRUE)
print(head(total))
colnames(total) <- c('GENE', 'Trait', 'P-value', 'RCP')
print(head(total))
#write out file

#add gene names
genes <- fread('/home/egeoffroy/Summary_Statistics/BP_Chrome_files/ALL_attempt_newBP.txt', header = T, stringsAsFactors=F)
colnames(genes) <- c('PROBE_ID', 'gene_name', 'chr', 'BP')
genes <- transform(genes, BP=as.numeric(BP))
genes$GENE <- gsub("\\..*","",genes$PROBE_ID)
print(head(genes))

output <- merge(total, genes, by = 'GENE')
output <- output %>% select('GENE', 'gene_name', 'Trait', 'P-value', 'RCP')
print(head(output))
write.table(output, 'all_phenomexcan_pvalues_rcp.txt', quote = F, row.names = F)
write.csv(output, 'all_phenomexcan_pvalues_rcp.csv', quote = F, row.names=F)
print(unique(output$gene_name))
