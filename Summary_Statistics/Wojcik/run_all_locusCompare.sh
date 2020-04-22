#!/bin/bash
pheno=('Chronic_kidney' 'Hemoglobin' 'Height53' 'PR' 'Diabetes' 'Mean_corpuscular_hemoglobin' 'Platelet' 'Total_cholesterol' 'HDL_cholesterol' 'LDL_cholesterol' 'Triglyceride' 'QT_interval' 'QRS_duration' 'C-reactive' 'White_blood')
pop=('AFA' 'AFHI' 'HIS' 'CAU' 'ALL')
#!/bin/bash
pheno=('Chronic_kidney' 'Hemoglobin' 'Height53' 'PR' 'Diabetes' 'Mean_corpuscular_hemoglobin' 'Platelet' 'Total_cholesterol' 'HDL_cholesterol' 'LDL_cholesterol' 'Triglyceride' 'QT_interval' 'QRS_duration' 'C-reactive' 'White_blood')
pop=('AFA' 'AFHI' 'HIS' 'CAU' 'ALL')
for i in "${pheno[@]}"; do
        echo "$i"
        for population in "${pop[@]}"; do
        echo "$population"
                bash run_Locus.sh ${population} ${i}
        done
done
