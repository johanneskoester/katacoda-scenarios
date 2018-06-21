Next, create a rule `sort` that sorts the obtained `.bam` file by genomic coordinate.
The rule should have the input file

* `mapped/{sample}.bam`

and the output file

* `mapped/{sample}.sorted.bam`

and uses the shell command

    samtools sort -o {output} {input}

to perform the sorting. Moreover, use the same `conda:` directive as for the previous rule.

Test your workflow with

    snakemake --use-conda -n mapped/A.sorted.bam

and

    snakemake --use-conda mapped/A.sorted.bam
