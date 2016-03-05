function coodi=findcoodi(f)
[M N]=size(f);
k=1;
coodi(1,1)=0;
coodi(1,2)=0;
for i=1:M
    for j=1:M
        if( f(i,j) > 0 )
                coodi(k,1)=i;
                coodi(k,2)=j;
                k=k+1;
        end
    end
end