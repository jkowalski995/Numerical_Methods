clc;
clear all;
close all;

%starting data
x = -4:1e-3:1;
y =@(x) 4*x.^3 + x.^2 + 2*x + 8; %(x) allows when calling the function e.g. y (a) to replace all values of x with the value of a

%interval for calculations
a = -4;
b = 1;

%for plotting points after every step
v = [];
g = [];

%iterator
u = 0;

%for calculations
i = 1;

if ((a+b)/2)==0 %checking if we do not come up with a zero point immediately
    
    z = (a+b)/2;
    Z = ['Zero point is: ', num2str(z)]; %preparation for printing
    disp(Z); %printing the result
    
else
    
   while abs(a-b)>0.01 %accuracy condition
      
       x = (a+b)/2; %we set a new value of the border
       
       %searching in which of the two new intervals is the change of sign and choosing that x will be the new b or a (the new interval border)
       if y(a)*y(x) < 0 
           
           b=x;
           %collecting the determined points and the corresponding values of the y function
           v(i)=x;
           g(i)=y(x);
       else
           
           a=x;
           %collecting the determined points and the corresponding values of the y function
           v(i)=x;
           g(i)=y(x);
       end
       i = i + 1;
       u = u + 1;
   end
end
%printing the result
z = (a+b)/2;
Z = ['Zero point is: ',num2str(z)];
disp(Z);
Z = ['Number of iterations is: ',num2str(u)];
disp(Z);

%to the plot because I previously used @ (x) in y
x = -4:1e-3:1;
y = 4*x.^3 + x.^2 + 2*x + 8;

%plotting
figure('Renderer', 'painters', 'Position', [10 10 600 700]) %size and position of the window with plots
tiledlayout(2,1) %specifying that there will be two graphs in one column


%upper plot
ax1 = nexttile; %mark of the first plot
plot(ax1,x,y,v,g,'r*');
title(ax1,'Graph of the entire function with marked points');
grid;
dim = [.5 .5 .3 .3]; %position of the box with text
str = {'Number of iterations is: ', num2str(u), 'Zero point is: ', num2str((a+b)/2)}; %string into box
annotation('textbox',dim,'String',str,'FitBoxToText','on'); %printing the textbox

%down plot
ax2 = nexttile; %mark of the second plot
plot(ax2,x,y,v,g,'r*');
title(ax2,'Zoom on the function in place of the density of points');
grid;
xlim([-1.6 -0.2]); %limitation of the x axis value 
ylim([-10 10]); %limitation of the y axis value 