library(dplyr)
library(data.table)

args = commandArgs(trailingOnly=TRUE)
prefix = args[1]
pop = args[2]
data <- fread(paste(prefix, ".enloc.sig.out", sep = ''), header =F)
data <- data[order(data$V6, decreasing = TRUE), ]
print(data[1:100, ])
#data <- data %>% filter(V6 >= 0.5)
write.table(data[1:10, ], paste(prefix, "significant_rcp.txt", sep=''), quote=F, col.names=F, row.names=F) 
