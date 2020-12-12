 % ECE 4350 - Homework 5.2
% Caitlyn Caggia

f = linspace(0,10e9,1000);
band = zeros(1,length(f));
intersections = 0;

for i = 1:length(f)
   
    ABCD = getABCD(f(i));
    Ao = ABCD(1,1);
    Do = ABCD(2,2);
    band(i) = abs((Ao + Do)/2);
    
    if (i > 1)
        j = length(intersections);
        if (band(i-1) < 1 && band(i) >= 1)
            intersections(j+1) = f(i);
        elseif (band(i-1) > 1 && band(i) <= 1)
            intersections(j+1) = f(i);
        end
    end
    
end

figure
hold on
title('Single Unit Cell')
xlabel('frequency (GHz)')
ylabel('abs(Ao+Do)/2')
plot(f,band)
plot(f,ones(1,1000))
display(intersections)


for i = 1:length(f)
   
    ABCD = getABCD(f(i));
    for j = 1:4
        ABCD = ABCD * ABCD;
    end
    Ao = ABCD(1,1);
    Do = ABCD(2,2);
    band(i) = abs((Ao + Do)/2);
    
    if (i > 1)
        j = length(intersections);
        if (band(i-1) < 1 && band(i) >= 1)
            intersections(j+1) = f(i);
        elseif (band(i-1) > 1 && band(i) <= 1)
            intersections(j+1) = f(i);
        end
    end
    
end

figure
hold on
title('Four Unit Cells')
xlabel('frequency (GHz)')
ylabel('abs(Ao+Do)/2')
plot(f,band)
plot(f,ones(1,1000))

function [matrix] = getABCD(f)

    l1 = 3e-2; l2 = 2e-2;
    Er1 = 3; Er2 = 7;
    mur1 = 1; mur2 = 1;
    Eo = 8.85e-12; muo = (4*pi)*10^(-7);
    
    Zo1 = 50;
    Yo1 = 1/Zo1;
    Zo2 = 40;
    Yo2 = 1/Zo2;
    
    B1 = 2*pi*f*sqrt(Eo*Er1*muo*mur1);
    B2 = 2*pi*f*sqrt(Eo*Er2*muo*mur2);
    
    line1 = [cos(B1*l1), j*Zo1*sin(B1*l1);
             j*Yo1*sin(B1*l1), cos(B1*l1)];
    line2 = [cos(B2*l2), j*Zo2*sin(B2*l2);
             j*Yo2*sin(B2*l2), cos(B2*l2)];
    matrix = line1 * line2;

end