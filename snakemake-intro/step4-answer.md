The rule should look like this:

    rule sort:
        input:
            "mapped/{sample}.bam"
        output:
            "mapped/{sample}.sorted.bam"
        conda:
            "envs/mapping.yaml"
        shell:
            "samtools sort -o {output} {input}"
