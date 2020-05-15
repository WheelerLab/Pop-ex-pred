setwd("/home/egeoffroy/model_scripts/")
source("AFR_make_tiss_chrom.R")
"%&%" <- function(a,b) paste(a,b, sep='')
argv <- commandArgs(trailingOnly = TRUE)
tiss <- argv[1]
chrom <- argv[2]
tiss <- "AFR"
for (i in 1:22){
  snp_annot_file <- "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/prepare_data/genotypes/AFR/AFR_snp.chr" %&% i %&% ".txt"
  print(snp_annot_file)
  gene_annot_file <- "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/prepare_data/expression/gencode.v18.annotation.parsed.txt"
  genotype_file <- "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/prepare_data/genotypes/AFR/AFR_annot.chr" %&% i %&% ".txt" #hopefully still copying
  print(genotype_file)
  expression_file <- "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/prepare_data/expression/" %&% tiss %&% "_expression_ens.txt"
  print(expression_file)
  covariates_file <- "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/prepare_data/covariates/" %&% tiss %&% "_final_pcs.txt"
  prefix <- tiss %&% "_nested_cv"
  main(snp_annot_file, gene_annot_file, genotype_file, expression_file, covariates_file, as.numeric(i), prefix, null_testing=FALSE)
}
