%ECE 4350 - Homework 1
%Caitlyn Caggia

f = linspace(1e9, 10e9, 1000); %consider f from 1GHz - 10GHz
w = 2.*pi.*f;
f0 = 6e9; %given center frequency of 6 GHz
w0 = 2*pi*f0; 
gammaM = 0.05*ones(1,length(w));
Z0 = 50;
Zl = 75 - j*20;

%solution 1a --------------------------------------------------------------
B = 0.006373; X = 38.9444;
L = X/w0; %1.6913e-13 H
C = B/w0; %1.033e-9 F

Zin = zeros(1,length(w));
gamma = zeros(1,length(w));

for i = 1:length(w)
    Zin(i) = j*w(i)*L + ((j*w(i)*C)^-1*Zl) / ((j*w(i)*C)^-1 + Zl);
    gamma(i) = (Zin(i) - Z0) / (Zin(i) + Z0);
end

figure
plot(f,abs(gamma), f, gammaM)
title('HW1.6a Solution 1')

%solution 2a --------------------------------------------------------------
B = -0.013015; X = -38.9444;
L = -1/(B*w0); 
C = -1/(X*w0);

Zin = zeros(1,length(w));
gamma = zeros(1,length(w));

for i = 1:length(w)
    Zin(i) = 1/(j*w(i)*C) + (j*(w(i)*L)*Zl) / (j*(w(i)*L) + Zl);
    gamma(i) = (Zin(i) - Z0) / (Zin(i) + Z0);
end

figure
plot(f,abs(gamma), f, gammaM)
title('HW1.6a Solution 2')


%solution 1b --------------------------------------------------------------
Zl = 25 - j*20;
B = 0.02; X = 45;
L = X/w0; 
C = B/w0;

Zin = zeros(1,length(w));
gamma = zeros(1,length(w));

for i = 1:length(w)
    ZC = (j*w(i)*C)^-1;
    ZL = j*w(i)*L + Zl;
    Zin(i) = (ZC*ZL) / (ZC+ZL);
    gamma(i) = (Zin(i) - Z0) / (Zin(i) + Z0);
end

figure
plot(f,abs(gamma), f, gammaM)
title('HW1.6b Solution 1')


%solution 2b --------------------------------------------------------------
B = -0.02; X = -5;
L = -1/(B*w0); 
C = -1/(X*w0);

Zin = zeros(1,length(w));
gamma = zeros(1,length(w));

for i = 1:length(w)
    ZC = (j*w(i)*C)^-1 + Zl;
    ZL = (j*w(i)*L);
    Zin(i) = (ZL*ZC) / (ZL+ZC);
    gamma(i) = (Zin(i) - Z0) / (Zin(i) + Z0);
end

figure
plot(f,abs(gamma), f, gammaM)
title('HW1.6b Solution 2')


