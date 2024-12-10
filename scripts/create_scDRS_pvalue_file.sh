#!/bin/bash

# Usage: ./create_scDRS_pvalue_file.sh -i input_file -o output_file [-h header] [-s skip_header] [-v verbose]
# Description: Extract gene names (1st column) and p-values (9th column) from MAGMA genes output with optional custom header and ability to skip input file header
# The header will be for the column describing where the gene pvalues were obtained (i.e. ${trait}_MAGMA_genes)

# Default verbose option (1 for echo on, 0 for minimal)
verbose=1
header=""
skip_header=0

# Function to print usage
usage() {
  echo "Usage: $0 -i input_file -o output_file [-h header] [-s skip_header] [-v verbose]"
  exit 1
}

# Function to get file prefix
get_file_prefix() {
  filename=$(basename -- "$1")
  echo "${filename%%.*}"
}

# Parse command-line arguments
while getopts "i:o:h:s:v:" opt; do
  case ${opt} in
    i) input_file=${OPTARG} ;;
    o) output_file=${OPTARG} ;;
    h) header=${OPTARG} ;;
    s) skip_header=${OPTARG} ;;  # Option to skip header
    v) verbose=${OPTARG} ;;
    *) usage ;;
  esac
done

# Check if required arguments are provided
if [[ -z "$input_file" || -z "$output_file" ]]; then
  usage
fi

# If header is not provided, use the prefix of the input file
if [[ -z "$header" ]]; then
  header=$(get_file_prefix "$input_file")
fi

# Verbose output
if [[ "$verbose" -eq 1 ]]; then
  echo "Extracting gene names (1st column) and p-values (9th column) from $input_file"
  echo "Using header: GENE and $header"
  if [[ "$skip_header" -eq 1 ]]; then
    echo "Skipping the first line of the input file"
  fi
fi

# Write header and extract the required columns, skipping the first line if necessary, and outputting as tab-delimited
{
  echo -e "GENE\t$header"
  if [[ "$skip_header" -eq 1 ]]; then
    awk 'NR>1 {print $1 "\t" $9}' "$input_file"
  else
    awk '{print $1 "\t" $9}' "$input_file"
  fi
} > "$output_file"

# Verbose output
if [[ "$verbose" -eq 1 ]]; then
  echo "Output saved to $output_file"
fi
