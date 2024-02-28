function [ N9917A ] = InitVNA(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% automatizando VNA

% instrhwinfo ('visa','agilent')
warning('off','all') %???

N9917A=visa('agilent','USB0::0x2A8D::0x5C18::MY56072049::0::INSTR');
pause(200/1000);
fopen(N9917A);
% comando para ponerlo en modo NA network analyzer:
fprintf(N9917A,'INST "NA"'); %%fprintf(N9917A,'INST "NA";*OPC?');
pause(2);
% % CALIBRACION MECANICA PARA 1 PUERTO:
% % Select a Type N male, 50 ohm connector as the DUT connector to be attached to port 1.
% fprintf (N9917A,'CORR:COLL:CONN 1, "Type N -M-,50"');
% % Select the calkit to use.
% fprintf(N9917A,'CORR:COLL:CKIT:LABel 1,"85518A"'); %%ver si esto era así
% % Select 1-port cal (SOLT1) on port 1
% fprintf(N9917A,'CORR:COLL:METH:SOLT1 1');
% x=input("Attach LOAD to port 1 and press ENTER");
% fprintf(N9917A,'CORR:COLL:LOAD 1;*OPC?');
% x=input("attach short to port 1 and press ENTER");
% fprintf(N9917A,'CORR:COLL:SHOR 1;*OPC?');
% x=input("attach open to port 1 and press ENTER");
% fprintf(N9917A,'CORR:COLL:OPEN 1;*OPC?');
% % FINISH CAL 1 PORT:
% fprintf(N9917A,'CORR:COLL:SAVE 0');
% AHORA LE DIGO QUE NO CORRIJA CON CALIBRACIÖN DE USUARIO
fprintf(N9917A,'CORR 0');
pause(200/1000);
% comando para apagar la pantalla
% fprintf(N9917A,'DISP:ENAB 0');
% comando para setear single sweep
fprintf(N9917A,'INIT:CONT 0');
pause(200/1000);
% comando para poner 2 ventanas
fprintf(N9917A,'DISP:WIND:SPL D12H');
pause(200/1000);
% le voy a decir que empiece a medir para 100Mhz
fprintf(N9917A,'FREQ:STAR 100E6');
pause(200/1000);
% y ahora que termine de medir en 10Ghz
fprintf(N9917A,'FREQ:STOP 10E9');
pause(200/1000);
% Le cambio la resolución a 1000 puntos
%fprintf(N9917A,'SWE:POIN 1024');
fprintf(N9917A,'SWE:POIN 100');
pause(200/1000);
% Le digo qué medir en cada trace.
fprintf(N9917A,'CALC:PAR1:DEF S11');
pause(200/1000);
fprintf(N9917A,'CALC:PAR1:SEL');
pause(200/1000);
fprintf(N9917A,'CALC:FORMat REAL');% poner en lineal (MLIN) o REAL
pause(200/1000);
fprintf(N9917A,'CALC:PAR2:DEF S11');
pause(200/1000);
fprintf(N9917A,'CALC:PAR2:SEL');
pause(200/1000);
fprintf(N9917A,'CALC:FORMat IMAG');% IMAG O PHAS
pause(200/1000);

end

