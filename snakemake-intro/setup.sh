curl -L -o /tmp/miniconda.sh  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash miniconda.sh -b -p /tmp/miniconda
export PATH=/tmp/miniconda/bin:$PATH

conda config --system --add channels conda-forge
conda config --system --add channels bioconda

conda install snakemake
