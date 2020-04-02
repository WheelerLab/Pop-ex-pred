library(locuscomparer)
"%&%" = function(a,b) paste(a,b,sep="")
args = commandArgs(trailingOnly=TRUE)
pheno <- args[1]
pop <- args[2]
gwas_fn = args[3]
eqtl_fn <- args[4]
locuscompare(in_fn1 = gwas_fn, in_fn2 = eqtl_fn, title1 =  pheno %&% ' GWAS', title2 = pop %&% ' eQTL')
