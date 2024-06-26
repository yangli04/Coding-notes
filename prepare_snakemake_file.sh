#!/bin/bash
# Change file name first by using sed
for i in *.fastq.gz; do mv $i $(sed "s/S[0-9][0-9]/S1/" <(echo $i)); done

# The additional commands are used to convert the file names to the snakefile required JSON like format. 

for i in *R1*.fastq.gz; do echo $(sed "s/_S1_R1_001.fastq.gz//" <(echo $i)) >> ./tmp; done
jq -Rc . ./tmp | jq -sc . 
rm ./tmp

# output example: 

# ["L01","L02","L03","L04","L05","L06","LT1","LT2","LT3","LT4","LT5","LT6","L01","L02","L03","L04","L05","L06","LT1","LT2","LT3","LT4","LT5","LT6"]

