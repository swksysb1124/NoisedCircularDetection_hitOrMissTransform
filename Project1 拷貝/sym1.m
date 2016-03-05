function Y=sym1(X)
[M N]=size(X); % M : column #
ox = (M+1)/2;
oy = (N+1)/2;
for i=1:M
    for j=1:N
        Y(2*ox-i,2*oy-j)=X(i,j);
    end
end