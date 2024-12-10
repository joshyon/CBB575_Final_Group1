#Python script to convert .sumstats format GWAS summary statistics file to include a P-value column

import argparse
import scipy.stats
import numpy as np
import pandas as pd

# Function to calculate p-values from z-scores
def calculate_pvalues(sumstats_file):
    # Read the .sumstats file into a pandas dataframe
    df = pd.read_csv(sumstats_file, delim_whitespace=True)
    
    # Check if the 'Z' column exists
    if 'Z' not in df.columns:
        raise ValueError("The sumstats file must contain a 'Z' column with z-scores.")
    
    # Calculate p-values from z-scores
    df['P'] = 2 * (1 - scipy.stats.norm.cdf(np.abs(df['Z'])))
    
    # Save the updated dataframe
    output_file = sumstats_file.replace(".sumstats", "_with_pval.sumstats")
    df.to_csv(output_file, sep="\t", index=False)
    
    print(f"P-values added and saved to {output_file}")

# Main function to handle argument parsing
def main():
    parser = argparse.ArgumentParser(description="Convert z-scores in a .sumstats file to p-values.")
    parser.add_argument("-i", "--input", required=True, help="Input .sumstats file")
    args = parser.parse_args()
    
    calculate_pvalues(args.input)

if __name__ == "__main__":
    main()

