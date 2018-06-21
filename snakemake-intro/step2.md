The data folder in your working directory looks as follows:

    data
    ├── genome.fa
    ├── genome.fa.amb
    ├── genome.fa.ann
    ├── genome.fa.bwt
    ├── genome.fa.fai
    ├── genome.fa.pac
    ├── genome.fa.sa
    └── samples
        ├── A.fastq
        ├── B.fastq
        └── C.fastq

You will create a workflow that maps the sequencing samples in the `data/samples` folder
to the reference genome `data/genome.fa`.
Then, you will call genomic variants over the mapped samples, and create an example
plot.

First, create a rule called `bwa`, with input files

* `data/genome.fa`
* `data/samples/A.fastq`

and output file

* `mapped/A.bam`

To generate output from input, use the shell command

    "bwa mem {input} | samtools view -Sb - > {output}"

Providing a shell command is not enough to run your workflow on an unprepared system.
For reproducibility, you also have to provide the required software stack and define the desired version.
This can be done with the [Conda package manager](https://conda.io), which is directly integrated with Snakemake:
add a directive `conda: "envs/mapping.yaml"` that points to a [Conda environment definition](https://conda.io/docs/user-guide/tasks/manage-environments.html?highlight=environment#creating-an-environment-file-manually), with the following content

    channels:
      - bioconda
      - conda-forge
    dependencies:
      - bwa =0.7.17
      - samtools =1.7

Upon execution, Snakemake will automatically create that environment, and execute the shell command within.

Now, test your workflow by simulating the creation of the file `mapped/A.bam` via

    snakemake --use-conda -n mapped/A.bam

to perform a dry-run and

    snakemake --use-conda mapped/A.bam

to perform the actual execution.
