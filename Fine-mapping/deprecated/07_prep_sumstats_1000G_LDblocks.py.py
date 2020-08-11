#!/usr/bin/python3
'''
Using summary stats from GWAS catalog (must by hg19/b37 for MESA db's)
retrieve Z-scores for intersection SNPs with eQTL annotation file and
generate SNP Locus Z-score file for torus
(use LD locus blocks from an appropriate population)
'''
import sys
import argparse
import os
import gzip

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='GWAS summary stats to dap-g Z-score format')
    parser.add_argument('-l', '--ldblocks',
                        help='ld blocks locus file',
                        required='True'
                        )
    parser.add_argument('-s', '--sumstats',
                        help='input summary stats file',
                        required='True'
                        )
    parser.add_argument('-a', '--annot',
                        help='input fastenloc eQTL annot file',
                        required='True'
                        )
    parser.add_argument('-o', '--outprefix',
                        help='output prefix',
                        required='True'
                        )
    return parser.parse_args(args)

#retrieve command line arguments
args = check_arg(sys.argv[1:])
ldfile = args.ldblocks
sumstatsfile = args.sumstats
annotfile = args.annot
outprefix = args.outprefix

#make Z-score (beta/se) dictionary from sumstats
#you may need to choose diff columns depending on sumstat format
zdict = dict()
for line in gzip.open(sumstatsfile):
    arr = line.strip().split()
    #convert bytes to str for each item in list    arr = [x.decode("utf-8") for x in arr]
    (chr, bp, oallele, eallele) = arr[0:4]
    beta = arr[6]
    se = arr[7]
    if beta == "beta" or beta == "Beta": #skip header and extra rows
        continue
    elif chr == "NA" or chr == "X" or chr == "Y": #skip sex or unknown chr rows
        continue
    elif len(oallele) > 1 or len(eallele) > 1: #skip indels
        continue
    zscore = float(beta)/float(se)
    snpid = chr + "_" + bp + "_" + oallele + "_" + eallele + "_b37"
    zdict[snpid] = zscore

#store each LD block in a tuple list, i.e.
# [(Loc#, chr, start, stop), ...]
counter = 0
locuslist = list()
for line in open(ldfile):
    arr = line.strip().split()
    if arr[0] == "chr":
        continue #skip header
    counter += 1
    chr = arr[0][3:] #rm "chr"
    start = float(arr[1])
    stop = float(arr[2])
    locus = "Loc" + str(counter)
    locuslist.append((locus, chr, start, stop))

#generate Z-score file with LD block locus file for intersection SNPs
#(need to include total number of GWAS SNPs in step 09 with -total_variants flag)
countout = open(outprefix + ".GWAS.SNPcount.txt","w")
countout.write(str(len(zdict)) + "\n")
countout.close()
zout = gzip.open(outprefix + ".torus.zval.txt.gz","wb")
for line in gzip.open(annotfile):
    arr = line.strip().split()
    snp = arr[2].decode("utf-8")
    if snp in zdict:
        (chr, pos,ref,alt,build) = snp.split("_")
        pos = float(pos)
        for item in locuslist:
            (loc, c, start, stop) = item
            if chr == c and pos >= start and pos < stop:
                outstr = snp + "\t" + loc + "\t" +  str(zdict[snp]) + "\n"
                zout.write(outstr.encode("utf-8")) ##encode for gzip

zout.close()
