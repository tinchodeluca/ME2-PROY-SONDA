function [ s11_agua, s11_abierto, s11_isopropilico, s11_corto, frecuencia ] = Calib_manual( N9917A )
%Esta función me permite hacer la calibración, con agua destilada, a CA y
%CC. Después tengo que calcular el error box. Voy a tener:
%s11_real_aguadestilada, s11_imag_aguadestilada, s11_freq_aguadestilada,
%s11_real_CA, s11_imag_CA, s11_freq_CA,
%s11_real_CC, s11_imag_CC, s11_freq_CC

%% sección circuito abierto (CA)
%disp("Poner la sonda en CIRCUITO ABIERTO y presionar ENTER");
string="set(handles.edit2,'String','Poner la sonda en CIRCUITO ABIERTO y presionar LISTO')";
evalin('caller',string);
string="set(handles.pushbutton5,'Enable','on')";
evalin('caller',string);
%input('');
evalin('caller','uiwait');
string="set(handles.edit2,'String','Midiendo el circuito abierto, por favor espere unos minutos.')";
evalin('caller',string);
[s11_freq_CA, s11_real_CA, s11_imag_CA]=Data(N9917A);
s11_abierto=s11_real_CA + 1j*s11_imag_CA;

%% Sección corto circuito:
%disp("Poner la sonda en CORTO CIRCUITO y presionar ENTER");
string="set(handles.edit2,'String','Poner la sonda en CORTO CIRCUITO y presionar LISTO')";
evalin('caller',string);
string="set(handles.pushbutton5,'Enable','on')";
evalin('caller',string);
%input('');
evalin('caller','uiwait');
string="set(handles.edit2,'String','Midiendo el corto circuito, por favor espere unos minutos.')";
evalin('caller',string);
[s11_freq_CC, s11_real_CC, s11_imag_CC]=Data(N9917A);
s11_corto=s11_real_CC + 1j*s11_imag_CC;


%% sección agua destilada:
%disp("Sumergir la sonda en agua destilada y presionar ENTER");
string="set(handles.edit2,'String','Sumergir la sonda en AGUA DESTILADA y presionar LISTO')";
evalin('caller',string);
string="set(handles.pushbutton5,'Enable','on')";
evalin('caller',string);
%input('');
evalin('caller','uiwait');
string="set(handles.edit2,'String','Midiendo el agua destilada, por favor espere unos minutos.')";
evalin('caller',string);
[s11_freq_aguadestilada, s11_real_aguadestilada,s11_imag_aguadestilada]=Data(N9917A);
s11_agua=s11_real_aguadestilada+1j*s11_imag_aguadestilada;

%% sección alcohol isopropilico 99%:
%disp("Sumergir la sonda en alcohol isopropilico y presionar ENTER");
%set(handles.edit2,'String','Sumergir la sonda en ALCOHOL ISOPROPÍLICO y presionar LISTO');
string="set(handles.edit2,'String','Sumergir la sonda en ALCOHOL ISOPROPÍLICO y presionar LISTO')";
evalin('caller',string);
string="set(handles.pushbutton5,'Enable','on')";
evalin('caller',string);
%input('');
evalin('caller','uiwait');
string="set(handles.edit2,'String','Midiendo el alcohol isopropílico, por favor espere unos minutos.')";
evalin('caller',string);
[s11_freq_isopropilico, s11_real_isopropilico,s11_imag_isopropilico]=Data(N9917A);
s11_isopropilico=s11_real_isopropilico+1j*s11_imag_isopropilico;
 
frecuencia=s11_freq_isopropilico;


end

