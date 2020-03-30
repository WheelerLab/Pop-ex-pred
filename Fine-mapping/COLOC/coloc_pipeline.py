import os
import sys
import argparse
import subprocess

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='Run coloc for various GWAS SS')
    parser.add_argument('-pid', '--pheno_id',
                        help='input phenotype id',
                        required='True'
                        )
    parser.add_argument('-b', '--pop',
                        help='population group: either MESA or HapMap',
                        required='True'
                        )
    parser.add_argument('-gwas', '--gwas_SS',
                        help='GWAS Summary Statistics File',
                        required='True'
                        )
    return parser.parse_args(args)

#retrieve command line arguments
args = check_arg(sys.argv[1:])
phenoid = args.pheno_id
pop = args.pop
gwasSS = args.gwas_SS

os.system('mkdir coloc')
#os.system('Rscript SNP_list.R ' + gwasSS + ' ' + phenoid)
command = 'Rscript SNP_list.R ' + gwasSS + ' ' + phenoid
result = subprocess.getoutput(command)
os.system('Rscript make_coloc_files.R ' + gwasSS + ' ' + phenoid + ' ' + result) #currently only for MESA models

if pop == "MESA":
    populations = ["AFA", "AFHI", "CAU", "HIS", "ALL"]
    population_size = [233, 585, 578, 352, 1163]
if pop == 'HapMap'"
    populations = ["YRI"]
    population_size = [107]
    
for population in range(len(populations)):
        os.system('bash run_coloc.sh ' + populations[population] + ' ' + phenoid + ' ' + population_size[population])    
