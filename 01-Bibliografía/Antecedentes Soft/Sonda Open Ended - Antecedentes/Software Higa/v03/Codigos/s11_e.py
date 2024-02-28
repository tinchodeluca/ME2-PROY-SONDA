# -*- coding: utf-8 -*-
"""
Created on Sat Nov 21 03:09:39 2015

@author: debi
"""

import csv 
from cmath import atan

file_name = "agua_dest_25"
    
file_in = "Mediciones/"+file_name+".csv"
file_out = "Resultados/er_"+file_name+".csv"

er = []
f = []

with open("Mediciones/freq.csv", 'rb') as csvfile:
    reader = csv.reader(csvfile)
    for freq in reader:
		for i in range(len(freq)):
			f.append(float(freq[i]))

c = 299792458
x = 0.00795+0.0025+0.08788

i=0
with open(file_in, 'rb') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    for s11_real_str, s11_img_str in reader:

		s11_real = float(s11_real_str)
		s11_img = float(s11_img_str)
		s11 = complex(s11_real,s11_img)
		
		B = c / (2*3.14*x*f[i])
		C = -i*(1-s11)/(1+s11)
		A = B*atan(C)
		A_2 = A*A
		print A_2
		i = i+1

        