#!/bin/bash
estimate=$1 #/home/elyse/MESA_cis_eqtl/AFA_estimate.txt
ld_file=$2
n=$3 #233
ssd=$4

# Preliminary code
dap-g -d_est estimate -d_ld ld_file -d_n n 


