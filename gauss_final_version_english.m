clc;
clear;
close all;

%starting data
A = [2 1 5 -1.5 1; 5 3 2 4 3; -2 3 2 -4 -2; 4.5 3 5 2 8; 1 2.5 3 4 5]
B = [1.7 47.3 -46.4 34.95 22.1];

BT = B.'; %transformation of B matrix to prepare it to calculations
C = [A BT];
sizeA = size(C);
z = sizeA(1);
v = 1;

%zerosing down left part of matrix
while z > 1
for y = (v+1):sizeA(1)
       
        for i = v:length(C)
        
            W2(i) = C(y,i); %taking row from matrix C
            W1(i) = C(v,i); %taking row from matrix C
      
            multiplier = (W2(v))/(W1(v)); %determination of the multiplier for reduction
            W1p(i)= W1(i)*multiplier; %multiplication of the row for row substraction
            W1sub(i) = W2(i) - W1p(i); %row substraction
             
        end
        
        C(y,:) = W1sub; %replacement of row from C matrix with new row (result of row substraction)
    
end
    W2 = zeros(size(W2)); %clearing of vector W2
    W1 = zeros(size(W1)); %clearing of vector W1
    v = v + 1;
    z = z - 1;
end
C %prompting the matrix C - after calculations

%calculation value of searched unknowns
n = sizeA(2) - 1;

while n > 0
    
    b = 0; %for sum calculating loop
    for_sum = sizeA(2) - 1; %for sum calculating loop
    
    if n == (sizeA(2) - 1)
        %done only one time at the begginig, after the everytime else statement is done
        X(n) = C(sizeA(1),sizeA(2))/C(sizeA(1),n); %calculating a value of the last unknown
    else
        a = C(n, sizeA(2)); %taking a value from additional column (last column)
        
        %sum calculation loop
        while for_sum > 0              
                
            b = b + (C(n,for_sum) * X(for_sum)); %sum calculation
            for_sum = for_sum - 1;  
        
        end
        
        d = C(n,n); %divider
        X(n) = (a - b)/d; %calculation of value of searched n-th variable
       
    end
    
    n = n - 1;
    
end
X.' %prompting value af calculated variables
