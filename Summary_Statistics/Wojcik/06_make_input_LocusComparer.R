library(locuscomparer)
library(data.table)

"%&%" = function(a,b) paste(a,b,sep="")
pop <- c("AFA")
pheno <- c("WBC")

sig_gene_SNPs <- fread(paste("/coloc/GWAS_SNPs_", phenos, ".txt", sep = ''), header = F) #so we don't run all the SNPs b/c it takes forever
sig_gene_SNPs <- sig_gene_SNPs$V1

for(pop in 1:length(pops)){ #read in pop's .frq file for MAF
  frq <- fread("/home/angela/px_his_chol/MESA_compare/" %&% pops[pop] %&% ".frq")
  frq <- frq %>% dplyr::select(SNP, MAF)

  for(pheno in phenos){ #read in GEMMA output file
    GEMMA_result <- fread("/home/elyse/Wojcik_build37/31217584-GCST008049-EFO_0004308-build37.f.tsv.gz", header = T)
    GEMMA_for_COLOC <- GEMMA_result %>% dplyr::select(variant_id, p_value) #subset to COLOC input
    colnames(GEMMA_for_COLOC) <- c("rsid", "p-value")
    GEMMA_for_COLOC <- GEMMA_for_COLOC[complete.cases(GEMMA_for_COLOC),] #COLOC does not like missing values
    #GWAS_write <- data.frame(panel_variant_id = character(), effect_size = numeric(), standard_error = numeric(), frequency = numeric(), sample_size = numeric(), stringsAsFactors = F)
    GWAS_write <- GEMMA_for_COLOC
    eQTL_write <- data.frame(rsid = character(), p_value = numeric(), stringsAsFactors = F)

    for(chr in chrs){ #yes triple loops are ratchet
      system("zcat -f /home/wheelerlab3/files_for_revisions_plosgen/meqtl_results/MESA/" %&% pops[pop] %&% "_Nk_10_PFs_chr" %&% chr %&% "pcs_3.meqtl.cis.* > /home/elyse/coloc/meQTL_MESA_input.txt") #fread doesn't seem to like wildcards so we're gonna do this the ugly way
      meqtl <- fread("/home/elyse/coloc/meQTL_MESA_input.txt", nThread = 40) #read in matrix eQTL results
      meQTL_for_COLOC <- left_join(meqtl, frq, by = c("snps" = "SNP")) #add freq to COLOC input
      meQTL_for_COLOC <- meQTL_for_COLOC %>% dplyr::select(snps, pvalue) #subset to COLOC input
      colnames(meQTL_for_COLOC) <- c("rsid", "p-value")
      meQTL_for_COLOC <- meQTL_for_COLOC[complete.cases(meQTL_for_COLOC),]

      #GWAS_write <- rbind(GWAS_write, GEMMA_for_COLOC_chr)
      eQTL_write <- rbind(eQTL_write, meQTL_for_COLOC)
    }

    snps_in_both <- intersect(GWAS_write$rsid, eQTL_write$rsid) #is there a better way to do this? Probably. Do I feel like figuring it out? Nah.
    snps_in_all <- intersect(snps_in_both, sig_gene_SNPs)
    GWAS_write <- subset(GWAS_write, rsid %in% snps_in_all)
    eQTL_write <- subset(eQTL_write, rsid %in% snps_in_all)
    #GWAS_write <- GWAS_write[order(GWAS_write$gene_id),] #don't order a column that doesn't exist
    #eQTL_write <- eQTL_write[order(eQTL_write$gene_id),]

    fwrite(eQTL_write, "/home/elyse/eQTL_" %&% pops[pop] %&% "_" %&% pheno %&% ".txt", quote = F, sep = "\t", na = "NA", row.names = F, col.names = T)
    #gzip("/home/elyse/eQTL_" %&% pops[pop] %&% "_" %&% pheno %&% ".txt", destname = "/home/elyse/eQTL_" %&% pops[pop] %&% "_" %&% pheno %&% ".txt.gz") #script may only take .gz values so can't hurt to be too careful
    fwrite(GWAS_write, "/home/elyse/GWAS_" %&% pops[pop] %&% "_" %&% pheno %&% ".txt", row.names = F, col.names = T, sep = "\t", quote = F, na = "NA")
    #gzip("/home/elyse/GWAS_" %&% pops[pop] %&% "_" %&% pheno %&% ".txt", "/home/elyse/GWAS_" %&% pops[pop] %&% "_" %&% pheno %&% ".txt.gz")
    print("Completed with " %&% pops[pop] %&% ", for " %&% pheno %&% ".")
  }
}
