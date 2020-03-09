#!/bin/bash
#try to get LD corr matrix
cd AFA_dat_files
files=$(find) 

dap-g -d sbams_data/ENSG00000266753.dat --dump_summary
#A text file LD.dat containing correlation matrix and a text file zval.dat will be generated
 mv LD.dat ENSG00000266753_LD.dat
 mv zval.dat ENSG00000266753_zval.dat
