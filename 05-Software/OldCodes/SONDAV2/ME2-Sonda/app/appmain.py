'''
Created on 9 nov. 2023

@author: mdelu
'''
from files.vna_files import vna_proc_file
from app.parameters import S11_to_Y11, Get_Aire_C0_G0


import matplotlib.pyplot as plt
import numpy as np

# https://pysmith.readthedocs.io/en/latest/

if __name__ == '__main__':
    
    file_path = '../files/rsc/'
    file_name = ['AIRE_SP1.s1p',
                 'Alcohol_SP1.s1p',
                 'Agua_destilada_SP1.s1p',
                 'resina_SP1.s1p',
                 'Acetona_SP1.s1p',
                ]
    
    dictionary = vna_proc_file(file_path, file_name[4])
    print(dictionary)
    
    Y11 = S11_to_Y11(dictionary['Frec'], dictionary['Complex'])
    # C0, G0 = Get_Aire_C0_G0(dictionary['Frec'], Y11) //TODO: NO ANDA VER QUE ONDA
    
    # phase = np.angle( dictionary['Real'] + 1j*dictionary['Img'], deg=True)
    phase  = np.angle( dictionary['Complex'], deg=True)
    module = np.abs(dictionary['Complex'] )
    
    plt.figure(figsize=(10, 5))
    
    # First subplot for the phase
    plt.subplot(2, 1, 1)
    # plt.xscale("log")
    plt.plot(dictionary['Frec'], phase,  color='b')
    plt.title('Phase Plot')
    plt.xlabel('Frequency')
    plt.ylabel('Phase (degrees)')
    plt.grid(True)
    plt.ylim(-200, 200)
    
    # Second subplot for the absolute value (magnitude)
    plt.subplot(2, 1, 2)
    plt.xscale("log")
    plt.plot(dictionary['Frec'], module, color='r')
    plt.title('Magnitude Plot')
    plt.xlabel('Frequency')
    plt.ylabel('Magnitude')
    plt.grid(True)
    # plt.ylim( -2, 2 )
    # Adjust layout to prevent overlap
    plt.tight_layout()
    # Show the figure with both subplots
    plt.show()
    pass