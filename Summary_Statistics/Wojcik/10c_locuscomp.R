library(locuscomparer)
"%&%" = function(a,b) paste(a,b,sep="")
args = commandArgs(trailingOnly=TRUE)
pheno <- args[1]
pop <- args[2]
gene <- args[3]
gwas_fn = args[4]
eqtl_fn <- args[5]
png(paste('/home/egeoffroy/sig_genes_models/', pheno, '_', pop, '_', gene, '.png', sep = ''))
locuscompare(in_fn1 = gwas_fn, in_fn2 = eqtl_fn, title1 =  pheno %&% ' ' %&% gene %&% ' GWAS', title2 = pop %&% ' ' %&% gene %&% ' eQTL', pval_col1 = "pval", pval_col2 = "p_value")
dev.off()
