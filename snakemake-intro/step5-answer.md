The rule should look like this:

    samples = ["A", "B", "C"]

    rule call:
      input:
          fa="data/genome.fa",
          bam=expand("mapped/{sample}.sorted.bam", sample=samples)
      output:
          "calls/all.vcf"
      conda:
          "envs/calling.yaml"
      shell:
          "samtools mpileup -g -f {input.fa} {input.bam} | "
          "bcftools call -mv - > {output}"
