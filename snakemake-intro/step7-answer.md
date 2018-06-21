The rule should look like this:

    rule all:
        input:
            "calls/all.vcf",
            "plots/quals.svg"


It has to appear as first rule in the `Snakefile`.
