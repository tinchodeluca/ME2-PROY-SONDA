# -*- coding: utf-8 -*-
"""
Created on Sat Nov 21 03:09:39 2015

@author: debi
"""

import numpy as np
from scipy.optimize import fsolve
from cmath import rect, sqrt, tan
from math import radians, log1p
import csv

# Constants
Zo2 = 50
c = 299792458
er2 = 1
x1 = 0.00795+0.0025+0.08788
x2 = 0.0099+0.0366
uo = 1.2566370614E-6
eo = 8.854187817E-12
k = sqrt(uo/eo) / (2*np.pi)
b = 0.0184
a = 0.008

def fun(xs, f, s11_real, s11_img):
    er1 = complex(*xs)
    s11 = complex(s11_real, s11_img)
    lambda1 = c / (f*sqrt(er1)) 
    beta1 = 2 * np.pi / lambda1
    A = 1j * tan(beta1*x1)
    B = (1-s11) / (1+s11)
    resul = A - B
    return [resul.real, resul.imag]

er1 = []

file_name = "agua_60"

# Calculo de valores teoricos
er1_teorico=[]

#Aire: 1
#Agua: 80
#Alcohol: 25
es = 55
einf = 5.62
tau = 80E9

frec = 1E9
while(frec<=1E10):
    den = 1 + 1j*frec/tau
    er = einf + ((es-einf)/den)
    er1_teorico.append((er.real, er.imag))
    #print (frec/(2*np.pi)), er.real, er.imag
    frec = frec + 0.05E9
    
file_in = "Mediciones/"+file_name+".csv"
file_out = "Resultados/"+file_name+".csv"

i=0
with open(file_in, 'rb') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    for f_str, s11_mod_str, s11_phase_str in reader:
        f = float(f_str)
        s11_mod = float(s11_mod_str.replace(',','.'))
        s11_phase = float(s11_phase_str.replace(',','.'))
        [(er1_real,er1_imag), info, ier, mesg] = fsolve(fun, x0=[es, 0], args=(f, s11_mod, s11_phase), full_output=True)       
        if mesg!='The solution converged.':        
            print i+1,mesg        
        i = i+1        
        er1.append((er1_real,er1_imag))
        
with open(file_out, 'wb') as csvfile:
    writer = csv.writer(csvfile, delimiter=';')
    i = 0
    for er1_med in er1:
        writer.writerow( [str(er1_med[0]).replace('.',',')] + [str(er1_med[1]).replace('.',',')])
        i = i+1