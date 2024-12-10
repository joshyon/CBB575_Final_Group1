#!/bin/bash
#SBATCH --mem=20g
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
# Select top 1,000 genes and use p-value weights for munged_MVP_R4_PD_GWASsumstats_MAGMA_genes
module purge
module load miniconda
conda activate scDRS
gene_set_path="/home/cbb575_jy752/Final_project/MAGMA/output"
trait="munged_MVP_R4_PD_GWASsumstats"
gene_set_file_prefix="munged_MVP_R4_PD_GWASsumstats_MAGMA_genes_scDRS"
out_dir="/home/cbb575_jy752/Final_project/scDRS/munge-genesets"
scdrs munge-gs \
    --out-file ${out_dir}/${gene_set_file_prefix}.gs \
    --pval_file ${gene_set_path}/${trait}/${gene_set_file_prefix}.pval_file \
    --weight zscore \
    --n-max 1000
