#Create new BP Chrom file... no DCAF8

old <- read.table('Summary_Statistics/BP_CHROM_2.txt' , header = T, stringsAsFactors=F)
new <- read.table('MESA/AFA_genenames.csv', header = T, stringsAsFactors = F)
colnames(old) <- c('gene', 'chr', 'BP', 'gene_name')  
data <- merge(old, new, by = c('gene', 'gene_name'))     
write.table(data, 'attemtpt_newBP.txt', quote=F, row.names=F)  
