% 
% for j = 1:n(1)
%     f = freq(j);
%     s11 = complex(s11_60(j,1),s11_60(j,2));
%     B = c / (2*pi*x*f);
%     C = -1i*(1-s11)/(1+s11);
%     A = B*atan(C);               % For complex values of X, atan(X) returns complex values. All angles are in radians.
%     A_2 = A^2;
%     eps(j,1) = real(A_2);
%     eps(j,2) = imag(A_2);  
% end
% 
% 
% 
% eps_real = 80; % Make a starting guess at the solution 
% options=optimset('Display','iter'); % Option to display output 
% [x,fval] = fsolve(@myfun,eps_real,options) % Call solver
% 
% 
% 
% 
% size(eps(:,1));
% size(freq);
% eps(:,1)
% %semilog(eps(:,1),freq)
% semilogx(eps(:,1),freq)

function fsolveDemo

    format long

    s11_eps('Mediciones/aire_25.csv','Resultados/aire_25.csv',[1 0]);
    s11_eps('Mediciones/agua_dest_25.csv','Resultados/agua_dest_25.csv',[100 0]);
    s11_eps('Mediciones/agua_dest_30.csv','Resultados/agua_dest_30.csv',[75 0]);
    s11_eps('Mediciones/agua_dest_40.csv','Resultados/agua_dest_40.csv',[70 0]);
    s11_eps('Mediciones/agua_dest_50.csv','Resultados/agua_dest_50.csv',[65 0]);
    s11_eps('Mediciones/agua_dest_55.csv','Resultados/agua_dest_55.csv',[60 0]);
    s11_eps('Mediciones/agua_dest_60.csv','Resultados/agua_dest_60.csv',[60 0]);

end

function s11_eps(file_in, file_out, eps0)

    freq = dlmread('Mediciones/freq.csv',';');

    n = size(freq);
    c = 299792458;
    x = 0.00795+0.0025+0.08788;
    eps = zeros(n(1),4);

    s11_aire = dlmread(file_in,';');  
    for j = 1:n(1)
        f = freq(j);
        s11 = complex(s11_aire(j,1),s11_aire(j,2));
        myfun=@(eps) myfunction(eps, f, s11);
        options=optimset('Display','off');   % Option to display output
        [sol,fval,exitflag,output] = fsolve(myfun, eps0, options);       % Call solver
        if exitflag<=0
            eps(j,4) = 1;
        end
        eps(j,1) = f;
        eps(j,2) = real(sol(1));
        eps(j,3) = imag(sol(1)); 
    end
    dlmwrite(file_out,eps,'precision','%.11f');
end

function F = myfunction(eps, f, s11)
    
    c = 299792458;
    x = 0.00795+0.0025+0.08788;
  
    A = 1i*tan(x*2*pi*f*sqrt(eps)/c);
    B = (1-s11)/(1+s11);
    F = A-B;
    
end
