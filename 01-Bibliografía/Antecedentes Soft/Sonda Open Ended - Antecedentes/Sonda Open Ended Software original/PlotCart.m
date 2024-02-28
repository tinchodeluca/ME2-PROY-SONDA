function [ ] = PlotCart(f, re, im)
%PLOTCART Summary of this function goes here
%   Detailed explanation goes here
%figure();
%subplot(1,1,1);
%title('');
plot(f,re);
hold on;
plot(f,im);
xlim([f(1) f(length(f))]);
grid on;
title('Real e Imaginario') 
legend('Parte real','Parte imaginaria');
hold off;


end

