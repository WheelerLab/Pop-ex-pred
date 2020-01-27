#creates a manhattan and qq for MetaXcan results
"%&%" = function(a,b) paste(a,b,sep="")
library(readr)
library(data.table)
library(stringr)
library(dplyr)
library(qqman)
options(warn=-1)

BP_Chrome <- read.table("/home/egeoffroy/Summary_Statistics/BP_CHROM_2.txt", header = T)
  #BP_Chrome <- transform(BP_Chrome, chr=as.numeric(chr))
  BP_Chrome <- transform(BP_Chrome, BP=as.numeric(BP))
  BP_Chrome$GENE <- gsub("\\..*","",BP_Chrome$PROBE_ID)
  print(BP_Chrome)
  #BP_Chrome$gene_name <- NULL

make_plots <- function(S_Pred_file, directory, title, name){
  print(S_Pred_file) 
 if(str_detect(S_Pred_file, "ALL")){
        model <- "ALL"
  }
  if(str_detect(S_Pred_file, "AFA")){
        model <- "AFA"
  }
  if(str_detect(S_Pred_file, "HIS")){
        model <- "HIS"
  }
  if(str_detect(S_Pred_file, "AFHI")){
        model <- "AFHI"
  }
  if(str_detect(S_Pred_file, "CAU")){
        model <- "CAU"
  } 
   if(str_detect(S_Pred_file, "GTEX")){
        model <- "GTEX"
   }
   if(str_detect(S_Pred_file, "HapMap_ALL")){
        model <- "HapMap_ALL"
   }

print(model)
  S_Pred_file <- read.table(S_Pred_file, header = T,  sep = ',')
  #print(S_Pred_file)
  
  #S_Pred_file$GENE <- S_Pred_file$gene
  S_Pred_file$GENE <- gsub("\\..*", "", S_Pred_file$gene) 

  
  S_Pred_file <- S_Pred_file[-c( 9)]
  names(S_Pred_file)[names(S_Pred_file) == 'pvalue'] <- 'P'

GWAS <- merge(S_Pred_file, BP_Chrome, by = c('GENE', 'gene_name'))
  GWAS <- na.omit(GWAS)
  colnames(GWAS)[14] <- "CHR"
  GWAS <- GWAS %>%  #added by Jenny
    transform(CHR = str_replace(CHR, "chr", "")) #added by Jenny
  GWAS<- transform(GWAS, CHR=as.numeric(CHR)) #added by Jenny
  print(GWAS)
  
  threshold <- -log10(0.05/dim(GWAS)[1])
  print(threshold)
  
  signif <- filter(GWAS,-log10(P) > -log10(0.05/dim(GWAS)[1]))
  print(signif)
  signif <- unique(signif)  
  
  png(file = paste("/", directory, "/", model,  name, "_man.png", sep=""))
  manhattan(GWAS, main = title, suggestiveline = 0, genomewideline = threshold)
  dev.off()
  
  png(file = paste("/", directory, "/", model, name, "_qq.png", sep=""))
  qq(GWAS$P, main = title)
  dev.off()
  
  write.csv(signif, paste("/", directory, "/", model,  name, "_sig_genes.csv", sep="")) #make table of top genes
  
}
