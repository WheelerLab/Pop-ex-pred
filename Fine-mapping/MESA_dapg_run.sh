#!/bin/bash

# Preliminary code for MESA AFA
dap-g -d_est /home/elyse/MESA_cis_eqtl/AFA_estimate.txt -d_ld LD_FILE_FOR_AFA_MESA_MODEL_GOES_HERE -d_n 233 -d_syy

# Preliminary code for MESA AFHI
dap-g -d_est /home/elyse/MESA_cis_eqtl/AFHI_estimate.txt -d_ld LD_FILE_FOR_AFHI_MESA_MODEL_GOES_HERE -d_n 585 -d_syy

# Preliminary code for MESA ALL
dap-g -d_est /home/elyse/MESA_cis_eqtl/ALL_estimate.txt -d_ld LD_FILE_FOR_ALL_MESA_MODEL_GOES_HERE -d_n 1163 -d_syy

# Preliminary code for MESA HIS
dap-g -d_est /home/elyse/MESA_cis_eqtl/HIS_estimate.txt -d_ld LD_FILE_FOR_HIS_MESA_MODEL_GOES_HERE -d_n 352 -d_syy

# Preliminary code for MESA CAU
dap-g -d_est /home/elyse/MESA_cis_eqtl/CAU_estimate.txt -d_ld LD_FILE_FOR_CAU_MESA_MODEL_GOES_HERE -d_n 578 -d_syy
