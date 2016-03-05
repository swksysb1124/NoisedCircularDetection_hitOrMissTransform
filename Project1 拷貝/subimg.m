function Y=subimg(X1,X2)
[M N]=size(X1);
for i=1:M
    for j=1:N
        Y(i,j)=X1(i,j)-X2(i,j);
    end
end