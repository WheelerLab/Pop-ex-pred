library(data.table)
library(dplyr)
library(ggplot2)

jenny <- read.table("/home/elyse/jenny/jennifer/QC/ALL/ALL.eigenvec", header = F)
jenny <- data.frame(jenny) %>% rename (FID=V1, IID=V2, PC1=V3,PC2=V4,PC3=V5,PC4=V6,PC5=V7,PC6=V8,PC7=V9,PC8=V10,PC9=V11,PC10=V12)

pcs <- read.table("/home/elyse/HapMap_models/plink_files/HapMap_PC_autosome.eigenvec", header =F, stringsAsFactors = F)
print(nrow(pcs))
pcdf <- data.frame(pcs) %>% rename(FID=V1, IID=V2, PC1=V3,PC2=V4,PC3=V5,PC4=V6,PC5=V7,PC6=V8,PC7=V9,PC8=V10,PC9=V11,PC10=V12)

#print(pcdf)
hapmap_pop <- read.table("/home/elyse/HapMap3-genotypes/relationships_w_pops_121708.txt", header = T, stringsAsFactors=F) %>% select(IID, population)
hapmap <- c("CHB", 'MKK', 'YRI', 'LWK', 'MEX', 'JPT', 'GIH')
hapmap_pop <- subset(hapmap_pop, population %in% hapmap)
print(hapmap_pop)
#hapmap_pop <- filter(hapmap_pop, population == hapmap)
#hapmap_pop <- na.omit(hapmap_pop)
#popinfo <- mutate(popinfo, pop=ifelse(is.na(pop),'GWAS', as.character(pop)))
#table(popinfo$pop)
#print(hapmap_pop)
jenny_pop <- merge(hapmap_pop, jenny, by="IID")
popinfo <- merge(hapmap_pop,pcdf,by="IID")
#print(unique(popinfo$population))
jenny_pop$Type <- rep("Jenny", nrow(jenny_pop))
popinfo$Type <- rep("Elyse", nrow(popinfo))
#popinfo <- merge(jenny_pop, popinfo, by="Type")
popinfo <- na.omit(popinfo)
print(popinfo)

###PCA Plot 1 (PC1 vs PC2)
cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#F8766D",
          "#F0E442", "#00BA38", "#619CFF", "#CC6666", "#9999CC", "#66CC99", "#009933", "#CC66CC", "#FF9933", "#FF0033")
p <- ggplot() +geom_point(data=popinfo,aes(x=PC2,y=PC3,col=interaction(Type, population,sep="-",lex.order=TRUE)))+ theme_bw() + scale_colour_manual(values=cbp1) #+ scale_colour_brewer(palette="Set1")
p <- p + geom_point(data=jenny_pop, aes(x=PC2, y=PC3, col=interaction(Type,population,sep="-",lex.order=TRUE)))+ labs(col = "Population")
ggsave("HapMap_models/compareJenny_PCA_2_3.png", p)


#p2 <- ggplot() +geom_point(data=popinfo,aes(x=PC1,y=PC3,col=population))+ theme_bw() + scale_colour_manual(values=cbp1) #+ scale_colour_brewer(palette="Set1")
p2 <- ggplot() +geom_point(data=popinfo,aes(x=PC1,y=PC3,col=interaction(Type, population,sep="-",lex.order=TRUE)))+ theme_bw() + scale_colour_manual(values=cbp1)
p2 <- p2 + geom_point(data=jenny_pop, aes(x=PC1, y=PC3, col=interaction(Type,population,sep="-",lex.order=TRUE)))+ labs(col = "Population")
ggsave("HapMap_models/compareJenny_PCA_1_3.png", p2)

#p3 <- ggplot() +geom_point(data=popinfo,aes(x=PC1,y=PC2,col=population))+ theme_bw() + scale_colour_manual(values=cbp1) #+ scale_colour_brewer(palette="Set1")
p3 <- ggplot() +geom_point(data=popinfo,aes(x=PC1,y=PC2,col=interaction(Type, population,sep="-",lex.order=TRUE)))+ theme_bw() + scale_colour_manual(values=cbp1)
p3 <- p3 + geom_point(data=jenny_pop, aes(x=PC1, y=PC2, col=interaction(Type,population,sep="-",lex.order=TRUE)))+ labs(col = "Population")
ggsave("HapMap_models/compareJenny_PCA_1_2.png", p3)

cbp <- c("#999999", "#E69F00", "#56B4E9", "#F8766D",
          "#F0E442", "#00BA38", "#619CFF")
merged_data <- merge(jenny_pop, popinfo, by=c("IID", "population"))
print(head(merged_data))
p1 <- ggplot() +geom_point(merged_data, mapping = aes(x=PC1.x, y=PC1.y, col=population)) + theme_bw() + scale_colour_manual(values=cbp) + labs(x = "PC1 Jenny", y = "PCA New")
ggsave("HapMap_models/compareJenny_PC1.png", p1)
