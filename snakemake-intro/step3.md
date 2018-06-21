Now, generalize the rule `bwa` by replacing the concrete sample name `A` with a wildcard `{sample}` in input and output file the rule `bwa`.
This way, Snakemake can apply the rule to map any of the three available samples to the reference genome.

Test this by creating the file `mapped/B.bam`.
