function [  ] = PlotModPhase( x ,y1 ,y2, TIT)
%PLOTMAGPHASE plotea la magnitud y fase de un parámetro
%  
%figure();

subplot(2,1,1);
plot(x,y1);
%ylim([0.1 1.1]);
%xlim([x(1) x(length(x))]);
%yticks(-0.1:.1:1.1)
grid on;
%title('Módulo') 
string={'Módulo del', TIT};
string=strjoin(string);
legend(string);
subplot(2,1,2);
plot(x,y2);
ylim([-180 180]);
%xlim([x(1) x(length(x))]);
yticks(-180:30:180)
grid on;
string={'Fase del', TIT};
string=strjoin(string);
%title('Fase') 
legend (string);

end