pop=$1
pheno=$2
#gene=$2
input="/home/egeoffroy/sig_genes_models/list_sig_genes_${pop}_${pheno}.txt"
while IFS= read -r line
do
  echo "$line"
  Rscript /home/egeoffroy/locuscomp.R ${pheno} ${pop} ${line} /home/egeoffroy/sig_genes_models/${pheno}/GWAS_${pop}_${line}_pval.txt /home/egeoffroy/sig_genes_models/${pheno}/eQTL_${pop}_${line}.txt
done < "$input"
#Rscript /home/egeoffroy/locuscomp.R LDL ${pop} ${gene} /home/egeoffroy/sig_genes_models/LDL/GWAS_${pop}_${gene}_pval.txt /home/egeoffroy/sig_genes_models/LDL/eQTL_${pop}_${gene}.txt
