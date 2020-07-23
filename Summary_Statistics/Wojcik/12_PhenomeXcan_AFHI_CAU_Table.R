library(data.table)
library(dplyr)
library(stringr)


Phenom <- fread('/home/egeoffroy/all_phenomexcan_pvalues_rcp.txt', header = T, stringsAsFactors=F)
Phenom <- Phenom %>% select(gene_name, Trait, `P-value`, RCP)
#Phenom <- Phenom %>% filter(`P-value` < 0.05)
#Phenom <- Phenom %>% filter(RCP > 0.5)
#print(Phenom %>% filter(gene_name == 'MSTO1'))



SPred <- fread('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/sig_genes_all_pheno.csv', sep=',', header =T, stringsAsFactors=F)
print(names(SPred))
SPred <- SPred %>% select(GENE, gene_name, CHR, Phenotype, Model, effect_size, P)
SPred <- SPred %>% filter(Model == 'AFHI' | Model == 'CAU') #CAU = EUR
SPred$Model <- str_replace_all(SPred$Model, 'CAU', 'EUR')
#SPred <- SPred %>% filter(p4 > 0.5)
SPred$Phenotype <- str_replace(SPred$Phenotype, '53', '')
print(nrow(SPred))
print(unique(SPred$gene_name))
print(SPred[duplicated(SPred$gene_name), ])


total <- merge(SPred, Phenom, by = 'gene_name', all.x = TRUE)
output <- data.frame()
total <- unique(total)
#print(total %>% filter(gene_name == 'CD300LF'))
#print(unique(total$gene_name))
for(i in 1:nrow(total)){
        row <- total[i, ]
        phenos <- str_split(row$Phenotype, '_')[[1]]
        if(is.na(row$Trait) || is.na(row$`P-value`)){
                output <- rbind(output, row)
        } else{
        for(pheno in phenos){
                print(pheno)
                if(pheno != 'PR' && (str_detect(row$Trait, pheno) || str_detect(row$Trait, tolower(pheno)))){
                        output <- rbind(output, row)
                        break
                } else if(pheno == 'PR' && str_detect(row$Trait, 'PR_interval')){
                        output <- rbind(output, row)
                } else if(pheno == 'HDL' && str_detect(row$Trait, 'High density')){
                        output <- rbind(output, row)
                #}else if(pheno == 'White'|| pheno == 'blood' || str_detect(row$Trait, 'white')){
                #       output <- rbind(output, row)
                #       break
                } else{
                        if(!str_detect(row$Trait, pheno) && !str_detect(row$Trait, tolower(pheno)) && !(pheno== 'White' && str_detect(row$Trait, 'white'))){
                        row$Trait <- 'Phenotype not tested for this gene'
                        row$RCP <- NA
                        row$`P-value` <- NA
                        output <- rbind(output, row)
                        }
                }

        }
        }
}

#print(unique(final$gene_name))
#print(final)
output <- unique(output)
#print(output)
print(unique(output$gene_name))
#print(nrow(output))
write.csv(output, 'all_COLOC_Phenom.csv', quote = F, row.names=F)
