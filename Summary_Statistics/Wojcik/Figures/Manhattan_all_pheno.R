#creates a manhattan and qq for MetaXcan results
"%&%" = function(a,b) paste(a,b,sep="")
library(readr)
library(data.table)
library(stringr)
library(dplyr)
library(ggplot2)
library(qqman)
#source("/home/angela/forJournals/GWAS/qqman.r")
all_dir <- list.dirs("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/", full.names=FALSE)
print(all_dir)
#for(dirs in all_dir){
#if(str_detect(dirs, "QT_interval")){
#print(paste("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik", dirs, sep='/'))
setwd(paste("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik"))
all_files = list.files(pattern = ".csv", full.names = TRUE, recursive = TRUE) #recursive is usually true except for plotting SMultiXcan results
print(all_files)




options(warn=-1)
output <- data.frame()
load_bp_chrom <- function(pop){
  BP_Chrome <- read.table(paste("/home/egeoffroy/Summary_Statistics/BP_Chrome_files/", pop, "_attempt_newBP.txt", sep = ''), header = T)
  colnames(BP_Chrome) <- c('PROBE_ID', 'gene_name', 'chr', 'BP')
  #BP_Chrome <- transform(BP_Chrome, chr=as.numeric(chr))
  #BP_Chrome %>% mutate(CHR = str_extract(chr, "[0-22]+")
  BP_Chrome <- transform(BP_Chrome, BP=as.numeric(BP))
  BP_Chrome$GENE <- gsub("\\..*","",BP_Chrome$PROBE_ID)
  print(BP_Chrome)
  #BP_Chrome$gene_name <- NULL
}

make_plots <- function(S_Pred_file, directory, title, name){
  print(S_Pred_file)
  pheno <- str_split(S_Pred_file, '/')[[1]][2]

  print(pheno)
  if(!str_detect(S_Pred_file, "GWAS")){
    if(!str_detect(S_Pred_file, "sig_genes")){
      if(str_detect(S_Pred_file, "ALL")){
        model <- "ALL"
        BP_Chrome <- load_bp_chrom('ALL')
      }
      if(str_detect(S_Pred_file, "SMulti")){
        model <- "S-MultiXcan"
        BP_Chrome <- load_bp_chrom('ALL')
      }
      if(str_detect(S_Pred_file, "AFA")){
        model <- "AFA"
        BP_Chrome <- load_bp_chrom('AFA')
      }
      if(str_detect(S_Pred_file, "HIS")){
        model <- "HIS"
        BP_Chrome <- load_bp_chrom('HIS')
      }
      if(str_detect(S_Pred_file, "AFHI")){
        model <- "AFHI"
        BP_Chrome <- load_bp_chrom('AFHI')
      }
      if(str_detect(S_Pred_file, "CAU")){
        model <- "CAU"
        BP_Chrome <- load_bp_chrom('CAU')
      }
      if(str_detect(S_Pred_file, "GTEX")){
        model <- str_split(S_Pred_file, '/')[[1]][4]
        model <- str_remove(model, '.csv')
        BP_Chrome <- load_bp_chrom('ALL')
      }
      if(str_detect(S_Pred_file, 'SMulti')){
        model <- 'GTEX_v7'
        BP_Chrome <- load_bp_chrom('ALL')
      }
      if(str_detect(S_Pred_file, "HapMap_ALL")){
        model <- "HapMap_ALL"
        BP_Chrome <- load_bp_chrom('ALL')
      }
      if(str_detect(S_Pred_file, "HapMap_ASN")){
        model <- "HapMap_ASN"
        BP_Chrome <- load_bp_chrom('ALL')
      }
      if(str_detect(S_Pred_file, "HapMap_AFR")){
        model <- "HapMap_AFR"
        BP_Chrome <- load_bp_chrom('ALL')
      }
      print(model)
      #model <- "GTEX"
      S_Pred_file <- read.table(S_Pred_file, header = T,  sep = ',')
      #print(S_Pred_file)

      #S_Pred_file$GENE <- S_Pred_file$gene
      S_Pred_file$GENE <- gsub("\\..*","",S_Pred_file$gene)
      S_Pred_file <- S_Pred_file[-c( 9)]
      names(S_Pred_file)[names(S_Pred_file) == 'pvalue'] <- 'P'
      print(head(S_Pred_file))
      GWAS <- merge(S_Pred_file, BP_Chrome, by = c('GENE', 'gene_name'))
      #print(GWAS)
      # GWAS <- right_join(S_Pred_file, BP_Chrome, by='GENE')
      GWAS <- na.omit(GWAS)
      colnames(GWAS)[14] <- "CHR"
      print(GWAS)
      GWAS <- GWAS %>%  #added by Jenny
        transform(CHR = str_replace(CHR, "chr", "")) #added by Jenny
      GWAS<- transform(GWAS, CHR=as.numeric(CHR)) #added by Jenny
      GWAS$Phenotype <- rep(pheno, nrow(GWAS))
      GWAS$Model <- rep(model, nrow(GWAS))
      # print(head(GWAS))
      #  threshold <- -log10(0.05/dim(GWAS)[1])
      threshold <- 5e-08
      #names(GWAS)[names(GWAS) == 'pvalue'] <- 'P'
      #  write.csv(GWAS, paste("/", directory, "/", model,  "_GWAS_5e8.csv", sep=""))
      #title = '' %&% l %&% ', ' %&% k %&% ''
      print(threshold)
      signif <- filter(GWAS,-log10(P) > -log10(5e-08))
      print(signif)
      signif <- unique(signif)
      return(GWAS)

    }
  }
}


Sum_Stat_Name <- "Wojcik" #change for each GWAS Summary Statistic
for (file in all_files) {
  #print(file)
  if(str_detect(file, 'MESA') && !str_detect(file, 'old')){
    print(file)
    directory <- paste(normalizePath(dirname(file)), '/', sep = '')
    print(directory)
    # read in the csv
    GWAS <- make_plots(file, directory, sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(file)), sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(file)))
    output <- rbind(output, GWAS)
    }
}
output <- output %>% filter(Model == 'CAU' | Model == 'AFHI')

#output$Phenotype <- str_replace(output$Phenotype, 'Height53', 'Height')
#output$Phenotype <- str_replace(output$Phenotype, '_', ' ')
#output$Phenotype <- str_replace(output$Phenotype, 'PR', 'PR interval')
#output$Phenotype <- str_replace(output$Phenotype, 'Platelet', 'Platelet count')
output$Model <- str_replace_all(output$Model, 'CAU', 'EUR')
write.table(output, '/home/egeoffroy/AFHI_EUR_sig_genes.csv', row.names=F, quote= F)
output <- output %>% filter(Phenotype == 'White_blood' | Phenotype == 'HDL_cholesterol' | Phenotype == 'LDL_cholesterol' | Phenotype == 'Triglyceride' | Phenotype == 'QT_interval' | Phenotype == 'Total_cholesterol' | Phenotype == 'QRS_duration' | Phenotype == 'PR' | Phenotype == 'Platelet' | Phenotype == 'Mean_corpuscular_hemoglobin'| Phenotype == 'Height53' | Phenotype == 'Diabetes' | Phenotype == 'C-reactive' | Phenotype == 'Fasting_glucose')
output$Phenotype <- str_replace_all(output$Phenotype, 'Height53', 'Height')
output$Phenotype <- str_replace_all(output$Phenotype, '_', ' ')
output$Phenotype <- str_replace_all(output$Phenotype, 'PR', 'PR interval')
output$Phenotype <- str_replace_all(output$Phenotype, 'Platelet', 'Platelet count')
output$Phenotype <- str_replace_all(output$Phenotype, 'White blood', 'WBC count')
output$Phenotype <- str_replace_all(output$Phenotype, 'C-reactive', 'C-reactive protein levels')
positions <- c('WBC count', 'Platelet count', 'Mean corpuscular hemoglobin', 'C-reactive protein levels', 'Height', 'QRS duration', 'PR interval' , 'QT interval', 'Diabetes', 'Triglyceride', 'LDL cholesterol', 'HDL cholesterol', 'Total cholesterol' , 'Fasting glucose')
print(output)

axis.set <- output %>%
  group_by(CHR) %>%
  summarize(center = (max(BP) + min(BP)) / 2)
ylim <- abs(floor(log10(min(output$P)))) + 2
sig <- 5e-8
# Prepare the dataset
output <- output %>%

  # Compute chromosome size
  group_by(CHR) %>%
  summarise(chr_len=max(BP)) %>%

  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  select(-chr_len) %>%

  # Add this info to the initial dataset
  left_join(output, ., by=c("CHR"="CHR")) %>%

  # Add a cumulative position of each SNP
  arrange(CHR, BP) %>%
  mutate( BPcum=BP+tot) %>%

  # Add highlight and annotation information
 # mutate( is_highlight=ifelse(SNP %in% snpsOfInterest, "yes", "no")) %>%

  # Filter SNP to make the plot lighter
  filter(-log10(P)>0.5)
  # Prepare X axis
axisdf <- output %>% group_by(CHR) %>% summarize(center=( max(BPcum) + min(BPcum) ) / 2 )
positions <- c('WBC count', 'Platelet count', 'Mean corpuscular hemoglobin', 'C-reactive protein levels', 'Height', 'QRS duration', 'PR interval' , 'QT interval', 'Diabetes', 'Triglyceride', 'LDL cholesterol', 'HDL cholesterol', 'Total cholesterol', 'Fasting glucose' )
output$Phenotype <- factor(output$Phenotype, levels = positions)
#colorsss <- c("#7570B3" ,"#E7298A", "#66A61E", "#E6AB02" ,"#A6761D", "#666666", "#A6CEE3", "#1F78B4", "#B2DF8A","#1B9E77", "#D95F02", "#33A02C", "#FB9A99")
colorsss <- c("#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", "#6A3D9A", "#276419", "#B15928", "#000000", "#8E0152")
p <- ggplot(output, aes(x = BPcum, y = -log10(P),
                          color = Phenotype)) + facet_wrap(~Model, nrow = 2)+
  geom_point(alpha = 0.75) +
  geom_hline(yintercept = -log10(sig), color = "grey40", linetype = "dashed") +
  scale_x_continuous(label = axisdf$CHR, breaks = axisdf$center) +
  scale_color_manual(values = colorsss) +
  scale_y_continuous(expand = c(0,0), limits = c(0, ylim)) +
  scale_size_continuous(range = c(0.5,3)) +
  labs(x = NULL,
       y = "-log10(p)") +
  theme_minimal() +
  theme( legend.position = 'bottom', legend.title = element_text(size = 12), legend.text = element_text(size = 12), strip.text = element_text(size=13),
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    axis.text.x = element_text(angle = 90, size = 8, vjust = 0.5)
  ) + ggsave('Manhattan_total_phenotype.tiff',device='tiff', width = 12, height = 6)


positions <- c('WBC count', 'Height', 'HDL cholesterol', 'Total cholesterol', 'C-reactive protein levels', 'Triglyceride', 'LDL cholesterol', 'Platelet count', 'QT interval', 'PR interval', 'Mean corpuscular hemoglobin', 'Diabetes', 'QRS duration', 'Fasting glucose')
output$Phenotype <- factor(output$Phenotype, levels = positions)
#colorsss <- c("#000000", "#B15928", "#FFFF99", "#6A3D9A","#CAB2D6","#FF7F00","#FDBF6F","#E31A1C","#FB9A99","#33A02C","#B2DF8A","#1F78B4", "#A6CEE3")
p1 <- ggplot(output, aes(x = BPcum, y = -log10(P),
                          color = Phenotype)) + facet_wrap(~Model, nrow = 2)+
  geom_point(alpha = 0.75) +
  geom_hline(yintercept = -log10(sig), color = "grey40", linetype = "dashed") +
  scale_x_continuous(label = axisdf$CHR, breaks = axisdf$center) +
  scale_color_manual(values = colorsss) +
  scale_y_continuous(expand = c(0,0), limits = c(0, ylim)) +
  scale_size_continuous(range = c(0.5,3)) +
  labs(x = NULL,
       y = "-log10(p)") +
  theme_minimal() +
  theme( legend.position = 'bottom', legend.title = element_text(size = 12), legend.text = element_text(size = 12), strip.text = element_text(size=13),                                                            panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    axis.text.x = element_text(angle = 90, size = 8, vjust = 0.5)
  ) + ggsave('Manhattan_total_phenotype_inordermax.tiff',device='tiff', width = 12, height = 6)
