clc;
clear;
close all;

%input data
%A = rand (3,3)
A = [ 3 4 0; 1 2 1; 0 2 6]
%b = rand (3,1)
b = [ 1; 0; 1]
x = zeros(length(A),1) %x vector filled with zeros
D = tril(A) %making a bottom triangular matrix from matrix A

%calculations
for i = 1:1:10000
    
   %------formula D*x = b - ((A - D)*x)---------% 
   g = b - ((A - D)*x); %calculation of a vector witch will be used to determinate x values
   C = [D g] %mergin vector with D matrix in order to put it into the Gauss method
   
   sizeC = size(C);
           
   x(1) = C(1,sizeC(2))/C(1,1);
   
   z = 0;
   
   for y = 2:sizeC(1)            
        
        z = z + 1;
        sum = 0;
        sum = sum + C(y,z)*x(z)
            
        x(y) = (C(y,sizeC(2)) - sum)/C(y,y)
   end
   
end
x