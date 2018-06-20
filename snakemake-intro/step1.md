First, create an empty workflow in the current directory with:

    touch Snakefile

Once a Snakefile is present, you can perform a dry run of Snakemake with:

    snakemake -n

Since the Snakefile is empty, it will report that nothing has to be done.
In the next steps, we will gradually fill the Snakefile with an example analysis workflow.
