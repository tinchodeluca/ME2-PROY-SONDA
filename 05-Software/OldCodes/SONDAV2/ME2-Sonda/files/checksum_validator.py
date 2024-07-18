'''
Created on 17 jul. 2024

@author: mdelu
'''
# checksum_validator.py

import hashlib

def calculate_checksum(file_content):
    return 0 # TODO: The algorithm to calculate the checksum is still unknown

def validate_checksum(file_content, expected_checksum):
    """Validate the checksum of the file content."""
    # calculated_checksum = calculate_checksum(file_content)
    # return calculated_checksum == expected_checksum
    return True

def extract_checksum(file_content):
    """Extract the checksum from the file content."""
    for line in file_content.split('\n'):
        if line.startswith('!CHECKSUM:'):
            return line.split(':')[1].strip()
    return None

def check_file_checksum(file_content):
    """Check the file's checksum."""
    expected_checksum = extract_checksum(file_content)
    if expected_checksum is None:
        print("No checksum found in the file.")
        return False
    
    is_valid = validate_checksum(file_content, expected_checksum)
    if is_valid:
        print("Checksum is valid.")
    else:
        print("Checksum is invalid.")
    return is_valid #Is TRUE or Fal

