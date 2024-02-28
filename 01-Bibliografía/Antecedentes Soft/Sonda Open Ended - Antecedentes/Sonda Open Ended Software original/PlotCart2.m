function [ ] = PlotCart2(f, re, im, line)
%PLOTCART Summary of this function goes here
%   Detailed explanation goes here
%figure();
%subplot(1,1,1);
%title('');
if (line=='-')
    
    plot(f,re);
    hold on;
    plot(f,im);
    xlim([f(1) f(length(f))]);
    grid on;
    title('Real e Imaginario') 
    legend('Parte real','Parte imaginaria');
    hold off;
    
else
    
    plot(f,re,line);
    hold on;
    plot(f,im,line);
    xlim([f(1) f(length(f))]);
    grid on;
    title('Real e Imaginario') 
    legend('Parte real','Parte imaginaria');
    hold off;

end

