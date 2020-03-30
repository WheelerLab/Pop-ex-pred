library(ggplot2)
library(data.table)

data1 <- fread("Wojcik37_White_blood_ALL.csv", header=T, stringsAsFactors=F)
data2 <- fread("Summary_Statistics/Summary_Stats/Wojcik/White_blood/ALLMESA_ALL2_White_blood_GWAS.csv", header=T, stringsAsFactors=F)

library(qqman)
png("Wojcik19_White_blood.png")
manhattan(data2, main = title, suggestiveline = 0, genomewideline = threshold)
dev.off()

png("Wojcik37_White_blood.png")
manhattan(data1, main = title, suggestiveline = 0, genomewideline = threshold)
dev.off()

ggplot()+
      geom_line(aes(x = data1$zscore, y = data2$zscore))+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      xlab("Wojcik Harmonised")+
      ylab("Wojcik original")
      
ggsave("Wojcik_zscore.png")
