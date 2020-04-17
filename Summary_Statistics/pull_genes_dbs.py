import sqlite3
import pandas

pop = 'AFHI'
#look for a gene and its SNPs in db
conn = sqlite3.connect(pop + "_imputed_10_peer_3_pcs_v2.db")
#print(gene)
c = conn.cursor()

cursor = c.execute('select gene, genename from extra')
names = list(map(lambda x: x[0], cursor.description))
print(names)
gene_output = []
for row in cursor:
        print(row)
        gene_output.append(row)


gene_output_df = pandas.DataFrame(gene_output, columns = ['gene', 'gene_name'])
gene_output_df.to_csv(pop + "_genenames.txt", index = False)
