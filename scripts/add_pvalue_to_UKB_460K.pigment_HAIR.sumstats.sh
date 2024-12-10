#!/bin/bash
#Within "scDRS" conda environment

module purge
module load miniconda
conda activate scDRS

python add_pvalue_to_sumstatsfile.py -i UKB_460K.pigment_HAIR.sumstats
