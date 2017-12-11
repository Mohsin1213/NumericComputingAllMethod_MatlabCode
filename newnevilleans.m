%function p = newnevilleans(x, f, xnick)

clc

x=[ 10.1, 22.2, 32.0, 41.6, 50.5];
f=[ 0.17537, 0.37784, 0.52992, 0.66393, 0.63608];
xnick=27.5;

n = length(x);

for k = n-1:-1:1
f(1:k) = f(2:k+1) + ...
( xnick - x(n-k+1:n) ) ./ ...
( x(n-k+1:n) - x(1:k) ) .* ...
( f(2:k+1) - f(1:k) );

end

p = f(1);
disp(p);