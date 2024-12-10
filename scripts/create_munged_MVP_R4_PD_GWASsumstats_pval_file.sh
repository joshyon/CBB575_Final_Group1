#!/bin/bash
#SBATCH --mem=40g
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --partition=day

#This script will convert munged_MVP_R4_PD_GWASsumstats.tsv.gz, the output of MungeSumStats into .pval file to run MAGMA.
#The .pval file should at least has the columns SNP, P, N, which corresponds to the SNP id, p-value, sample size.

#From the gzipped, tab-delimited file, take the columns:SNP, CHR, BP, P, and N

# Script to extract SNP, CHR, BP, P, and for MAGMA

# Default verbose option
verbose=1

# Function for echoing only if verbose is set
function v_echo() {
  if [ "$verbose" -eq 1 ]; then
    echo "$@"
  fi
}

# Check if input file exists
input_file="munged_MVP_R4_PD_GWASsumstats.tsv.gz"
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Set output file
output_file="munged_MVP_R4_PD_GWASsumstats.pval"

v_echo "Processing file: $input_file"
v_echo "Creating output file: $output_file"


#SNP is in column 1
#CHR is in column 2
#BP is in column 3
#N is in column 8
#P is in column 15

# Use zcat to read the gzipped file and awk to process it
zcat "$input_file" | \
awk -v OFS='\t' '
BEGIN { print "SNP", "CHR", "BP", "P", "N" }
NR > 1 {
  print $1, $2, $3, $15, $8 
}' > "$output_file"

v_echo "Successfully created $output_file"
