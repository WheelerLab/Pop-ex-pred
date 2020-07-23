#library(dplyr)
library(ggplot2)
library(ggVennDiagram)

AFHI <- read.table('C/home/egeoffroy/AFHI_COLOC_Results.csv', sep = ',', header = T)
AFHI <- AFHI[,1:2]
#AFHI <- unique(AFHI)

CAU <- read.table('/home/egeoffroy/CAU_COLOC_Results.csv', sep = ',', header = T)
CAU <- CAU[,1:2]
#CAU <- unique(CAU)

gene_names <- read.table('/home/egeoffroy/Summary_Statistics/BP_Chrome_files/ALL_attempt_newBP.txt', header = T)
colnames(gene_names) <- c('PROBE_ID', 'gene_name', 'chr', 'BP')
gene_names <- transform(gene_names, BP=as.numeric(BP))
gene_names$GENE <- gsub("\\..*","",gene_names$PROBE_ID)

wojcik <- read.table('/home/egeoffroy/Wojcik_genes.tsv', sep = '\t', header = T, stringsAsFactors=F) #table of gene_names and phenotypes from upstream/downstream genes near significantly associated SNP from Wojcik
wojcik <- unique(wojcik)
print(head(wojcik))

AFHI <- paste(AFHI$gene_name, '-', AFHI$Phenotype, sep =' ')
CAU <- paste(CAU$gene_name, '-', CAU$Phenotype, sep =' ')
wojcik <- paste(wojcik$gene_name, '-', wojcik$Phenotype, sep =' ')
x <- list(A=AFHI, B=CAU, C=wojcik)
y <- data.frame(A=AFHI, B=CAU)
ggVennDiagram(y)
ggVennDiagram(x,category.names = c("S-PrediXcan AFHI", "S-PrediXcan EUR", 'PAGE GWAS')) + scale_fill_gradient()

# Prepare a palette of 3 colors with R colorbrewer:
library(RColorBrewer)
myCol <- brewer.pal(3, "Pastel2")
library(VennDiagram)
venn.diagram(
  x = list(AFHI, CAU, wojcik),
  category.names = c("S-PrediXcan AFHI" , "S-PrediXcan EUR" , "PAGE GWAS"),
  filename = '#14_venn_diagramm.png',
  output=TRUE, 
  # Output features
  imagetype="png" ,
  compression = "lzw",
  
  # Circles
  lwd = 2,
  lty = 'blank',
  fill = myCol,
  
  # Numbers
  cex = 1,
  fontface = "bold",
  fontfamily = "sans",
  
  # Set names
  cat.cex = 1,
  cat.fontface = "bold",
  cat.default.pos = "outer",
  cat.pos = c(-27, 27, 135),
  cat.dist = c(0.055, 0.055, 0.085),
  cat.fontfamily = "sans",
  rotation = 1
)
