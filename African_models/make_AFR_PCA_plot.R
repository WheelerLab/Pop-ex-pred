library(data.table)
library(dplyr)
library(ggplot2)

pcs <- read.table("/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/AFR_pcs.txt", header =T)
#pcdf <- data.frame(pcs) %>% rename (FID=V1, IID=V2, PC1=V3,PC2=V4,PC3=V5,PC4=V6,PC5=V7,PC6=V8,PC7=V9,PC8=V10,PC9=V11,PC10=V12)

#print(pcdf)
#hapmap_pop <- read.table("/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/PCA_txt/African_PCA.txt", header = T) %>% select(IID, population)
#print(hapmap_pop)

#popinfo <- left_join(hapmap_pop,pcdf,by="IID")
#print(popinfo)

#gwas <- filter(popinfo,population=='GWAS')
#hm3 <- filter(popinfo, grepl('NA',IID))
###PCA Plot 1 (PC1 vs PC2)

p <- ggplot() + geom_point(data=pcs,aes(x=PC1,y=PC2,col=population))+ theme_bw() + scale_colour_brewer(palette="Set1")
ggsave("AFR_PCA_plot.png", p)
