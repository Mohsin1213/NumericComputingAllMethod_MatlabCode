
 clc
 clear all;

fx = '9*exp(-x)*sin(2*pi*x)';
 TOL = 0.001;

x0 = input('Enter first value of Interval=');
x1 = input('Enter second value of Interval=');

max1 = input('enter number of iteration=');


for i = 1:max1
    x = x0;
    fx0 = eval(fx)
    x = x1; 
    fx1 = eval(fx)
    
        x2 = (x1 - fx1*((x0-x1)/(fx0-fx1)))
        x = x2; 
        fx2 = eval(fx)

    if abs(fx2)< TOL
        fprintf('root is %f',x2);
        break;
    end

if abs(fx1) < abs(fx0)
    x0 = x1;
    x1 = x2;
else 
    x1 = x2;
end
end
