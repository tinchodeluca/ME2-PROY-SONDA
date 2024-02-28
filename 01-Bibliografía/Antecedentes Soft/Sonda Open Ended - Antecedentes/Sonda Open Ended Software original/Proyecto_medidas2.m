%% Esta función inicializa el VNA.
% abre el puerto, inicializa el VNA para s11.REAL e s11.IMAG, 2 trazas, de 100Mhz a 10 Ghz
% y sarasa etcetera
VNA=InitVNA();

%% Obtendré 4 mediciones con agua destilada, circuito abierto , corto circuito y alcohol isopropilico
[s11_agua,s11_abierto,s11_isopropilico,s11_corto,frecuencia]=Calib_manual(VNA);

%% Y ahora puedo calcular er!!
[ ER,F ] = MedirEr(VNA, s11_agua, s11_abierto, s11_isopropilico, s11_corto, frecuencia);

%%  ahora cierro el puerto
EnVNA(VNA);