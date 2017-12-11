%solve the system of liner equation:
%3x1+4x2-2x3=2
%4x1+9x2-3x3=8
%-2x1-3x2+7x3=10



a=[3 4 -2 2 2
   4 9 -3 5 8
   -2 -3 7 6 10
    1 4 6 7 2 ];
[m,n]=size(a);
for j=1:m-1
    for z=2:m
        if a(j,j)==0
            %swapping
            t=a(1,:);
            a(1,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
disp(a);
for j=m:-1:2
    for i=j-1:-1:1
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end

for s=1:m
    a(s,:)=a(s,:)/a(s,s);
    x(s)=a(s,n);
end
disp('gauss-jordan method:');
a
x'