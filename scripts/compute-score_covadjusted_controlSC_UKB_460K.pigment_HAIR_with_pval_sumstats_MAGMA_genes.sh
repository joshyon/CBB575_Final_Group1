#!/bin/bash
#SBATCH --mem=50g
#SBATCH --cpus-per-task=12
#SBATCH --time=1:00:00
module purge
module load miniconda
conda activate scDRS
#Compute scores for test single-cell midbrain dataset (control only) with UKB_460K.pigment_HAIR_with_pval_sumstats_MAGMA_genes with covariate adjustment
h5ad_file="/home/cbb575_jy752/Final_project/Single-Cell_Datasets/controlonly_midbrain_scobject.h5ad"
covar_file="/home/cbb575_jy752/Final_project/Single-Cell_Datasets/controlonly_midbrain_covar_file.txt"
gs_file="/home/cbb575_jy752/Final_project/scDRS/munge-genesets/UKB_460K.pigment_HAIR_with_pval_sumstats_MAGMA_genes_scDRS.gs"
out_dir="/home/cbb575_jy752/Final_project/scDRS/compute-score/control_only"
scdrs compute-score \
    --h5ad-file ${h5ad_file}\
    --h5ad-species human\
    --gs-file ${gs_file}\
    --gs-species human\
    --out-folder ${out_dir}\
    --cov_file ${covar_file}\
    --flag-filter-data True\
    --flag-raw-count True\
    --n-ctrl 1000\
    --flag-return-ctrl-raw-score False\
    --flag-return-ctrl-norm-score True

