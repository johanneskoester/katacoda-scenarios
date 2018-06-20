#!/bin/bash

# setup environment
docker run -i -t -v `pwd`:/workspace -w /workspace quay.io/snakemake/snakemake bash
# obtain data
git clone https://bitbucket.org/snakemake/snakemake-tutorial.git
rm README.md
rm environment.yaml
