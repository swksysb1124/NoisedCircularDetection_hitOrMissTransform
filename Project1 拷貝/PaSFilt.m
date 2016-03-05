function Y = PaSFilt(X,w)
d1 = w(1);  % d1 & d2 should be odd 
d2 = w(2);
[M N]=size(X);
temp = zeros(M+d1-1,N+d2-1);
temp(d1/2:d1/2+M,d2/2:d2/2+N)=X;

for i=1:M+d1-1
    for j=1:N+d2-1
        