#!/usr/bin/env /usr/bin/python2
A=[]
B=[]

for line in open('tempProteomes/Bradyrhizobium_diazoefficiens_USDA_110_accession.txt'):
    A.append(line.strip())

for line in open('tempProteomes/Bradyrhizobium_diazoefficiens_USDA_110_geneName.txt'):
    B.append(line.strip())

dic={}
for i in range(len(A)):
    dic[A[i]]=B[i]

def replace_all(text, dic):
    for i, j in dic.iteritems():
        text = text.replace(i, j)
    return text



inFile=open('tempProteomes/Bradyrhizobium_diazoefficiens_USDA_110.fasta')
text=inFile.read()
inFile.close()
out= replace_all(text, dic)
outFile=open('Proteomes/Bradyrhizobium_diazoefficiens_USDA_110.fasta', 'w')
outFile.write(out)
outFile.close()



    


