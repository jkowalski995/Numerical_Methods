clc;
clear;
close all;

%input data
%A = rand (3,3)
A = [ 3 4 0; 1 2 1; 0 2 6]
%b = rand (3,1)
b = [ 1; 0; 1]
x = zeros(length(A),1) %x vector filled with zeros
I = eye(size(A)) %identity mtrix

%calculations
D_invA = inv(diag(diag(A))) %creating an inverse matrix with values only on the diagonal

for i = 1:1:1000
   x = ((I - (D_invA*A))*x) + (D_invA*b) %calculation of vector x
end
