clc;
clear all;
close all;

%starting data
x = -4:1e-3:1;
y =@(x) 4*x.^3 + x.^2 + 2*x + 8; %(x) allows when calling the function e.g. y (a) to replace all values of x with the value of a

%interval for calculations
a = -4;
b = 1;
x1 = 1; %in order to start while loop

%iterator
i = 0;

while abs(y(x1))>0.01

    x1 = a - (((y(a))/(y(b)-y(a)))*(b-a)); %calulation of the new point for the interval
    
    if (y(x1)*y(a))>0 %checking a condition for calculating a or b
        
        b = x1 - (((y(x1))/(y(b)-y(x1))) * (b-x1)); %determination the value of b
        
    else
        
        a = x1 - (((y(x1))/(y(a)-y(x1))) * (a-x1)); %determination the value of b
        
    end
    i = i + 1;
end

%printing the results
Z = ['Zero point is: ',num2str(x1)];
disp(Z);
Z = ['Number of iterations is: ',num2str(i)];
disp(Z);