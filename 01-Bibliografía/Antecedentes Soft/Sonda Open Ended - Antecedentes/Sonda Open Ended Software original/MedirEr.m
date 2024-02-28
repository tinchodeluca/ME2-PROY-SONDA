function [ ER_out,freq ] = MedirEr(VNA, s11_agua, s11_abierto, s11_isopropilico, s11_corto)
%%
%con esta funcion tomo los datos de un matial y obtengo el er y lo grafico
%devuelve el er y la frecuencia

string="set(handles.edit2,'String','Poner la sonda en EL MATERIAL A MEDIR y presionar LISTO')";
evalin('caller',string);
string="set(handles.pushbutton5,'Enable','on')";
evalin('caller',string);
evalin('caller','uiwait');
string="set(handles.edit2,'String','Midiendo el material, por favor espere unos minutos.')";
evalin('caller',string);

[freq, s11_real_MEDIR, s11_imag_MEDIR]=Data(VNA);
medido=s11_real_MEDIR + 1j*s11_imag_MEDIR;
 
%ER=calculo_ER_con_conductancia(frecuencia,s11_isopropilico,s11_agua,s11_abierto,s11_corto,s11_isopropilico);
 
%%  Calculo de er del material  
f=freq;
r_medido=medido;
r_agua=s11_agua;
r_aire=s11_abierto;
r_corto=s11_corto;
r_alcohol=s11_isopropilico;



syms Em;
vars = Em;

Er_agua=Patron_agua_destilada(f);
Er_alcohol=Patron_isopropilico100(f);

A=((r_alcohol-r_corto).*(r_agua-r_aire).*Er_alcohol);
B=((r_alcohol-r_aire).*(r_corto-r_agua).*Er_agua);
C=((r_alcohol-r_aire).*(r_aire-r_corto));

D=((r_alcohol-r_corto).*(r_agua-r_aire).*((Er_alcohol).^(5/2)));
E=((r_alcohol-r_aire).*(r_corto-r_agua).*((Er_agua)).^(5/2));
F=((r_alcohol-r_aire).*(r_aire-r_corto));

Gn=-1*(A+B+C)./(D+E+F);

solEm=zeros(1,length(f));

global gsolem;
global SELECT_PATRONES;

    for n = 1:length(f)
        
        %disp(n);% luego comentar esto 

        
        string="set(handles.edit2,'String','Calculando Er " + floor(n/1) + "%')";
        %cambiado el floor 10.24 -> 2.01
        
        evalin('caller',string);
        
        pause(20/1000);


        X=((r_medido(n)-r_aire(n))*(r_corto(n)-r_agua(n)))/((r_medido(n)-r_corto(n))*(r_agua(n)-r_aire(n)));
        Z=((r_medido(n)-r_agua(n))*(r_aire(n)-r_corto(n)))/((r_medido(n)-r_corto(n))*(r_agua(n)-r_aire(n)));

        eqns = 0==Em+Gn(n)*(Em^(5/2))+(Er_agua(n)+Gn(n)*(Er_agua(n)^(5/2)))*X+(1+Gn(n))*Z;
        solEm(n) = solve(eqns, vars);
        
        %acá tendría que intentar graficar en tiempo real:
        dato=double(solEm);
        gsolem=dato;
        
        %BORRO TODO EL GRAFICO Y GRAFICO EL PATRON SELECCIONADO
        string="subplot(1,1,1);cla; global gsolem;";
        evalin ('caller',string);
        if(SELECT_PATRONES>0)
            string="PlotCart2(F_PATRONES, real(ER_PATRONES(SELECT_PATRONES,:)), imag(ER_PATRONES(SELECT_PATRONES,:)),'*');"; 
            evalin('caller',string);
        end
        string="hold on; PlotCart(FRECUENCIA, real(gsolem), -1*imag(gsolem) ); hold off;";
        evalin('caller',string);
        
        %GRAFICO EL R_MEDIDO
        
        
    end
        
ER_out=double(dato);

% %% Cálculo sin conductancia
% 
% r_agua=s11_agua;
% r_aire=s11_abierto;
% r_corto=s11_corto;
% 
% ER_out=obtengo_ER_material(freq,medido,r_agua,r_aire,r_corto);
end 