function Y = erosion1 (X,SE)
[M N] = size(X); %image x's row = N

% Process Structing Element
SE_coodi = findcoodi(SE); %find all the coordinate of the structuring elements

[wm wn] = size(SE);
origin(1) = (wm+1)/2;
origin(2) = (wn+1)/2;

SE_coodi(:,1) = SE_coodi(:,1) - origin(1); 
SE_coodi(:,2) = SE_coodi(:,2) - origin(2);

Xtemp = ones(M+wm-1,N+wn-1);

for i = 1:size(SE_coodi(:,1)) %Structuring element's is stored as N by 2 array
    
    Xtemp1 = zeros(M+wm-1,N+wn-1); %empty image X , the size is the same as Xtemp
    %(g1,g2) is coordinate
    g1 = SE_coodi(i,1) + (wm-1)/2;  %(wm-1)/2 is the radius of SE
    g2 = SE_coodi(i,2) + (wn-1)/2;  % IMAGE X SHOULD BE MOVED TO THE MIDDLE OF THE XTEMP 
    
    Xtemp1( g1+1:g1+M, g2+1:g2+N )= X;  %select location and put the image X
    Xtemp = Xtemp & Xtemp1;
end

Y = Xtemp((wm-1)/2+1:(wm-1)/2+M, (wn-1)/2+1:(wn-1)/2+N); %output only the original size of image X
        
