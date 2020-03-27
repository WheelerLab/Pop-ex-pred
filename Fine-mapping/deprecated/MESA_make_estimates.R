library(stringr)
library(dplyr)
library(data.table)

#genotypes <- fread("/home/elyse/MESA_AFA_all_snps.txt", header =T, stringsAsFactors=F)

cis <- fread("/home/elyse/MESA_cis_eqtl/AFA_cis_eqtl_summary_statistics.txt.gz", header=T, stringsAsFactors=F)
cis <- cis %>% select(snps, beta, statistic)
cis$SE <- cis$beta/cis$statistic

cis <- cis %>% select(snps, beta, SE)
write.table(cis, "/home/elyse/MESA_cis_eqtl/AFA_estimate.txt", quote=F)
