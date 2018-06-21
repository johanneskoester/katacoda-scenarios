The rule should look like this:

    rule stats:
        input:
            "calls/all.vcf"
        output:
            "plots/quals.svg"
        conda:
            "envs/stats.yaml"
        script:
            "scripts/plot-quals.py"
