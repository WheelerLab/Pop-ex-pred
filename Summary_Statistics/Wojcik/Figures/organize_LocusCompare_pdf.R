library(dplyr)
library(data.table)
library(stringr)

AFHI_low_p3_files <- c('/home/elyse/sig_genes_models/AMR_LD_C-reactive_AFHI_DCAF8.png', '/home/elyse/sig_genes_models/AMR_LD_C-reactive_AFHI_TAGLN2.png', '/home/elyse/sig_genes_models/AMR_LD_C-reactive_AFHI_SLAMF8.png',
  '/home/elyse/sig_genes_models/AMR_LD_C-reactive_AFHI_UBE2Q1.png', '/home/elyse/sig_genes_models/AMR_LD_C-reactive_AFHI_MNDA.png', '/home/elyse/sig_genes_models/AMR_LD_Height53_AFHI_HMGA1.png',
  '/home/elyse/sig_genes_models/AMR_LD_Height53_AFHI_STRBP.png', '/home/elyse/sig_genes_models/AMR_LD_Height53_AFHI_IL8.png',  '/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_AFHI_DOCK7.png',
'/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_AFHI_PSRC1.png','/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_AFHI_TMEM258.png', '/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_AFHI_APOM.png', '/home/elyse/sig_genes_models/AMR_LD_Total_cholesterol_AFHI_BRE.png',
'/home/elyse/sig_genes_models/AMR_LD_Triglyceride_AFHI_APOM.png')
White_blood <- c('DUSP12','SLC25A24','ARHGEF2','TXNIP','MSTO1','DCAF8','FCGR2A','RRNAD1','MRPL24','ISG20L2','SETDB1','HAX1','ILF2','RIT1','CREB5','RHOC','CD1D','TAGLN2','SLAMF8','B4GALT3','FCGR3B','TNFAIP8L2','NBPF10','ATP1A1','MNDA','FAM46C','HIST2H2AB','HIST2H2BE','POLR3C','GPR89B','S100A10','S100A6','SH2D1B','CD247','MLLT11')
white <- list.files('/home/elyse/sig_genes_models/', pattern = 'AMR_LD_White_blood_AFHI', full.names=T)
total <- c()
i <- 0
for(file in white){
  if(str_detect(file, White_blood)){
    total[i] <- png
    i <- i + 1
  }
}
total <- c(AFHI_low_p3_files, total)
print(total)
CAU_low_p3_files <- c('/home/elyse/sig_genes_models/AMR_LD_C-reactive_CAU_ADAR.png', '/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_CAU_DOCK7.png', '/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_CAU_PSRC1.png','/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_CAU_TMEM258.png'
                     , '/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_CAU_POC5.png', '/home/elyse/sig_genes_models/AMR_LD_LDL_cholesterol_CAU_USP24.png', '/home/elyse/sig_genes_models/AMR_LD_White_blood_CAU_MED24.png',
                     '/home/elyse/sig_genes_models/AMR_LD_White_blood_CAU_CASC3.png', '/home/elyse/sig_genes_models/AMR_LD_White_blood_CAU_MRPL24.png', '/home/elyse/sig_genes_models/AMR_LD_White_blood_CAU_ILF2.png',
                     '/home/elyse/sig_genes_models/AMR_LD_White_blood_CAU_HIST2H2AC.png')



