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

def parse_file(file_content):
    if file_content.startswith('! FILETYPE CSV'):
        return parse_csv_file(file_content)
    else:
        return parse_snp_file(file_content)
    
def parse_snp_file(file_content):
    metadata = {}  # Dictionary to store metadata
    data     = []  # List to store measurement data
    lines    = file_content.split(EOL)
    
    for line in lines:  # Process header information
        if line.startswith(comment_line):
            
            parts = line[1:].split(comment_line, 1)
            key_value = parts[0].split(':', 1)
            if len(key_value) == 2:
                key, value = key_value
                metadata[key.strip()] = value.strip()
            
            if len(parts) > 1:
                additional_key_value = parts[1].split(':', 1)
                if len(additional_key_value) == 2:
                    add_key, add_value = additional_key_value
                    metadata[add_key.strip()] = add_value.strip()
        
        elif line.startswith(header_line):
            headers = line[1:].split()
            break
    
    metadata['Z0'] = headers[-1]
    
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

    data_array = np.array(data)
    return metadata, data_array, data_format, num_ports

def parse_csv_file(file_content):
    metadata = {}
    data     = []
    headers  = []
    data_started = False
    
    for line in file_content.split('\n'):
        line = line.strip()
        if line.startswith('! '):
            # Remove the '! ' prefix
            line = line[2:]
            
            # Special cases
            if line.startswith(('FREQ UNIT', 'XDATA UNIT', 'YDATA UNIT')):
                key, value = line.split(' ', 2)[:2], line.split(' ', 2)[2]
                metadata[' '.join(key)] = value
            elif line.startswith('CORR TIMESTAMP1'):
                key, value = line.split(' ', 2)[0:2], line.split(' ', 2)[2]
                metadata[' '.join(key)] = value
            else:
                # General case: first word is the key, rest is the value
                parts = line.split(' ', 1)
                if len(parts) == 2:
                    key, value = parts
                else:
                    key, value = parts[0], ''
                metadata[clean_string(key)] = value.strip()
        
        elif line == 'BEGIN':
            data_started = True
        elif line == 'END':
            data_started = False
        elif not data_started and line.startswith('! DATA'):
            headers = line[7:].split(',')
        elif data_started:
            try:
                data.append([float(v) for v in line.split(',')])
            except ValueError:
                # If we can't convert to float, skip this line
                print(f"Warning: Skipping non-numeric data line: {line}")

    # Convert data to numpy array for consistency with SNP parser
    data_array = np.array(data)

    # Determine data format (always 'CSV' in this case)
    data_format = 'CSV'

    # Determine number of ports (always 1 in this example, but could be expanded)
    num_ports = 1

    return metadata, data_array, num_ports, headers

def clean_string(s):
        return s.rstrip(',').strip()
    
def normalize_metadata(metadata, file_type):
    normalized = {}
    
    # Define common mappings for both file types
    common_mappings = {
        'MODEL'         : 'model',
        'Model'         : 'model',
        'SERIAL'        : 'serial_number',
        'Serial'        : 'serial_number',
        
        'TIMESTAMP'     : 'timestamp',
        'Date'          : 'timestamp',
        
        'TIMEZONE'      : 'timezone',
        'TimeZone'      : 'timezone',
        
        'GPS_LATITUDE'  : 'gps_latitude',
        'GPS Latitude'  : 'gps_latitude',
        'GPS_LONGITUDE' : 'gps_longitude',
        'GPS Longitude' : 'gps_longitude',
        'GPS_TIMESTAMP' : 'gps_timestamp',
        'GPS TimeStamp' : 'gps_timestamp',
        'GPS_SECS_SINCE_LAST_READ'     : 'gps_seconds_since_last_read',
        'GPS Seconds Since Last Read'  : 'gps_seconds_since_last_read',
        
        'CHECKSUM'                     : 'checksum',
        'FIRMWARE_VERSION'             : 'firmware_version',
        'Keysight Technologies N9917A' : 'firmware_version'
    }
    
    # Normalize the metadata
    for old_key, new_key in common_mappings.items():
        if old_key in metadata:
            value = metadata[old_key]
            # Remove any trailing commas and strip whitespace
            if isinstance(value, str):
                value = value.rstrip(',').strip()
            normalized[new_key] = value
    
    # Add file type
    normalized['file_type'] = file_type
    
    return normalized

# Example usage
csv_metadata = {'FILETYPE': 'CSV', 'VERSION': '3.0,1', 'TIMESTAMP': 'Wednesday, 08 November 2023 22:26:30', 'TIMEZONE': '(UTC-03:00) Buenos Aires', 'NAME': 'Keysight Technologies', 'MODEL': 'N9917A', 'SERIAL': 'MY56072049', 'FIRMWARE_VERSION': 'A.12.46', 'VF,': '1.000', 'Media,': 'Coax', 'IF_BW,': '10000', 'Output_Power_Mode,': 'MAN', 'Output_Power_Level,': '-15', 'GPS_LATITUDE': '', 'GPS_LONGITUDE': '', 'GPS_TIMESTAMP': '0001-01-01 00:00:00Z', 'GPS_SECS_SINCE_LAST_READ': '0', 'CHECKSUM': '0376320862', 'TraceAverageCount,': '1', 'CORRECTION1': 'ON U', 'CORR TIMESTAMP1': '11/8/2023 8:24:57 PM', 'Smoothing,': 'Off', 'Mag_Offset,': '0 dB', 'Phase_Offset,': '0 Deg', 'Slope,': '0 dB/GHz', 'Electrical_Delay,': '0 s', 'DATA': 'Freq,S11', 'FREQ UNIT': 'Hz', 'XDATA UNIT': 'Real', 'YDATA UNIT': 'Imaginary'}

s1p_metadata = {'Keysight Technologies N9917A': 'A.12.46', 'Date': 'Wednesday, 08 November 2023 22:12:23', 'TimeZone': '(UTC-03:00) Buenos Aires', 'Model': 'N9917A', 'Serial': 'MY56072049', 'GPS Latitude': '', 'GPS Longitude': '', 'GPS TimeStamp': '0001-01-01 00:00:00Z', 'GPS Seconds Since Last Read': '0', 'CHECKSUM': '1499144359', 'Correction': 'S11(ON U)', 'S1P File': 'Measurement: S11:', 'Z0': '50'}

normalized_csv = normalize_metadata(csv_metadata, 'CSV')
normalized_s1p = normalize_metadata(s1p_metadata, 'S1P')

print("Normalized CSV metadata:")
for key, value in normalized_csv.items():
    print(f"{key}: {value}")

print("\nNormalized S1P metadata:")
for key, value in normalized_s1p.items():
    print(f"{key}: {value}")
    
def print_normalized_file_info(normalized_metadata):
    print("File Type:", normalized_metadata.get('file_type', 'Unknown'))
    print("Instrument Model:", normalized_metadata.get('model', 'Unknown'))
    print("Serial Number:", normalized_metadata.get('serial_number', 'Unknown'))
    print("Measurement Date:", normalized_metadata.get('timestamp', 'Unknown'))
    print("Firmware Version:", normalized_metadata.get('firmware_version', 'Unknown'))
    print("Timezone:", normalized_metadata.get('timezone', 'Unknown'))
    print("GPS Latitude:", normalized_metadata.get('gps_latitude', 'Unknown'))
    print("GPS Longitude:", normalized_metadata.get('gps_longitude', 'Unknown'))
    print("GPS Timestamp:", normalized_metadata.get('gps_timestamp', 'Unknown'))
    print("GPS Seconds Since Last Read:", normalized_metadata.get('gps_seconds_since_last_read', 'Unknown'))
    print("Checksum:", normalized_metadata.get('checksum', 'Unknown'))
    
def print_file_info(metadata, data_array, data_format, num_ports):
    print("Instrument:", metadata.get('Keysight Technologies', 'Unknown'))
    print("Serial Number:", metadata.get('Keysight Technologies', 'Unknown'))
    print("Measurement Date:", metadata.get('Date', 'Unknown'))
    print("Correction:", metadata.get('Correction', 'Unknown'))
    print("Data Format:", data_format)
    print("Number of Ports:", num_ports)
    print("Z0:", metadata.get('Z0', 'Unknown'))

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