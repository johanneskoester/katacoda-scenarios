So far, we have always specified a target file at the command line when invoking Snakemake.
When no target file is specified, Snakemake tries to execute the first rule in the `Snakefile`.
We can use this property to define default target files.

At the top of your `Snakefile` define a rule `all`, with input files

* `"calls/all.vcf"`
* `"plots/quals.svg"`

and neither a shell command nor output files. This rule simply serves as an indicator of what shall be collected as results.
