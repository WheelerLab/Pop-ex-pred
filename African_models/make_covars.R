library(dplyr)
"%&%" <- function(a,b) paste(a,b, sep='')
tiss <- c("AFR")

covariance <- read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/AFR_nested_cv_chr1_covariances_10_peer_10pcs.txt', header = T, stringsAsFactors = F)
for (i in 2:22) {
        covariance <- rbind(covariance, read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/' %&% tiss %&% '_nested_cv_chr' %&% as.character(i) %&% '_covariances_10_peer_10pcs.txt', header = T, stringsAsFactors = F))
}
write.table(covariance, file = "/home/egeoffroy/new_PredDB/AFR_covars.txt", row.names=F, sep='\t',quote=F)
