#!/bin/bash

echo setup environment...
docker run -i -t -v `pwd`:/workspace -w /workspace quay.io/snakemake/snakemake bash
conda install -y -c conda-forge xorg-libxrender xorg-libxpm
echo obtain data...
git clone https://bitbucket.org/snakemake/snakemake-tutorial.git
cd snakemake-tutorial
rm README.md
rm environment.yaml
