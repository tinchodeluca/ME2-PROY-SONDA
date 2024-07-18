'''
Created on 17 jul. 2024

@author: mdelu
'''
import re
import numpy as np
from datetime import datetime

comment_line = '!'
EOL          = '\n'
header_line  = '#'

def parse_snp_file(file_content):
    metadata = {} # Dictionary to store metadata
    data     = []     # List to store measurement data

    # Split the content into lines
    lines = file_content.split(EOL)

    
    for line in lines: # Process header information
        if line.startswith(comment_line):
            key_value = line[1:].split(':', 1)
            if len(key_value) == 2:
                key, value = key_value
                metadata[key.strip()] = value.strip()
        elif line.startswith(header_line):
            # This line indicates the column headers
            headers = line[1:].split()
            break

    # Determine data format and number of ports
    if 'DB' in headers:
        data_format = 'DB'
    elif 'RI' in headers:
        data_format = 'RI'
    else:
        data_format = 'Unknown'
    
    num_ports = int(re.search(r'S(\d+)P', metadata.get('S2P File', 'S1P')).group(1))

    # Process measurement data
    for line in lines:
        if not line.startswith(comment_line) and not line.startswith(EOL):
            values = line.split()
            if len(values) == 1 + 2 * num_ports * num_ports:
                data.append([float(v) for v in values])

    # Convert measurement data to NumPy array for efficient processing
    data_array = np.array(data)

    return metadata, data_array, data_format, num_ports

def print_file_info(metadata, data_array, data_format, num_ports):
    print("Instrument:", metadata.get('Keysight Technologies', 'Unknown').split(',')[1].strip())
    print("Serial Number:", metadata.get('Keysight Technologies', 'Unknown').split(',')[2].strip())
    print("Measurement Date:", metadata.get('Date', 'Unknown'))
    print("Correction:", metadata.get('Correction', 'Unknown'))
    print("Data Format:", data_format)
    print("Number of Ports:", num_ports)
    print("Z0:", re.search(r'R (\d+)', metadata.get('S2P File', '')).group(1) if 'S2P File' in metadata else 'Unknown')

    print("\nFirst few measurements:")
    print(data_array[:5])

    print("\nShape of data array:", data_array.shape)

# # Example usage
# file_content = """Your SNP file content here"""
# metadata, data_array, data_format, num_ports = parse_snp_file(file_content)
# print_file_info(metadata, data_array, data_format, num_ports)
#
# # You can now easily perform operations on the data array, e.g.:
# print("\nAverage frequency:", np.mean(data_array[:, 0]))
#
# # Example of accessing specific S-parameters
# if num_ports == 2:
#     print("\nS11 data:")
#     print(data_array[:, [1, 2]])  # Real and Imaginary parts of S11
#     print("\nS21 data:")
#     print(data_array[:, [3, 4]])  # Real and Imaginary parts of S21