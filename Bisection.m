 clc; clear all;
% ------ Input Area -------
TOL = 0.0001;
%fx = 'exp(x)-x^2+3*x-2';
%fx = 'x*cos(x)- 2*x^2 + 3*x - 1';
%fx = 'exp(x) - x^2 +3*x -2';
%fx = 'x^3 + x -3'
% fx = 'cos(x) - 1.3*x';
 fx = 'exp(-x) +4*x^3 - 5';
%fx = 'log10(x) – cos(x)'

while(1)
    
    a = input('enter first value=');
    b = input('enter second value=');

        x = a; fx1 = eval(fx);
        x = b; fx2 = eval(fx);
        
if fx1*fx2 < 0
    disp('root lies between these interval');
break;
end

disp('wrong interval, try again')

end

max1 = input('enter number of iteration=');

%----- Bisection Method --------- 
%x = a; fa = eval(fx);
%x = b; fb = eval(fx);

for i=1:max1
   
    x=b;fb=eval(fx);
    x=a;fa=eval(fx);

    p = (a+b)/2
    %disp(p)    
    x = p;
    fp = eval(fx)
  
  if abs(fp) < TOL
      disp(p); disp('this is root');
      break;
  end
  
   if fp*fa <0
        b=p;
       
    else
        a=p;
        
   end
end