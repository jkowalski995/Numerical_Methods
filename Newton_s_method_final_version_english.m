clc;
clear all;
close all;

%starting data
x = -4:1e-3:1;
y =@(x) 4*x.^3 + x.^2 + 2*x + 8; %(x) allows when calling the function e.g. y (a) to replace all values of x with the value of a

%interval for calculations
a = -4;
b = 1;
xv=a;

%iterator
u = 0;

while abs(y(xv))>=0.1
    
    %derivative
    syms y(x)
    y(x) = 4*x.^3 + x.^2 + 2*x + 8;
    df = diff(y,x);

    %determination of the tangent equation
    z = (df(xv)*(x-xv))+y(xv); % f(x)-f(x0)=(f'(x0)*(x-x0))
    c = sym2poly(z); %getting the values ??at x to convert from symbolic to double 

    %conversion from symbolic to double
    x1 = -4:1e-3:1; %with a regular x did not want to cooperate 
    j=length(c)-1;
    g=0;
    for i=1:length(c)
        g = g + (c(i)*x1.^(j));
        j = j - 1;
    end
    
    %finding the point of intersection with the OX axis 
    for i=1:length(g)
        if abs(g(i))<= 0.1
            a=g(i);%the y-value for which you need to find x to the next tangent 
            xv = interp1(g, x1, a, 'linear'); %determining the value of x
        end
    end
    u = u + 1;
    
    %plots
    k = -4:1e-3:1;
    h = 4*k.^3 + k.^2 + 2*k + 8;
    
    figure(1);
    plot(k,h,'b');
    hold on;
    grid;
    plot(k,g,'r');
    title('The plot of the entire function with tangent lines ');

    figure(2);
    plot(k,h,'b');
    hold on;
    grid;
    plot(k,g,'r');
    title('Zoom on the function in place of determining the final value of the zero point ');
    xlim([-1.25 -1.15]); %limitation of the x axis value 
    ylim([-1 1]); %limitation of the y axis value 

end

%boxes to the chart
figure(1);
dim = [.2 .5 .3 .3]; %box position with text
str = {'Number of iterations is: ', num2str(u), 'Zero position is: ', num2str(xv)}; %string for the box
annotation('textbox',dim,'String',str,'FitBoxToText','on'); %printing the textbox

figure(2);
dim = [.2 .5 .3 .3]; %box position with text
str = {'Number of iterations is: ', num2str(u), 'Zero position is: ', num2str(xv)}; %string for the box
annotation('textbox',dim,'String',str,'FitBoxToText','on'); %printing the textbox

%Printing the result
Z = ['Zero position is: ',num2str(xv)];
disp(Z);
Z = ['Number of iterations is: ',num2str(u)];
disp(Z);
