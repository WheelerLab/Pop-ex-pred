## Run DAP-G and FASTENLOC for the various models and Wojcik GWAS Summary Statistics

## MESA Model Preparation Steps
### MESA_make_estimates.R
This script makes the estimate files for the various MESA models. It uses the MESA cis eqtl summary statistics to calculate the standard error (SE) of the beta. From there, it selects the columns snps, beta, and SE to make the estimate file. 

Estimate file requirements for DAP-G: contains effect size estimates and corresponding standard errors for all p SNPs. The required format is as follows
```
snp_name_i  b_i  se(b_i)
```
### MESA_dapg_run.sh
This script calls dap-g using the appropriate estimate file from MESA_make_estimates.R and the LD correlation matrix file formed in LD_correlation_matrix.R. This step also requires the number of individuals in the model and the total sum of squares. 

Sample size: a numeric value. Use option -d_n sample_size to specify the sample szie.
Total sum of squares of phenotype: a numeric value. Use option -d_syy SST_value to specify SST.

Example dap-g call: 
```
dap-g -d_est sample_data/sim.1.est.dat -d_ld sample_data/sim.1.LD.dat -d_n 343 -d_syy 515.6
```

## Wojcik GWAS Summary Statistics Preparation Steps

### create_LD_blocks_Wojcik.sh
This script calls code developed by Ryan Schubert to assign LD blocks to the GWAS Summary Statistic data. The output looks like: 

```
chr#:snp_pos chr#:start:end z-score
```
