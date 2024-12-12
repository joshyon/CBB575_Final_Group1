# CBB575_Final_Group1

The data is too large to be uploaded into github, but can be viewed on McCleary at the directory: "/home/cbb575_jy752/Final_project"

## Installation

### Installing MungeSumstats

salloc
module load R/4.4.1-foss-2022b
R
\# in R
if (!require("BiocManager")) install.packages("BiocManager")
install("rjson")
BiocManager::install("MungeSumstats")
library(MungeSumstats)
#This block if using hg38
BiocManager::install("SNPlocs.Hsapiens.dbSNP155.GRCh38")
BiocManager::install("BSgenome.Hsapiens.NCBI.GRCh38")
#This block if using hg19
BiocManager::install("SNPlocs.Hsapiens.dbSNP155.GRCh37")
BiocManager::install("BSgenome.Hsapiens.1000genomes.hs37d5")

###Installing MAGMA (From https://cncr.nl/research/magma/)
wget https://vu.data.surfsara.nl/index.php/s/zkKbNeNOZAhFXZB/download -O magma.zip
unzip magma.zip


### Installing scDRS 
module load miniconda
git clone https://github.com/martinjzhang/scDRS.git
cd scDRS
conda create -n scDRS
conda activate scDRS
pip install -e .
#The default installation of scdrs contains an incompatible version of numpy, so need to redownload an appropriate version.
pip uninstall numpy
pip install numpy==1.26.4

