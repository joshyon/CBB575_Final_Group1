# CBB575_Final_Group1

The data is too large to be uploaded into github, but can be viewed on McCleary at the directory: "/home/cbb575_jy752/Final_project"

## Installation

### Installing MungeSumstats

salloc <br>
module load R/4.4.1-foss-2022b <br>
R <br>
\# in R <br>
if (!require("BiocManager")) install.packages("BiocManager") <br>
install("rjson") <br>
BiocManager::install("MungeSumstats") <br>
library(MungeSumstats) <br>
#This block if using hg38
BiocManager::install("SNPlocs.Hsapiens.dbSNP155.GRCh38") <br>
BiocManager::install("BSgenome.Hsapiens.NCBI.GRCh38") <br>
#This block if using hg19 <br>
BiocManager::install("SNPlocs.Hsapiens.dbSNP155.GRCh37") <br>
BiocManager::install("BSgenome.Hsapiens.1000genomes.hs37d5") <br>

###Installing MAGMA (From https://cncr.nl/research/magma/) <br>
wget https://vu.data.surfsara.nl/index.php/s/zkKbNeNOZAhFXZB/download -O magma.zip <br>
unzip magma.zip <br>


### Installing scDRS  
module load miniconda <br>
git clone https://github.com/martinjzhang/scDRS.git <br>
cd scDRS <br>
conda create -n scDRS <br>
conda activate scDRS <br>
pip install -e . <br>
#The default installation of scdrs contains an incompatible version of numpy, so need to redownload an appropriate version. <br>
pip uninstall numpy <br>
pip install numpy==1.26.4 <br>

