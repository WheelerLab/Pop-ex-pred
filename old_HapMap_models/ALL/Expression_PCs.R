Combined_expression <- read.table("/home/elyse/HapMap_models/combined_expression.txt", header = F)
asianpcs<-read.table("/home/elyse/HapMap_models/HapMap_autosome_PC.txt", header = T)
#View(asianpcs)
cols<-c(1:2,4:17)
asianpcs2<-asianpcs[cols,]
cols<-c(1:2,4:14)
asianpcs2<-asianpcs[,cols]
#View(asianpcs2)
asianpcs3<-asianpcs2[colnames(Combined_expression),]
#View(asianpcs3)
#View(asianpcs3)
asianpcs3<-asianpcs2[colnames(Combined_expression) %in% asianpcs2$FID,]
#View(asianpcs3)
asianpcs4<-asianpcs2[order(colnames(Combined_expression)),]
#View(asianpcs4)
asianpcs5<-asianpcs4[-1,]
#View(asianpcs5)
#View(asianpcs4)
Combined_expressiontest<-Combined_expression[,-1]
#View(Combined_expressiontest)
asianpcs4<-asianpcs2[order(colnames(Combined_expression)),]
#View(asianpcs4)
#View(asianpcs5)
write.table(asianpcs5, "/home/elyse/HapMap_models/ALL.txt", row.names = F, quote = F, sep = " ")
#View(asianpcs5)
