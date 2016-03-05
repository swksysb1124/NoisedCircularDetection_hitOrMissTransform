function SE=segen(radii,window)
M = window(1);
N = window(2);
center(1) = (1+M)/2;
center(2) = (1+N)/2;
for i=1:M
    for j=1:N
        if( (i-center(1))^2 + (j-center(2))^2 <= radii^2)
            SE(i,j)=1;
        else
            SE(i,j)=0;
        end
    end
end