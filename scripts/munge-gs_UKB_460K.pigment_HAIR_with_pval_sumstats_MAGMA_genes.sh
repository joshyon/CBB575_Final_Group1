#!/bin/bash
#SBATCH --mem=20g
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
# Select top 1,000 genes and use p-value weights for UKB_460K.pigment_HAIR_with_pval_sumstats_MAGMA_genes
module purge
module load miniconda
conda activate scDRS
gene_set_path="/home/cbb575_jy752/Final_project/MAGMA/output"
trait="UKB_460K.pigment_HAIR_with_pval_sumstats"
gene_set_file_prefix="UKB_460K.pigment_HAIR_with_pval_sumstats_MAGMA_genes_scDRS"
out_dir="/home/cbb575_jy752/Final_project/scDRS/munge-genesets"
scdrs munge-gs \
    --out-file ${out_dir}/${gene_set_file_prefix}.gs \
    --pval_file ${gene_set_path}/${trait}/${gene_set_file_prefix}.pval_file \
    --weight zscore \
    --n-max 1000
