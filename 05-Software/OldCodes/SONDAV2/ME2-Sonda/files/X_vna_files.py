'''
Created on 9 nov. 2023

@author: mdelu
'''
import numpy as np

def vna_proc_file(file_path, file_name):
    
    file_path += file_name
    
    header_start  = '#'
    data_start    = '!'
    out_dict = {'Data' : [],
                     'Index': [],
                     'Frec' : [],
                    }
    
    frecuencies = np.array([])
    reals       = np.array([])
    imgs        = np.array([])
    
    try: 
        file = open(file_path, "r")
    except: 
        print('TODO: No se puede abrir')
        return 404
    
    file_list = file.readlines()
    file.close()
    
    for line in file_list[12:]:
        values      = line.strip().split('\t')
        frecuencies = np.append(frecuencies, int(values[0]))
        reals       = np.append(reals, float(values[1]))
        imgs        = np.append(imgs, float(values[2]))
    
    out_dict['Data'   ] = file_list[0:11]
    out_dict['Index'  ] = file_list[11][1:].split(' ')
    out_dict['Frec'   ] = frecuencies
    out_dict['Img'    ] = imgs
    out_dict['Real'   ] = reals
    out_dict['Complex'] = reals +1j*imgs
    
    return out_dict