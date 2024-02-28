function [ ER ] = obtengo_ER_material( f,r_medido,r_agua,r_aire,r_corto )

%esta funcion calcula el er de un material en funcion de 3 patrones
%conocidos. desprecia la conductividad este metodo 
%24/09/2019 Ebrecht Agustin


Er_agua=Patron_agua_destilada(f);

A=((r_medido-r_agua).*(r_aire-r_corto))./((r_medido-r_corto).*(r_agua-r_aire));
ER=-(((r_medido-r_aire).*(r_corto-r_agua))./((r_medido-r_corto).*(r_agua-r_aire))).*Er_agua-A;

end

