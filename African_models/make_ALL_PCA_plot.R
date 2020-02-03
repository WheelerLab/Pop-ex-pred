library(data.table)
library(dplyr)
library(ggplot2)

pcs <- read.table("/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/QC/ALL/ALL.eigenvec", header =F)
pcdf <- data.frame(pcs) %>% rename (FID=V1, IID=V2, PC1=V3,PC2=V4,PC3=V5,PC4=V6,PC5=V7,PC6=V8,PC7=V9,PC8=V10,PC9=V11,PC10=V12)

print(pcdf)
hapmap_pop <- read.table("/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/PCA_txt/All_pops_PCA.txt", header = T) %>% select(IID, population)
print(hapmap_pop)

popinfo <- left_join(hapmap_pop,pcdf,by="IID", all=FALSE)
popinfo <- mutate(popinfo, pop=ifelse(is.na(population),'GWAS', as.character(population)))
table(popinfo$population)
print(popinfo)

gwas <- filter(popinfo,population=='GWAS')
hm3 <- filter(popinfo, grepl('NA',IID))
print(gwas)
print(hm3)
###PCA Plot 1 (PC1 vs PC2)

p <- ggplot() + geom_point(data=gwas,aes(x=PC1,y=PC2,col=population))+geom_point(data=hm3,aes(x=PC1,y=PC2,col=population))+ theme_bw() + scale_colour_brewer(palette="Paired")

ggsave("ALL_PCA_plot.png", p)
