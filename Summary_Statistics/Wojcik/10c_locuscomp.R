library(locuscomparer)
library(dplyr)
library(stringr)
library(data.table)
"%&%" = function(a,b) paste(a,b,sep="")
args = commandArgs(trailingOnly=TRUE)
pheno <- args[1]
pop <- args[2]
gene <- args[3]
gwas_fn = args[4]
eqtl_fn <- args[5]
populations <- c( 'EUR', 'AMR')
if(pop == 'CAU'){
        pop <- 'EUR'
}
print(pheno)
if(pheno == 'Height53'){
        pheno1 <- 'Height'
}
if(pheno == 'White_blood'){
        pheno1 <- 'WBC count'
} else{
        pheno1 <- str_replace_all(pheno, '_', ' ')
        pheno1 <- str_replace_all(pheno1, '53', '')
}

print(pheno1)
png(paste('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LocusCompare/', 'EUR_LD_', pheno, '_', pop, '_', gene, '.png', sep = ''))
locuscompare(in_fn1 = gwas_fn, in_fn2 = eqtl_fn, title1 =  pheno1 %&% ' ' %&% gene %&% ' GWAS', title2 = pop %&%' ' %&% gene %&% ' eQTL', pval_col1 = "pval", pval_col2 = "p_value", population = 'EUR')
dev.off()

png(paste('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LocusCompare/AMR_LD_', pheno, '_', pop, '_', gene, '.png', sep = ''))
locuscompare(in_fn1 = gwas_fn, in_fn2 = eqtl_fn, title1 =  pheno1 %&% ' ' %&% gene %&% ' GWAS', title2 = pop %&% ' ' %&% gene %&% ' eQTL', pval_col1 = "pval", pval_col2 = "p_value", population = 'AMR')
dev.off()
#}
for(population in populations){

d1 <- read_metal(gwas_fn, 'rsid', 'p_value')
d2 <- read_metal(eqtl_fn, 'rsid', 'p_value')
merged = merge(d1, d2, by = "rsid", suffixes = c("1", "2"), all = FALSE)
output <- merged %>% filter(pval1 < 1e-05 && pval2 < 1e-05)
print(output)
#write.table(output, paste('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LocusCompare/', population, '_sig_pvalues_', pop, '_', pheno, '_', gene, '2.txt', sep =''), quote = F, row.names=F)
genome = 'hg19'
merged = get_position(merged, genome)
print(head(merged))
chr = unique(merged$chr)
if (length(chr) != 1) stop('There must be one and only one chromosome.')
snp = NULL
snp = get_lead_snp(merged, snp)
print(snp)
library(dplyr)
ld = retrieve_LD(chr, snp, population)
ld <- ld %>% filter(R2 >= 0.8)
print(ld)
write.table(ld, paste('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LocusCompare/', population, '_LD_', pop, '_', pheno, '_', gene, '.txt', sep =''), quote = F, row.names=F)

eqtl <- fread(eqtl_fn, header = T, stringsAsFactors=F)
gwas <- fread(gwas_fn, header = T, stringsAsFactors=F)
merged1 <- merge(eqtl, gwas, by = 'rsid', all = TRUE)
print(names(merged1))
sig_pvalues <- merged1 %>% filter(pval.x < 1e-05)
sig_pvalues <- sig_pvalues %>% filter(pval.y < 1e-05)
print(head(sig_pvalues))
write.table(sig_pvalues, paste('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/LocusCompare/', population, '_sig_pvalues_', pop, '_', pheno, '_', gene, '.txt', sep =''), quote = F, row.names = F)
}
