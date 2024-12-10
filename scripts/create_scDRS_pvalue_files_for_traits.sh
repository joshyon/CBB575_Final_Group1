#!/bin/bash

script_dir="/home/cbb575_jy752/Final_project/MAGMA/output"

${script_dir}/create_scDRS_pvalue_file.sh \
-i "/home/cbb575_jy752/Final_project/MAGMA/output/munged_MVP_R4_PD_GWASsumstats/munged_MVP_R4_PD_GWASsumstats_MAGMA.genes.out" \
-o "/home/cbb575_jy752/Final_project/MAGMA/output/munged_MVP_R4_PD_GWASsumstats/munged_MVP_R4_PD_GWASsumstats_MAGMA_genes_scDRS.pval_file" \
-h "MVP_ParkinsonDisease" \
-s 1 

${script_dir}/create_scDRS_pvalue_file.sh \
-i "/home/cbb575_jy752/Final_project/MAGMA/output/UKB_460K.pigment_HAIR_with_pval_sumstats/UKB_460K.pigment_HAIR_with_pval_sumstats_MAGMA.genes.out" \
-o "/home/cbb575_jy752/Final_project/MAGMA/output/UKB_460K.pigment_HAIR_with_pval_sumstats/UKB_460K.pigment_HAIR_with_pval_sumstats_MAGMA_genes_scDRS.pval_file" \
-h "Hair_Pigment" \
-s 1 

