Now, we aggregate over all samples to perform a joint calling of genomic variants.
First, we define a variable

    samples = ["A", "B", "C"]

at the top of the `Snakefile`.
This serves as a definition of the samples over which we would want to aggregate.
In real life, you would want to use an external sample sheet or a [config file](http://snakemake.readthedocs.io/en/stable/tutorial/advanced.html#step-2-config-files) for things like this.

For aggregation over many files, Snakemake provides the helper function `expand` (see [the docs](http://snakemake.readthedocs.io/en/stable/tutorial/basics.html#step-5-calling-genomic-variants)).
Create a rule `call` with input files

* `fa="data/genome.fa"`
* `bam=expand("mapped/{sample}.sorted.bam", sample=samples)`
* `bai=expand("mapped/{sample}.sorted.bam.bai", sample=samples)`,

output file

* `"calls/all.vcf"`

and shell command

    samtools mpileup -g -f {input.fa} {input.bam} | bcftools call -mv - > {output}

Further, define a new conda environment file with the following content:

    channels:
      - bioconda
      - conda-forge
    dependencies:
      - bcftools =1.7
      - samtools =1.7
