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
                        help='population',
                        required='True'
                        )
    parser.add_argument('-gwas', '--gwas_SS',
                        help='GWAS Summary Statistics File',
                        required='True'
                        )
    parser.add_argument('-meqtl', '--meqtl',
                        help='meQTL file'
                        )
    parser.add_argument('-frq', '--frq',
                        help='.frq file',
                        required='True'
                        )
    return parser.parse_args(args)

#retrieve command line arguments
args = check_arg(sys.argv[1:])
phenoid = args.pheno_id
pop = args.pop
frqfile = args.frq
gwasSS = args.gwas_SS

os.system('mkdir coloc')
command = 'Rscript SNP_list.R ' + gwasSS + ' ' + phenoid
result = subprocess.getoutput(command)
if args.meqtl:
    os.system('Rscript make_coloc_files.R ' + gwasSS + ' ' + frqfile + ' ' + phenoid + ' ' + result + ' ' + pop + ' ' + args.meqtl) #currently only for MESA models
else:
    os.system('Rscript make_coloc_files.R ' + gwasSS + ' ' + frqfile + ' ' + phenoid + ' ' + result + ' ' + pop) #currently only for MESA models

populations = {
  "AFA": 233,
  "AFHI": 585,
  "CAU": 578,
  "HIS": 352,
  "ALL": 1163,
  "YRI": 107
}

    
os.system('bash run_coloc.sh ' + pop + ' ' + phenoid + ' ' + populations.get(pop))    
