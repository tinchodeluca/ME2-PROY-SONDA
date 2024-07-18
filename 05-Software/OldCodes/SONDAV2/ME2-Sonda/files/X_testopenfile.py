'''
Created on 9 nov. 2023

@author: mdelu
'''
import unittest
import numpy as np

class Test(unittest.TestCase):

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def testOpenSP1(self):
        file_path    = './'
        file_folder  = 'rsc/'
        file_names   = ['AIRE_SP1.s1p',
                       ]
        file_path   += file_folder + file_names[0]
        header_start = '#'
        data_start   = '!'
        out_dict     = {'Data' : [],
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
            values = line.strip().split('\t')
            
            frecuencies = np.append(frecuencies, int(values[0]))
            reals       = np.append(reals , float(values[2]))
            imgs        = np.append(imgs, float(values[1]))
            
        out_dict['Data']  = file_list[0:11]
        out_dict['Index'] = file_list[11][1:].split(' ')
        out_dict['Frec']  = frecuencies
        out_dict['Img']   = imgs
        out_dict['Real']  = reals
        
        print(out_dict)
        
if __name__ == "__main__":
    unittest.main()