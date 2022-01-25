clc;
clear all;
close all;

%starting data
x = -4:1e-3:1;
y =@(x) 4*x.^3 + x.^2 + 2*x + 8; %(x) allows when calling the function e.g. y (a) to replace all values of x with the value of a

%interval for calculations
a = -4;
b = 1;

%iterator
u = 0;

%for calculation the frst value
flag = 0;

g=0;
xv=1;

while abs(y(xv))>=0.1
        
        if flag == 0
            z = (((y(b)-y(a))/(b-a))*(x-a)) + y(a); %vector with y values ??for the first secant 
            flag = flag + 1;
        end
    
        %finding the point of intersection with the OX axis 
        for i=1:length(g)
            if abs(g(i))<= 0.1
                o=g(i);%the y-value for which you need to find x to the next tangent 
                xv = interp1(z, x, o, 'linear'); %determining the value of x 
            end
        end
        
        %the decision of which punk is fixed and which is fickle 
        if abs(a-xv)>abs(b-xv)
            b = xv; %fickle b, constant a 
            z = (((y(b)-y(a))/(b-a))*(x-a)) + y(a);
        else
            a = xv; %fickle a, constant b 
            z = (((y(a)-y(b))/(a-b))*(x-b)) + y(b);
        end
        
        %plots
        k = -4:1e-3:1;
        h = 4*k.^3 + k.^2 + 2*k + 8;
        
        figure(1);
        plot(k,h,'b');
        hold on;
        %grid;
        plot(k,z,'r');
        title('Graph of the entire function with incisors');
        
        
        figure(2);
        plot(k,h,'b');
        hold on;
        %grid;
        plot(k,z,'r');
        title('Zoom on the function in place of determining the final value of the zero position ');
        xlim([-1.25 -1.15]); %limitation of the x axis value 
        ylim([-1 1]); %limitation of the y axis value 
        
        
u = u + 1;
end

%boxes to the chart
figure(1);
grid;
dim = [.2 .5 .3 .3]; %box position with text 
str = {'Number of iterations is: ', num2str(u), 'Zero position is: ', num2str(xv)}; %string for the box
annotation('textbox',dim,'String',str,'FitBoxToText','on'); %printing the textbox

figure(2);
grid;
dim = [.2 .5 .3 .3]; %box position with text
str = {'Number of iterations is: ', num2str(u), 'Zero position is: ', num2str(xv)}; %string for the box
annotation('textbox',dim,'String',str,'FitBoxToText','on'); %printing the textbox

%Printing the result
Z = ['Zero position is: ',num2str(xv)];
disp(Z);
Z = ['Number of iterations is: ',num2str(u)];
disp(Z);