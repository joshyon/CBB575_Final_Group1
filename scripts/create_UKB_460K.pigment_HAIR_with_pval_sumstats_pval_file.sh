#!/bin/bash
#SBATCH --mem=40g
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --partition=day
#This script will convert UKB_460K.pigment_HAIR_with_pval.sumstats (LDSC format + P-value column), from scDRS paper into .pval file to run MAGMA.
#The .pval file should at least has the columns SNP, P, N, which corresponds to the SNP id, p-value, sample size.
#From the tab-delimited file, take the columns:SNP, P, Z, and N 
# Script to extract SNP, CHR, BP, P, and create N () for MAGMA
# Default verbose option
verbose=1
# Function for echoing only if verbose is set
function v_echo() {
  if [ "$verbose" -eq 1 ]; then
    echo "$@"
  fi
} 
# Check if input file exists
input_file="/home/cbb575_jy752/Final_project/MungeSumstats/control_traits/UKB_460K.pigment_HAIR_with_pval.sumstats"
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi
# Set output file
output_file="/home/cbb575_jy752/Final_project/MungeSumstats/control_traits/MAGMA_pval_files/UKB_460K.pigment_HAIR_with_pval_sumstats.pval"

v_echo "Processing file: $input_file"
v_echo "Creating output file: $output_file"

#SNP is column number 1
#Z is column number 6
#P is column number 7
#N is column number 4

# Use cat to read the file and awk to process it
cat "$input_file" | \
awk -v OFS='\t' '
BEGIN { print "SNP", "Z", "P", "N" }
NR > 1 {
  print $1, $6, $7, $4
}' > "$output_file"
v_echo "Successfully created $output_file"
