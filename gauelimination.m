%solve the system of liner equation:
%3x1+4x2-2x3=2
%4x1+9x2-3x3=8
%-2x1-3x2+7x3=10
a=[3 4 -2 2 2
   4 9 -3 5 8
   -2 -3 7 6 10
    1 4 6 7 2 ];
%gauss elimination method
%m=number of rows
%n=number of columns
[m,n]=size(a);

for j=1:m-1
    for z=2:m
        if a(j,j)==0
            %swapping
            t=a(j,:);
            a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
%creating zero matrix
x=zeros(1,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c=c+a(s,k)*x(k);
    end
    x(s)=(a(s,n)-c)/a(s,s);
end
disp('Gauss Elimination method:');
a
x'
