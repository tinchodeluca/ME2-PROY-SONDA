function [ ER ] = calculo_ER_con_conductancia(f,r_medido,r_agua,r_aire,r_corto,r_alcohol )
%Calcula el er del materia sin deespreciar la conductividad que puede tener
%la sonda 
%24/09/2019 Ebrecht Agustin
%warning('off','all')

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

    for n = 1:length(f)
        disp(n);
       
        X=((r_medido(n)-r_aire(n))*(r_corto(n)-r_agua(n)))/((r_medido(n)-r_corto(n))*(r_agua(n)-r_aire(n)));
        Z=((r_medido(n)-r_agua(n))*(r_aire(n)-r_corto(n)))/((r_medido(n)-r_corto(n))*(r_agua(n)-r_aire(n)));

        eqns = 0==Em+Gn(n)*(Em^(5/2))+(Er_agua(n)+Gn(n)*(Er_agua(n)^(5/2)))*X+(1+Gn(n))*Z;
        solEm(n) = solve(eqns, vars);
    end
    
    ER=double(solEm);
        
end



