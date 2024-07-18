'''
Created on 17 jul. 2024

@author: mdelu
'''
import os

def open_file(directory, filename):
    """Open a file given its directory and filename."""
    file_path = os.path.join(directory, filename)
    try:
        with open(file_path, 'r') as file:
            content = file.read()
        print(f"Successfully opened file: {filename}")
        return content
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found in directory '{directory}'")
    except IOError as e:
        print(f"Error reading file '{filename}': {e}")
    return None

def list_snp_files(directory):
    """List all .s1p, .s2p, .s3p, .s4p and .csv files in the given directory."""
    snp_files = [f for f in os.listdir(directory) if f.lower().endswith(('.s1p', '.s2p', '.s3p', '.s4p', '.csv'))]
    return snp_files

# Example usage
if __name__ == "__main__":
    directory = "rsc/"
    
    # List all SNP files in the directory
    snp_files = list_snp_files(directory)
    print("SNP files in the directory:")
    for file in snp_files:
        print(file)
    
    # Open a specific file
    if snp_files:
        filename = snp_files[0]  # Open the first SNP file found
        content = open_file(directory, filename)
        if content:
            print("File content preview:")
            print(content[:200] + "...")  # Print first 200 characters