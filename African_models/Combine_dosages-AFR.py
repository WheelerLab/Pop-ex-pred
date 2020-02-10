from __future__ import division
import gzip
import re
import sys
from collections import defaultdict
#"%&%" = function(a,b) paste(a,b,sep="")
#c= "22"
c=sys.argv[1]
LWK_dosage = "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/New_Dosages/LWK/LWK_"+c+".dosage.txt"
MKK_dosage = "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/New_Dosages/MKK/MKK_"+c+".dosage.txt"
YRI_dosage = "/home/hwheeler1/from_wheelerlab3_2019-08-29/jennifer/New_Dosages/YRI/YRI_"+c+".dosage.txt"
#outfile=gzip.open("/home/lauren/mesa_dosages/imp2_ALL_chr"+c+"_ref1kg_dosage.txt.gz","wb")
refdict = defaultdict(set)
for i in open(LWK_dosage):
    afad = i.strip().split() #split by white space
    (chra, rsida, posa, a1a, a2a,mafa) = afad[0:6] #assign first 5 indices
    adose = afad[6:]
    adose = str(afad[6:])
    adose = adose.replace("[", "")
    adose = adose.replace("]", "")
    refdict[rsida].add(adose)

#o = [] 
ofile=open("/home/egeoffroy/AFR_Dosages/AFR_"+c+"_dosage.txt","wb")
for j in open(MKK_dosage):
    caud = j.strip().split() #split by white space
    (chrc, rsidc, posc, a1c, a2c,mafc) = caud[0:6] #assign first 5 indices
    cdose =caud[6:]
    cdose =str(caud[6:])
    cdose = cdose.replace("[", "")
    cdose = cdose.replace("]", "")
    cdose = cdose.replace("'", "")
    cdose = cdose.replace(",", " ")
    if caud[1] in refdict:
        ad = refdict[caud[1]]
        ad=map(str, ad)
        ad=str(ad)
        ad=ad.replace("[", "")
        ad=ad.replace("]", "")
        ad=ad.replace('"', "")
        ad=ad.replace("'", "")
        ad=ad.replace(",", " ")
for g in open(MKK_dosage):
    caud = g.strip().split() #split by white space
    (chrc, rsidc, posc, a1c, a2c,mafc) = caud[0:6] #assign first 5 indices

out= chrc+ ' '+rsidc+ ' '+posc+ ' '+a1c+ ' '+a2c+ ' '+mafc+' '+ad+ ' '+cdose+ '\n'
    ofile.write(out)
    
ofile.close()
