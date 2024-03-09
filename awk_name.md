
When I was trying to aggregate the samples into output.tsv, I used the following command:

(for i in $(ls ./); do cat $i | awk -v samplename="${i%.rRNA.depth}" 'BEGIN{{OFS="\t"}} {{ print samplename,$0 }}'; done ) > output.tsv

(for i in $(ls ./); do cat $i | awk -v filename="${i%.rRNA.depth}" 'BEGIN{OFS="\t"} {print $filename,$0}'; done) > output.tsv

However, the second commend always give me the wrong result. I want to append the samplename (i.e. the filename of tables without suffix). In fact, the samplename is already defined in the awk -v, so we do not need to use $samplename in awk. It will cause an error, which is like using "{print $0,$0}" at the awk.
