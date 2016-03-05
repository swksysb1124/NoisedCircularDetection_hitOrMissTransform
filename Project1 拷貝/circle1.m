function square = circle1(radii)

for i=1:(2*radii+1)
    
    for j=1:(2*radii+1)
        if( ( i- (radii+1) )^2 + (j - (radii+1) )^2 > radii^2)
            square(i,j) = 0;
            
        else
            square(i,j) =1;
            
        end
    end
end

   