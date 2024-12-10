#!/bin/bash
#SBATCH --mem=100g
#SBATCH --cpus-per-task=12
#SBATCH --time=1:00:00

module purge
module load miniconda
conda activate scDRS

#Perform downstream group-analysis based on cell group-level annotation for single cell midbrain (control only) with munged_MVP_R4_PD_GWASsumstats_MAGMA_genes covar-adjusted scores

h5ad_file="/home/cbb575_jy752/Final_project/Single-Cell_Datasets/controlonly_midbrain_scobject.h5ad"
score_file="/home/cbb575_jy752/Final_project/scDRS/compute-score/control_only/MVP_ParkinsonDisease.full_score.gz"
out_dir="/home/cbb575_jy752/Final_project/scDRS/compute-score/control_only/perform_downstream_group_analysis"
group_analysis_columns="cell_ontology"

scdrs perform-downstream \
    --h5ad-file ${h5ad_file} \
    --score-file ${score_file} \
    --out-folder ${out_dir} \
    --group-analysis ${group_analysis_columns} \
    --flag-filter-data True \
    --flag-raw-count True
