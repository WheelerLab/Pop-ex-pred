library(dplyr)
library(data.table)
library(stringr)
library(ggplot2)
#library(RColorBrewer)
library(gridExtra)
#library(ggpubr)
library(cowplot)
library(lattice)
library(grid)
#library(viridis)
#library(ggsci)

SPred <- fread('/home/egeoffroy/coloc/SPred_total_all_pheno.csv', header = T, sep = ',', stringsAsFactors = F)
print(head(SPred))

sig_hits <- data.frame()
phenotypes <- unique(SPred$Phenotype)
model <- unique(SPred$Model)
for(pheno in phenotypes){
  dat <- SPred %>% filter(Phenotype == pheno)
  for(mod in model){
    dat1 <- dat %>% filter(Model == mod)
    if(nrow(dat1) == 0){
      sig <- 0
      #dat2 <- data.frame(sig, pheno, mod)
    } else{
      sig <- nrow(dat1)
      dat2 <- data.frame(sig, pheno, mod)

    }
    if(dat2$pheno == 'White_blood'){
      dat2$pheno = 'WBC count'
    }
    if(dat2$pheno == 'Height53'){
      dat2$pheno = 'Height'
    }
    if(dat2$pheno == 'C-reactive'){
      dat2$pheno = 'C-reactive protein levels'
    }
    if(dat2$pheno == 'PR'){
      dat2$pheno = 'PR interval'
    }
    if(dat2$pheno == 'Platelet'){
      dat2$pheno = 'Platelet count'
    }
    dat2$pheno <- str_replace_all(dat2$pheno, '_', ' ')
    print(dat2)
    sig_hits <- rbind(sig_hits, dat2)
  }
}
print(sig_hits)
write.table(sig_hits, 'sig_hits_plotting.txt', quote= F, row.names=F, sep ='\t')
sig_hits <- sig_hits %>% filter(mod == 'AFHI' | mod == 'CAU')
sig_hits$mod <- str_replace_all(sig_hits$mod, 'CAU', 'EUR')
write.table(sig_hits, 'sig_hits_plotting_PAPER.txt', quote=F, row.names=F, sep='\t')
#mycolors = c(brewer.pal(name="Dark2", n = 8), brewer.pal(name="Paired", n = 10))
#sig_hits <- unique(sig_hits)
print(unique(sig_hits$pheno))
#colorsss <- c("#7570B3" ,"#E7298A", "#66A61E", "#E6AB02" ,"#A6761D", "#666666", "#A6CEE3", "#1F78B4", "#B2DF8A","#1B9E77", "#D95F02", "#33A02C", "#FB9A99")
colorsss <- c("#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", "#6A3D9A", "#276419", "#B15928", "#000000", "#8E0152")
positions <- c('WBC count', 'Platelet count', 'Mean corpuscular hemoglobin', 'C-reactive protein levels', 'Height', 'QRS duration', 'PR interval' , 'QT interval', 'Diabetes', 'Triglyceride', 'LDL cholesterol', 'HDL cholesterol', 'Total cholesterol' ,'Fasting glucose')
sig_hits$pheno <- factor(sig_hits$pheno, levels=positions)
#positions <- c("Smoking", "End renal", "Fasting insulin", "Fasting glucose", "Glomerular", "Coffee", "Body mass index", "QT interval", "Hypertension", "Systolic blood", "Diastolic blood", "QRS duration", "Waist-hip ratio", "Waist-hip ratio Female", "Waist-hip ratio Male", "PR interval", "Mean corpuscular hemoglobin", "Hemoglobin", "Diabetes", "Chronic kidney", "Platelet", "C-reactive", "Triglyceride", "Total cholesterol", "LDL cholesterol", "HDL cholesterol", "Height", "White Blood")
p <- ggplot(sig_hits, aes(x = pheno, y = sig, fill=pheno)) + coord_flip()+ geom_bar(stat = "identity") +
  labs( x="Phenotype", y = "Number of Hits")+theme(axis.text.y = element_text(color = "grey20", size = 10, hjust = .5, vjust = .5, face = "plain")) + facet_wrap(~mod) + scale_fill_manual(values = colorsss) +
  theme_minimal() + theme(legend.position = "none")
p
ggsave("/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Total_MESA_Wojcik_colorblind.tiff", device = 'tiff', width = 4, height = 4)

#positions <- c('White blood cell count', 'Platelet count', 'Mean corpuscular hemoglobin', 'C-reactive protein levels', 'Height', 'QRS duration', 'PR interval' , 'QT interval', 'Diabetes', 'Triglyceride',
positions <- c('WBC count', 'Height', 'HDL cholesterol', 'Total cholesterol', 'C-reactive protein levels', 'Triglyceride', 'LDL cholesterol', 'Platelet count', 'QT interval', 'PR interval', 'Mean corpuscular hemoglobin', 'Diabetes', 'QRS duration' )
positions <- c('Fasting glucose', 'QRS duration', 'Diabetes', 'Mean corpuscular hemoglobin', 'PR interval', 'QT interval' , 'Platelet count', 'LDL cholesterol', 'Triglyceride', 'C-reactive protein levels', 'Total cholesterol' ,'HDL cholesterol', 'Height', 'WBC count')
sig_hits$pheno <- factor(sig_hits$pheno, levels= positions)
#colorsss <- c("#000000", "#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", "#6A3D9A", "#FFFF99", "#B15928")
colorsss <- c("#8E0152", "#000000", "#B15928", "#276419", "#6A3D9A","#CAB2D6","#FF7F00","#FDBF6F","#E31A1C","#FB9A99","#33A02C","#B2DF8A","#1F78B4", "#A6CEE3")
print(sig_hits)
p1 <- ggplot(sig_hits, aes(x=pheno, y = sig, fill=pheno)) + coord_flip() + geom_bar(stat='identity')+labs(x="Phenotype", y = "Number of Hits")+theme(axis.text.y = element_text(color = "grey20", size = 10, hjust = .5, vjust = .5, face = "plain")) + facet_wrap(~mod) +theme_minimal() + theme(legend.position = "none") + scale_fill_manual(values = colorsss)
p1
ggsave('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Total_MESA_Wojcik_inordermax.tiff', device = 'tiff', p1, width = 4, height = 4)


AFHI <- SPred %>% filter(Model == 'AFHI')
CAU <- SPred %>% filter(Model == 'CAU')
var(AFHI$p4)
var(CAU$p4)
var.test(AFHI$p4, CAU$p4) #p-value 0.427 --> The p-value is greater than alpha at significant 0.05. From this we fail to reject the null hypothesis that the variances are equal.
t.test(AFHI$p4, CAU$p4, var.equal = TRUE)

var.test(AFHI$p3, CAU$p3)
t.test(AFHI$p3, CAU$p3, var.equal = TRUE)
