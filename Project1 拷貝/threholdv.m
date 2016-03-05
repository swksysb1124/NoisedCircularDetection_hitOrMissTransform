function Y=threholdv(X,value)
[M N]=size(X);
for i=1:M
    for j=1:N
        if( X(i,j) >= value)
            Y(i,j)=255;
        else
            Y(i,j)=0;
        end
    end
end