#!/bin/bash

docker run -i -t -v `pwd`:/workspace -w /workspace quay.io/snakemake/snakemake bash
