'''
Created on 10 nov. 2023

@author: mdelu
'''
import numpy as np
from scipy.optimize import fsolve, curve_fit

def S11_to_Y11(frec, S11):
    z0 = 50
    y0 = 1/z0
    
    Y11 = y0*(( 1 - S11 ) / ( 1 + S11 ))

    return { 'Frec'    : frec,
             'Complex' : Y11,
            }

def Y11_from_E(Frec, E, C0, G0):
    W = 2*np.pi*Frec
    return (1j*W*E*C0 + G0*E**(5/2))

def Y11_AIRE(Frec, C0,G0):
    return Y11_from_E(Frec, 1, C0, G0)

def Get_Aire_C0_G0 (Frecs, Y11):
    out_dict:{'C0':[],
              'G0':[],
              }
    # Realizar el ajuste de curva
    C0_inicial = 1
    G0_inicial = 1
    parametros_optimizados, _ = curve_fit(Y11_AIRE, Frecs, Y11, p0=[C0_inicial, G0_inicial])
    
    # Los parámetros optimizados C0 y G0 estarán en 'parametros_optimizados'
    C0_optimizado, G0_optimizado = parametros_optimizados
    
    print("C0 optimizado:", C0_optimizado)
    print("G0 optimizado:", G0_optimizado)

    return C0_optimizado, G0_optimizado