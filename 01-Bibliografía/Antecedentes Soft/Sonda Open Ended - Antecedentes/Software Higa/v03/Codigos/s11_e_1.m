format long

% Get s11 (real and imaginary parts)
s11_25 = dlmread('Mediciones/agua_dest_25.csv',';');
s11_30 = dlmread('Mediciones/agua_dest_30.csv',';');
s11_35 = dlmread('Mediciones/agua_dest_35.csv',';');
s11_40 = dlmread('Mediciones/agua_dest_40.csv',';');
s11_50 = dlmread('Mediciones/agua_dest_50.csv',';');
s11_55 = dlmread('Mediciones/agua_dest_55.csv',';');
s11_60 = dlmread('Mediciones/agua_dest_60.csv',';');
s11_aire = dlmread('Mediciones/aire_25.csv',';');
freq = dlmread('Mediciones/freq.csv',';');

n = size(freq);
c = 299792458;
x = 0.00795+0.0025+0.08788;
eps = zeros(n(1),2);

for j = 1:n(1)
    f = freq(j);
    s11 = complex(s11_60(j,1),s11_60(j,2));
    B = c / (2*pi*x*f);
    C = -1i*(1-s11)/(1+s11);
    A = B*atan(C);               % For complex values of X, atan(X) returns complex values. All angles are in radians.
    A_2 = A^2;
    eps(j,1) = real(A_2);
    eps(j,2) = imag(A_2);  
end

size(eps(:,1));
size(freq);
eps(:,1)
%semilog(eps(:,1),freq)
semilogx(eps(:,1),freq)
