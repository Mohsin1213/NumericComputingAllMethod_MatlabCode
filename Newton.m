
clc; clear all

TOL = 0.0001;

fx = 'exp(-x) +4*x^3 -5';
 dfx = diff(sym(fx))
x0 = input('enter first value='); 
max1 = input('enter number of iteration=');
for k =1:max1	
x = x0; fa= eval(fx);	
        dfa = eval(dfx);
  %  a = a+1;   
    x1= x0- (fa/dfa)
	
    x = x1; rfa = eval(fx)
    if abs(rfa)<TOL
        disp(x1); disp('this is root');
        break;
    end
	x0=x1;
end

