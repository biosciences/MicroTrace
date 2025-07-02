import pandas as pd
import argparse

def convert_snp_dists(input_path, output_path):
    # Read the tab-delimited SNP distance matrix
    df = pd.read_csv(input_path, sep='\t', index_col=0)

    # Ensure symmetrical matrix and correct format
    df = df.astype(int)
    df.insert(0, 'Sample', df.index)

    # Write to CSV
    df.to_csv(output_path, index=False)
    print(f"✅ Converted SNP distance matrix saved to: {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert snp-dists matrix to MicroTrace CSV format")
    parser.add_argument("-i", "--input", required=True, help="Input .tsv from snp-dists")
    parser.add_argument("-o", "--output", default="sim_snp_dist.csv", help="Output CSV for MicroTrace")
    args = parser.parse_args()

    convert_snp_dists(args.input, args.output)
