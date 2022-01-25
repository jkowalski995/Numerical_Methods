clc;
clear;
close all;
%number_bin_final = [1:32];
a = input('Enter number to convert: ');

%sign
if a > 0
    sign = 0;
else
    sign = 1;
end
sign

%converting number to 1.something
power=0;
if a > 0
    while a>=2
        a = a/2;
        power = power + 1;
    end
else
    while a<=(-2)
        a = a/2;
        power = power + 1;
    end
end
a
power

%calculation fo the exponent
exponent = power + 127;

%converting exponent to bin
bin = [];
i = 1;
while exponent > 0
        bin(i) = mod(exponent,2);
        exponent = exponent/2;
        exponent = fix(exponent);
        i = i + 1;
end
bin

result = [];
c = length(bin);
z = length(bin);

for i = 1:c
    result(z) = bin(i);
    z = z - 1;
end
result

%calculation of the mantissa
if a > 0
    mantissa = a - 1;
else
    mantissa = (a * (-1))- 1;
end

fraction = [1:23];

for i = 1:23
mantissa = mantissa * 2;
    if mantissa < 1
        fraction(i) = 0;
    else
        fraction(i) = 1;
        mantissa = mantissa - 1;
    end

end
fraction

%putting everything toghether into float
%sign
float = [];
float(1) = sign;
%exponent
o = 1;
for w = 2:9
   float(w) = result(o);
   o = o + 1;
end
%mantissa
p = 1;
for m = 10:(length(fraction)+9)
   float(m) = fraction(p);
   p = p + 1;
end
float

