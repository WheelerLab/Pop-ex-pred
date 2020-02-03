import gzip
import csv
#import numpy as np
#import matplotlib.pyplot as plt
import pandas as pd
dataset = []

with gzip.open('/home/egeoffroy/Summary_Statistics/Summary_Stats/Wojcik/Chronic_kidney/WojcikGL_31217584_GCST008026/WojcikG_PMID_ckd_analysis.gz', 'rt') as f:
    file_content = pd.read_csv(f, header=0, delimiter="\t")
    print(file_content.head())

print(file_content[['rsid', 'Position_hg19', 'Beta', 'SE']])
file_content['Z-score'] = file_content['Beta']/file_content['SE']
file_content = file_content[['rsid', 'Position_hg19', 'Z-score', 'Chr', 'Other-allele', 'Effect-allele']]
print(file_content)
outfile = open("/home/egeoffroy/Summary_Statistics/Summary_Stats/LD_blocking_Wojcik_Chronic_kidney.txt", 'w')
i = 1
table = []
with open('/home/egeoffroy/fourier_ls-all.bed', 'r') as f:
    reader = csv.reader(f, dialect='excel', delimiter='\t')

for row in reader:
  row.append("Loc" + str(i))
  i+=1

for j in range(len(file_content)):
        for k in range(len(row)):
                if(int(file_content['Position_hg19'][j]) > int(row[1]) and int(file_content['Position_hg19'][j]) < int(row[2])):
                        joined =  ['chr' + str(file_content['Chr'][j]) + "_" +  str(int(file_content['Position_hg19'][j])) + "_" + str(file_content['Effect-allele'][j]) + '_' + str(file_content['Other-allele'][j]) + '_b19', str(row[3]), str(file_content['Z-score'][j])]
                        #print(joined)
                        outfile.write(joined)

outfile.close()
