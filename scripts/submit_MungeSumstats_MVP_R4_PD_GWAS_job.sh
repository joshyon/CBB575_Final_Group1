#!/bin/bash
#SBATCH --cpus-per-task=4
#SBATCH --mem=80G
#SBATCH --time=4:00:00
#SBATCH --partition=day

module purge
module load R/4.4.1-foss-2022b
Rscript /home/cbb575_jy752/Final_project/MungeSumstats/MVP_PD/munged_sumstats/MungeSumstats_MVP_R4_PD_GWAS.R
