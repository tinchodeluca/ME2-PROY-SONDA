function [ ER ] = Patron_etilico( F )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

A=4.505+((24.43-4.505)./(1+(1j*F/(0.964e9))))-1*j*F*0.056/1e9;%.^(1-0.014));

ER=real(A)-1*j*imag(A);

end

