

clc;
clear all;
close all;
fx = 'x-0.2*sin(x)-0.5';
%fx = 'exp(x) +sin(x)-2';
TOL = 0.001;

while(1)
    
    x0 = input('enter first value=');
    x1 = input('enter second value=');

        x = x0; fx1 = eval(fx);
        x = x1; fx2 = eval(fx);
        
if fx1*fx2 < 0
    disp('root lies between these interval');
    break;
end

disp('wrong interval, try again')

end

max1 = input('enter number of iteration=');


for i = 1:max1
    x = x0; fx0 = eval(fx)
    x = x1; fx1 = eval(fx)
    
    x2 = (x1 - fx1*((x0-x1)/(fx0-fx1)))
     
        x = x2; fx2 = eval(fx)

if abs(fx2)< TOL
   fprintf('root is %f',x2);
   break;
end

if fx1 * fx2 < 0
    x0 = x1;
    x1 = x2;
else 
    x1 = x2;
end
end
%i