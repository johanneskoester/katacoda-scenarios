#!/bin/bash

# setup environment
docker run -i -t -v `pwd`:/workspace -w /workspace quay.io/snakemake/snakemake:v5.1.4 bash
# obtain data
git clone https://bitbucket.org/snakemake/snakemake-tutorial.git
cd snakemake-tutorial
rm README.md
rm environment.yaml
