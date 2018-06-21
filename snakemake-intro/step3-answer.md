The rule should look like this:

    rule bwa:
        input:
            "data/genome.fa",
            "data/samples/{sample}.fastq"
        output:
            "mapped/{sample}.bam"
        conda:
            "envs/mapping.yaml"
        shell:
            "bwa mem {input} | samtools view -Sb - > {output}"
