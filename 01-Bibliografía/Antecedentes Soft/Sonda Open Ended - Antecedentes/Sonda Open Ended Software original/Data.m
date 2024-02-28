function [ s11_freq, s11_real, s11_imag ] = Data( N9917A )
%DATA Summary of this function goes here
%   Detailed explanation goes here

% C�mo se toma datos: esto sirve para tomar lo que voy a mostrar en
% pantalla nada m�s, despu�s tengo que hacer el print de: s11_freq, s11_real, s11_imag.

% Le digo cada cu�nto el sweep: ver de sacar esto si hago s�lo una medici�n

% fprintf(N9917A,'SWE:TIME .250');

% hac� un sweep y espero a que termines
fprintf(N9917A,'INIT');
% AHORA VOY A PEDIRLE DATA:
pause(3); %cambiar por un valor que le pregunto al VNA + 1 segundo chang�i.
%
% Este 30 tiene que cambiarse por un delay mucho m�s chico ahora
% lo cambi� a 5 pero probablemente no alcance
%
%disp("Seleccionando traza.");
%selecciono trace1 (real de s11) y le pido los datos
fprintf(N9917A,'CALC:PAR1:SEL');
pause(1000/1000);
fprintf(N9917A,'CALC:DATA:FDAT?');
pause(1000/1000);

%disp("Obteniendo datos.");
ans_y = fscanf((N9917A),'%s');
pause(200/1000);
ans_def=ans_y;
ans_y = fscanf((N9917A),'%s');
pause(200/1000);
while length(ans_y) == 512
    
    ans_def=strcat(ans_def,ans_y);
    ans_y = fscanf((N9917A),'%s');
    pause(200/1000);
    
end

ans_def=strcat(ans_def,ans_y); %%y concateno la �ltima parte de la movida

% ac� separo los caract�res y queda un 1xNPuntosDeMuestreo cell
ans_def=regexp(ans_def, ',','split');

% ac� ten�s tu m�dulo de s11
s11_real=str2double(ans_def);

% ahora voy a pedir los puntos de frecuencia:
fprintf(N9917A,'FREQ:DATA?');
pause(200/1000);
%disp("Obteniendo datos.");
ans_x = fscanf((N9917A),'%s');
pause(200/1000);
ans_def=ans_x;
ans_x = fscanf((N9917A),'%s');
pause(200/1000);
while length(ans_x) == 512
    
    ans_def=strcat(ans_def,ans_x);
    ans_x = fscanf((N9917A),'%s');
    pause(200/1000);
    
end
ans_def=strcat(ans_def,ans_x); %%y concateno la �ltima parte de la movida

% ac� separo los caract�res y queda un 1xNPuntosDeMuestreo cell
ans_def=regexp(ans_def, ',','split');

% ac� ten�s tus frecuencias de s11
s11_freq=str2double(ans_def);

% selecciono trace2 (imag de s11) y le pido los datos y hago todo lo mismo
% que antes
%disp("Seleccionando traza.");
fprintf(N9917A,'CALC:PAR2:SEL');
pause(1000/1000);
fprintf(N9917A,'CALC:DATA:FDAT?');
pause(1000/1000);
%disp("Obteniendo datos.");
ans_y = fscanf((N9917A),'%s');
pause(500/1000);
ans_def=ans_y;
ans_y = fscanf((N9917A),'%s');
pause(500/1000);

while length(ans_y) == 512
    
    ans_def=strcat(ans_def,ans_y);
    ans_y = fscanf((N9917A),'%s');
    pause(200/1000);
    
end

ans_def=strcat(ans_def,ans_y); %%y concateno la �ltima parte de la movida

% ac� separo los caract�res y queda un 1xNPuntosDeMuestreo cell
ans_def=regexp(ans_def, ',','split');

% ac� ten�s tu imaginario de s11
s11_imag=str2double(ans_def);

% ahora tengo todos mis datos en s11_freq, s11_real, s11_imag.


end

