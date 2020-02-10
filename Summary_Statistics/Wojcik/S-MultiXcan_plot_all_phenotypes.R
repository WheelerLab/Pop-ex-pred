
original_gwas_assoc_Fasting_glucose <- length(unique(data_glucose$`MAPPED_GENE`))
original_gwas_assoc_Fasting_insulin <- length(unique(data_insulin$`MAPPED_GENE`))
original_gwas_assoc_Hemoglobin <- length(unique(data_hemo$`MAPPED_GENE`))
original_gwas_assoc_LDL <- length(unique(data_ldl$`MAPPED_GENE`))
original_gwas_assoc_Hypertension <- length(unique(data_hyp$`MAPPED_GENE`))
original_gwas_assoc_Mean_corp <- length(unique(data_mean$`MAPPED_GENE`))
original_gwas_assoc_Platelet <- length(unique(data_platelet$`MAPPED_GENE`))
original_gwas_assoc_PR <- length(unique(data_pr$`MAPPED_GENE`))
original_gwas_assoc_QT_interval <- length(unique(data_qt$`MAPPED_GENE`))
original_gwas_assoc_Systolic <- length(unique(data_sys$`MAPPED_GENE`))
original_gwas_assoc_Total_chol <- length(unique(data_total_c$`MAPPED_GENE`))
original_gwas_assoc_Triglyceride <- length(unique(data_tri$`MAPPED_GENE`))
original_gwas_assoc_Diabetes <- length(unique(data_diabetes$`MAPPED_GENE`))
original_gwas_assoc_White_blood <- length(unique(data_white$`MAPPED_GENE`))
original_gwas_assoc_Waisthip50 <- length(unique(data_whip50$`MAPPED_GENE`)) ###
original_gwas_assoc_Waisthip51 <- length(unique(data_whip51$`MAPPED_GENE`)) ###
original_gwas_assoc_Waisthip52 <- length(unique(data_whip52$`MAPPED_GENE`)) ###
original_gwas_assoc_Height <- length(unique(data_height$`MAPPED_GENE`))
original_gwas_assoc_QRS_duration <- length(unique(data_qrs$`MAPPED_GENE`))

original_gwas <- c(original_gwas_assoc_Body_mass, original_gwas_assoc_C_reactive, original_gwas_assoc_Chronic, original_gwas_assoc_Coffee, original_gwas_assoc_Diabetes, original_gwas_assoc_Diastolic, original_gwas_assoc_End_renal, original_gwas_assoc_Fasting_glucose, original_gwas_assoc_Fasting_insulin, original_gwas_assoc_Glomerular, original_gwas_assoc_HDL, original_gwas_assoc_Height, original_gwas_assoc_Hemoglobin, original_gwas_assoc_Hypertension, original_gwas_assoc_LDL, original_gwas_assoc_Mean_corp, original_gwas_assoc_Platelet, original_gwas_assoc_PR, original_gwas_assoc_QRS_duration, original_gwas_assoc_QT_interval, original_gwas_assoc_Smoking, original_gwas_assoc_Systolic, original_gwas_assoc_Total_chol, original_gwas_assoc_Triglyceride, original_gwas_assoc_Waisthip50, original_gwas_assoc_Waisthip51, original_gwas_assoc_White_blood)


original_gwas <- c(original_gwas_assoc_Body_mass, original_gwas_assoc_C_reactive, original_gwas_assoc_Chronic, original_gwas_assoc_Coffee, original_gwas_assoc_Diabetes, original_gwas_assoc_Diastolic, original_gwas_assoc_End_renal, original_gwas_assoc_Fasting_glucose, original_gwas_assoc_Fasting_insulin, original_gwas_assoc_Glomerular, original_gwas_assoc_HDL, original_gwas_assoc_Height, original_gwas_assoc_Hemoglobin, original_gwas_assoc_Hypertension, original_gwas_assoc_LDL, original_gwas_assoc_Mean_corp, original_gwas_assoc_Platelet, original_gwas_assoc_PR, original_gwas_assoc_QRS_duration, original_gwas_assoc_QT_interval, original_gwas_assoc_Smoking, original_gwas_assoc_Systolic, original_gwas_assoc_Total_chol, original_gwas_assoc_Triglyceride, original_gwas_assoc_Waisthip50, original_gwas_assoc_Waisthip51, original_gwas_assoc_White_blood)
#original_gwas <- data.frame(x="Original GWAS", y=original_gwas_assoc)
S_multiXcan <- c(Body_mass_index, C_reactive, Chronic_kidney, Coffee, Diabetes, Diastolic_blood, End_renal, Fasting_glucose, Fasting_insulin, Glomerular, HDL_cholesterol, Height53, Hemoglobin, Hypertension, LDL_cholesterol, Mean_corp, Platelet, PR, QRS_duration, QT_interval, Smoking, Systolic_blood, Total_cholesterol, Triglyceride, Waisthip50, Waisthip51,  White_blood)
phenotype <- c("Body mass index", "C-reactive", "Chronic kidney", "Coffee", "Diabetes", "Diastolic blood", "End renal", "Fasting glucose", "Fasting insulin", "Glomerular", "HDL cholesterol", "Height", "Hemoglobin", "Hypertension", "LDL cholesterol", "Mean corpuscular hemoglobin", "Platelet", "PR", "QRS duration", "QT interval", "Smoking", "Systolic blood", "Total cholesterol", "Triglyceride", "Waist-hip Female", "Waist-hip Male", "White blood")
total <- data.frame(original_gwas, S_multiXcan, phenotype)
#S_multiXcan <- data.frame(x="S-MultiXcan", y = number_sig_genes)
#total <- rbind(original_gwas, S_multiXcan)
#total$total <- rep((original_gwas_assoc + number_sig_genes), nrow(total))
#total$both <- rep("Test", 2)
total$total <- total$original_gwas + total$S_multiXcan
print(total)
#phenotype <- c("Body mass index", "C-reactive", "Chronic kidney", "Coffee", "Diabetes", "Diastolic blood", "End renal", "Fasting glucose", "Fasting insulin", "Glomerular"$
#original_gwas <- c(original_gwas_assoc_Body_mass, original_gwas_assoc_C_reactive, original_gwas_assoc_Chronic, original_gwas_assoc_Coffee, original_gwas_assoc_Diabetes, o$
original_gwas_table <- data.frame(x="Original GWAS", y=original_gwas, pheno=phenotype)
#S_multiXcan <- c(Body_mass_index, C_reactive, Chronic_kidney, Coffee, Diabetes, Diastolic_blood, End_renal, Fasting_glucose, Fasting_insulin, Glomerular, HDL_cholesterol,$
S_multiXcan_table <- data.frame(x="S-MultiXcan", y=S_multiXcan, pheno=phenotype)
#phenotype <- c("Body mass index", "C-reactive", "Chronic kidney", "Coffee", "Diabetes", "Diastolic blood", "End renal", "Fasting glucose", "Fasting insulin", "Glomerular$
total_table <- rbind(original_gwas_table, S_multiXcan_table)
print(total_table)



# Stacked
#ggplot(total, aes(fill=phenotype, y=S_multiXcan, x=total)) + 
#  geom_bar(position="stack", stat="identity")+ labs(title="Wojcik S-MultiXcan vs. GWAS", 
#                                                    x=" ", y = "Number of Hits")
#total$total <- total$original_gwas + total$S_multiXcan
#print(total)
# Stacked
bp <- ggplot(total_table, aes(fill=x, y=y, x=pheno)) +
  geom_bar(position="stack", stat="identity") + labs(title="Wojcik S-MultiXcan vs. GWAS",
                                                    x=" ", y = "Number of Hits")
bp + coord_flip()
ggsave("GTEX_Wojcik_S-Multixcan_GWAS_2.pdf")     
(END)
