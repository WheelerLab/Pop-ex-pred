suppressMessages(library(dplyr))
suppressMessages(library(glmnet))
suppressMessages((library(reshape2)))
suppressMessages(library(methods))
"%&%" <- function(a,b) paste(a,b, sep = "")


get_filtered_snp_annot <- function(snp_annot_file_name) {
  snp_annot <- read.table(snp_annot_file_name, header = T, stringsAsFactors = F) %>%
    filter(!((ref_vcf == 'A' & alt_vcf == 'T') |
               (ref_vcf == 'T' & alt_vcf == 'A') |
               (ref_vcf == 'C' & alt_vcf == 'G') |
               (ref_vcf == 'G' & alt_vcf == 'C')) &
             !(is.na(rsid_dbSNP150))) %>%
    distinct(varID, .keep_all = TRUE)
  snp_annot
}


get_maf_filtered_genotype <- function(genotype_file_name,  maf, samples) {
  gt_df <- read.table(genotype_file_name, header = T, stringsAsFactors = F, row.names = 1)
  gt_df <- gt_df[,samples] %>% t() %>% as.data.frame()
  effect_allele_freqs <- colMeans(gt_df) / 2
  gt_df <- gt_df[,which((effect_allele_freqs >= maf) & (effect_allele_freqs <= 1 - maf))]
  gt_df
}

get_gene_annotation <- function(gene_annot_file_name, chrom, gene_types=c('protein_coding', 'pseudogene', 'lincRNA')){
  gene_df <- read.table(gene_annot_file_name, header = TRUE, stringsAsFactors = FALSE) %>%
    filter((chr == chrom) & gene_type %in% gene_types)
  gene_df
}

get_gene_type <- function(gene_annot, gene) {
  filter(gene_annot, gene_id == gene)$gene_type
}

get_gene_expression <- function(gene_expression_file_name, gene_annot) {
  expr_df <- as.data.frame(t(read.table(gene_expression_file_name, header = T, stringsAsFactors = F, row.names = 1)))
  expr_df <- expr_df %>% select(one_of(intersect(gene_annot$gene_id, colnames(expr_df))))
  expr_df
}

get_gene_coords <- function(gene_annot, gene) {
  row <- gene_annot[which(gene_annot$gene_id == gene),]
  c(row$start, row$end)
}

get_cis_genotype <- function(gt_df, snp_annot, coords, cis_window) {
  snp_info <- snp_annot %>% filter((pos >= (coords[1] - cis_window) & !is.na(rsid_dbSNP150)) & (pos <= (coords[2] + cis_window)))
  if (nrow(snp_info) == 0)
    return(NA)
  cis_gt <- gt_df %>% select(one_of(intersect(snp_info$varID, colnames(gt_df))))
  column_labels <- colnames(cis_gt)
  row_labels <- rownames(cis_gt)
  # Convert cis_gt to a matrix for glmnet
  cis_gt <- matrix(as.matrix(cis_gt), ncol=ncol(cis_gt)) # R is such a bad language.
  colnames(cis_gt) <- column_labels
  rownames(cis_gt) <- row_labels
  cis_gt
}

get_covariates <- function(covariate_file_name, samples) {
cov_df <- read.table(covariate_file_name, header = TRUE, stringsAsFactors = FALSE, row.names = 1)
  cov_df <- cov_df[,samples] %>% t() %>% as.data.frame()
  cov_df
}

generate_fold_ids <- function(n_samples, n_folds=10) {
  n <- ceiling(n_samples / n_folds)
  fold_ids <- rep(1:n_folds, n)
  sample(fold_ids[1:n_samples])
}

adjust_for_covariates <- function(expression_vec, cov_df) {
  combined_df <- cbind(expression_vec, cov_df)
  expr_resid <- summary(lm(expression_vec ~ ., data=combined_df))$residuals
  expr_resid <- scale(expr_resid, center = TRUE, scale = TRUE)
  expr_resid
}

calc_R2 <- function(y, y_pred) {
  tss <- sum(y**2)
  rss <- sum((y - y_pred)**2)
  1 - rss/tss
}

calc_corr <- function(y, y_pred) {
  sum(y*y_pred) / (sqrt(sum(y**2)) * sqrt(sum(y_pred**2)))
}

nested_cv_elastic_net_perf <- function(x, y, n_samples, n_train_test_folds, n_k_folds, alpha) {
  # Gets performance estimates for k-fold cross-validated elastic-net models.
  # Splits data into n_train_test_folds disjoint folds, roughly equal in size,
  # and for each fold, calculates a n_k_folds cross-validated elastic net model. Lambda parameter is
  # cross validated. Then get performance measures for how the model predicts on the hold-out
  # fold. Get the coefficient of determination, R^2, and a p-value, where the null hypothesis
  # is there is no correlation between prediction and observed.
  #
  # The mean and standard deviation of R^2 over all folds is then reported, and the p-values
  # are combined using Fisher's method.
  R2_folds <- rep(0, n_train_test_folds)
  corr_folds <- rep(0, n_train_test_folds)
  zscore_folds <- rep(0, n_train_test_folds)
  pval_folds <- rep(0, n_train_test_folds)
  # Outer-loop split into training and test set.
  train_test_fold_ids <- generate_fold_ids(n_samples, n_folds=n_train_test_folds)
  for (test_fold in 1:n_train_test_folds) {
    train_idxs <- which(train_test_fold_ids != test_fold)
    test_idxs <- which(train_test_fold_ids == test_fold)
    x_train <- x[train_idxs, ]
    y_train <- y[train_idxs]
    x_test <- x[test_idxs, ]
    y_test <- y[test_idxs]
    # Inner-loop - split up training set for cross-validation to choose lambda.
    cv_fold_ids <- generate_fold_ids(length(y_train), n_k_folds)
    y_pred <- tryCatch({
      # Fit model with training data.
      fit <- cv.glmnet(x_train, y_train, nfolds = n_k_folds, alpha = alpha, type.measure='mse', foldid = cv_fold_ids)
      # Predict test data using model that had minimal mean-squared error in cross validation.
      predict(fit, x_test, s = 'lambda.min')},
      # if the elastic-net model did not converge, predict the mean of the y_train (same as all non-intercept coef=0)
      error = function(cond) rep(mean(y_train), length(y_test)))
    R2_folds[test_fold] <- calc_R2(y_test, y_pred)
    # Get p-value for correlation test between predicted y and actual y.
    # If there was no model, y_pred will have var=0, so cor.test will yield NA.
    # In that case, give a random number from uniform distribution, which is what would
    # usually happen under the null.
    corr_folds[test_fold] <- ifelse(sd(y_pred) != 0, cor(y_pred, y_test), 0)
    zscore_folds[test_fold] <- atanh(corr_folds[test_fold])*sqrt(length(y_test) - 3) # Fisher transformation
    pval_folds[test_fold] <- ifelse(sd(y_pred) != 0, cor.test(y_pred, y_test)$p.value, runif(1))
  }
  R2_avg <- mean(R2_folds)
  R2_sd <- sd(R2_folds)
  rho_avg <- mean(corr_folds)
  rho_se <- sd(corr_folds)
  rho_avg_squared <- rho_avg**2
  # Stouffer's method for combining z scores.
  zscore_est <- sum(zscore_folds) / sqrt(n_train_test_folds)
  zscore_pval <- 2*pnorm(abs(zscore_est), lower.tail = FALSE)
  # Fisher's method for combining p-values: https://en.wikipedia.org/wiki/Fisher%27s_method
  pval_est <- pchisq(-2 * sum(log(pval_folds)), 2*n_train_test_folds, lower.tail = F)
  list(R2_avg=R2_avg, R2_sd=R2_sd, pval_est=pval_est, rho_avg=rho_avg, rho_se=rho_se, rho_zscore=zscore_est, rho_avg_squared=rho_avg_squared, zscore_pval=zscore_pval)
}

do_covariance <- function(gene_id, cis_gt, rsids, varIDs) {
  model_gt <- cis_gt[,varIDs, drop=FALSE]
  colnames(model_gt) <- rsids
  geno_cov <- cov(model_gt)
  geno_cov[lower.tri(geno_cov)] <- NA
  cov_df <- melt(geno_cov, varnames = c("rsid1", "rsid2"), na.rm = TRUE) %>%
    mutate(gene=gene_id) %>%
    select(GENE=gene, RSID1=rsid1, RSID2=rsid2, VALUE=value) %>%
    arrange(GENE, RSID1, RSID2)
  cov_df
}

main <- function(snp_annot_file, gene_annot_file, genotype_file, expression_file,
                 covariates_file, chrom, prefix, maf=0.01, n_folds=10, n_train_test_folds=5,
                 seed=NA, cis_window=1e6, alpha=0.5, null_testing=FALSE) {
  gene_annot <- get_gene_annotation(gene_annot_file, chrom)
  expr_df <- get_gene_expression(expression_file, gene_annot)
  samples <- rownames(expr_df)
  n_samples <- length(samples)
  genes <- colnames(expr_df)
  n_genes <- length(expr_df)

  # Set seed----
  seed <- ifelse(is.na(seed), sample(1:1000000, 1), seed)
  set.seed(seed)
  

  tiss_chr_summ_f <- '/home/egeoffroy/new_PredDB/elastic_net/new_outputs/' %&% prefix %&% '_chr' %&% chrom %&% '_tiss_chr_summary.txt'
  tiss_chr_summ_col <- c('n_samples', 'chrom', 'cv_seed', 'n_genes')
  tiss_chr_summ <- data.frame(n_samples, chrom, seed, n_genes)
  colnames(tiss_chr_summ) <- tiss_chr_summ_col
  write.table(tiss_chr_summ, file = tiss_chr_summ_f, quote = FALSE, row.names = FALSE, sep = '\t')
  
}
