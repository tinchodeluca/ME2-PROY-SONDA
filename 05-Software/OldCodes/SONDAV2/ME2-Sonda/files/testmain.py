'''
Created on 17 jul. 2024

@author: mdelu
'''

from files.file_opener import open_file, list_snp_files
from files.checksum_validator import check_file_checksum
from files.SNP_parser import parse_snp_file, print_file_info  # Assuming you've put your parsing logic in a separate file

def process_snp_file(directory, filename):
    content = open_file(directory, filename)
    if content:
        if check_file_checksum(content):
            metadata, data_array, data_format, num_ports = parse_snp_file(content)
            print_file_info(metadata, data_array, data_format, num_ports)
        else:
            print("Skipping file due to invalid checksum.")

if __name__ == "__main__":
    directory = "rsc/"
    
    snp_files = list_snp_files(directory)
    for filename in snp_files:
        print(f"\nProcessing file: {filename}")
        process_snp_file(directory, filename)