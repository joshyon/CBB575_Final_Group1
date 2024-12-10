#!/bin/bash
#SBATCH --time=2:00:00
#SBATCH --mem=32G
#SBATCH --cpus-per-task=4
magma_dir="/home/cbb575_jy752/Final_project/MAGMA"
bfile="/home/cbb575_jy752/Final_project/MAGMA/LD_reference_panel/g1000_eur"
gene_annot_file="/home/cbb575_jy752/Final_project/MAGMA/gene_annotation_files/g1000_eur_hg19.genes.annot"
pval_file_dir="/home/cbb575_jy752/Final_project/MungeSumstats/control_traits/MAGMA_pval_files"
trait="UKB_460K.pigment_HAIR_with_pval_sumstats"
output_dir="/home/cbb575_jy752/Final_project/MAGMA/output"

#Run MAGMA using the mean SNP statistic model using hg19 gene annotation file for MAGMA using the following data
#Reference Panel:1000G Phase 3 EUR hg19 Phase 3 2015 release
#GWAS summary statistics:UKB_460K.pigment_HAIR from scDRS
mkdir -p "${output_dir}/${trait}"
${magma_dir}/magma \
    --bfile ${bfile} \
    --pval ${pval_file_dir}/${trait}.pval use='SNP,P' ncol='N' \
    --gene-annot ${gene_annot_file} \
    --out ${output_dir}/${trait}/${trait}_MAGMA
