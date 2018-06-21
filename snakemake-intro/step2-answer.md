The rule should look like this:

    rule bwa:
        input:
            "data/genome.fa",
            "data/samples/A.fastq"
        output:
            "mapped/A.bam"
        conda:
            "envs/mapping.yaml"
        shell:
            "bwa mem {input} | samtools view -Sb - > {output}"
