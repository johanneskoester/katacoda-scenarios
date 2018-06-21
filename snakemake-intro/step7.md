Finally, we strive to calculate some exemplary statistics.
This time, we don't use a shell command, but rather emply Snakemake's ability to integrate with scripting languages like R and Python.

First, we create a rule `stats` with input file

* `"calls/all.vcf"`

and output file

* `"plots/quals.svg"`.

Instead of a shell command, we write

    script:
        "scripts/plot-quals.py"

and create the corresponding script and its containing folder in our working directory with

    mkdir scripts
    touch scripts/plot-quals.py


We open the script in the editor and add the following content

    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    from pysam import VariantFile

    quals = [record.qual for record in VariantFile(snakemake.input[0])]
    plt.hist(quals)

    plt.savefig(snakemake.output[0])


As you can see, instead of writing a command line parser for passing parameters like input and output files, you have direct access to the properties of the rule via a magic `snakemake` object, that Snakemake automatically inserts into the script before executing the rule.

Finally, we have to define a conda environment for the rule, say `envs/stats.yaml`, that provides the required Python packages to execute the script:

    channels:
      - bioconda
      - conda-forge
    dependencies:
      - pysam =0.14
      - matplotlib =2.2
      - python =3.6


Make sure to test your workflow with

    snakemake --use-conda plots/quals.svg
