function [ ER ] = Patron_isopropilico100( f )
%curva del er complejo del isopropilico al 99 segun la curva de deybe 
%24/09/2019 Ebrecht Agustin

ER=3.065+((19.30-3.551)./(1+(1j*f/(0.443e9))))+((3.551-3.065)./(1+1*j*f/(5.999e9)));%.^(1-0.014));

end

