library(dplyr)
library(RSQLite)
"%&%" <- function(a,b) paste(a,b, sep='')

tissues <- c('AFR')
covars <- c(3)
peers <- c(10)
driver <- dbDriver("SQLite")
gene_annot <- read.table("/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/new_PredDB/elastic_net/prepare_data/expression/gencode.v18.annotation.parsed.txt", header = T, stringsAsFactors = F)

for (tiss in tissues) {
  print(tiss)
  # Extra table ----
  model_summaries <- read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/' %&% tiss %&% '_nested_cv_chr1_model_summaries_10_peer_10pcs.txt', header = T, stringsAsFactors = F)
  tiss_summary <- read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/' %&% tiss %&% '_nested_cv_chr1_tiss_chr_summary.txt', header = T, stringsAsFactors = F)
  print(model_summaries)
  n_samples <- tiss_summary$n_samples
  
  for (i in 2:22) {
    model_summaries <- rbind(model_summaries,
                             read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/' %&% tiss %&% '_nested_cv_chr' %&% as.character(i) %&% '_model_summaries_10_peer_10pcs.txt', header = T, stringsAsFactors = F))
    tiss_summary <- rbind(tiss_summary,
                          read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/' %&% tiss %&% '_nested_cv_chr' %&% as.character(i) %&% '_tiss_chr_summary.txt', header = T, stringsAsFactors = F))
  }
  print(tiss_summary)  
  model_summaries <- rename(model_summaries, gene = gene_id)
 #setwd('/home/elyse/jenny/jennifer/new_PredDB/elastic_net')
  #print(getwd())
  conn <- dbConnect(drv = driver, dbname='/home/egeoffroy/new_PredDB/elastic_net/dbs/' %&% tiss %&% '10_peer_10_pcs.db')
  dbWriteTable(conn, 'model_summaries', model_summaries, overwrite = TRUE)
  dbGetQuery(conn, "CREATE INDEX gene_model_summary ON model_summaries (gene)") #file crashes here 

    # Weights Table -----
  weights <- read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/' %&% tiss %&% '_nested_cv_chr1_weights_10_peer_10pcs.txt', header = T, stringsAsFactors = F)
  for (i in 1:22) {
    weights <- rbind(weights,
                     read.table('/home/egeoffroy/new_PredDB/elastic_net/outputs/' %&% tiss %&% '_nested_cv_chr' %&% as.character(i) %&% '_weights_10_peer_10pcs.txt', header = T, stringsAsFactors = F))
  }
  weights <- rename(weights, gene = gene_id, weight = beta, eff_allele=alt)
  #print(weights)
  dbWriteTable(conn, 'weights', weights, overwrite = TRUE)
  dbGetQuery(conn, "CREATE INDEX weights_rsid ON weights (rsid)")
  dbGetQuery(conn, "CREATE INDEX weights_gene ON weights (gene)")
  dbGetQuery(conn, "CREATE INDEX weights_rsid_gene ON weights (rsid, gene)")
  
  # Sample_info Table ----
  sample_info <- data.frame(n_samples = n_samples, population = 'African', tissue = tiss)
  dbWriteTable(conn, 'sample_info', sample_info, overwrite = TRUE)
  # Construction Table ----
  construction <- tiss_summary %>%
    select(chrom, cv_seed) %>%
    rename(chromosome = chrom)
  dbWriteTable(conn, 'construction', construction, overwrite = TRUE)
}
