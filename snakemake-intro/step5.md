Next, you have to index the `.bam` file.
For this, you create a rule `index` with input file

* `mapped/{sample}.sorted.bam`,

output file

* `mapped/{sample}.sorted.bam.bai`

shell command

    samtools index {input}

and the same conda directive as before.

Test your workflow analogously to the previous steps.
