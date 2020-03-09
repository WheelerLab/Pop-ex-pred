## Run DAP-G and FASTENLOC for the various models and Wojcik GWAS Summary Statistics

## MESA Model Preparation Steps
### MESA_make_estimates.R
This script makes the estimate files for the various MESA models. It uses the MESA cis eqtl summary statistics to calculate the standard error (SE) of the beta. From there, it selects the columns snps, beta, and SE to make the estimate file. 

Estimate file requirements for DAP-G: contains effect size estimates and corresponding standard errors for all p SNPs. The required format is as follows
```
snp_name_i  b_i  se(b_i)
```

## Wojcik GWAS Summary Statistics Preparation Steps

### create_LD_blocks_Wojcik.sh
This script calls code developed by Ryan Schubert to assign LD blocks to the GWAS Summary Statistic data. The output looks like: 

```
chr#:snp_pos chr#:start:end z-score
```
