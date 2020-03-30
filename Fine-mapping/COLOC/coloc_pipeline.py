import os
import sys
import argparse
import subprocess

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='Matrix EQTL to .dat format from .db SNP list')
    parser.add_argument('-g', '--geno',
                        help='input genotype folder',
                        required='True'
                        )
    parser.add_argument('-p', '--pheno',
                        help='input phenotype file',
                        required='True'
                        )
    parser.add_argument('-pid', '--pheno_id',
                        help='input phenotype id',
                        required='True'
                        )
    parser.add_argument('-b', '--pop',
                        help='group/pop id for group_id column of .dat file',
                        required='True'
                        )
    parser.add_argument('-gwas', '--gwas_SS',
                        help='GWAS Summary Statistics File',
                        required='True'
                        )
    return parser.parse_args(args)

#retrieve command line arguments
args = check_arg(sys.argv[1:])
geno_folder = args.geno
#phenofile = args.pheno
phenoid = args.pheno_id
pop = args.pop
gwasSS = args.gwas_SS

#os.system('Rscript SNP_list.R ' + gwasSS + ' ' + phenoid)
command = 'Rscript SNP_list.R ' + gwasSS + ' ' + phenoid
result = subprocess.check_output(command, shell=True)

