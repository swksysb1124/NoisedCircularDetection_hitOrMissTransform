%%%%%%%%%%%%%%%%%%%%%   Function medianFilt   %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      median filtering
%
% Input Variables:
%      X       MxN input 2D gray-scale image to be complemented
%      w       d1xd2 local window for median filtering
% Returned Results:
%      Y       MxN output 2D gray-scale image after median filtering
%
% Processing Flow:
%      1.  get the dimension of input image X and of local window w
%      2.  Padding with zero on the borders of the image X
%      3.  For each valid pixel (not including padding region),
%            find the median of the pixels within local windows centered by
%            the point we scan. Then, replace the value of scan point with
%            median
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      median
%
%  Author:      WEI-KAI SU
%  Date:        01/28/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Y = medianFilt(X,w)
d1 = w(1);  % d1 & d2 should be odd 
d2 = w(2);
[M N]=size(X);  % get the dimension of input X

temp = zeros( M + d1-1,N + d2-1);           
temp(1 + (d1-1)/2 : M + (d1-1)/2,1 + (d2-1)/2 : N + (d2-1)/2) = X;

for i = 1 + (d1-1)/2 : M + (d1-1)/2
    for j = 1 + (d2-1)/2 : N + (d2-1)/2

        t=1;
        for k = -1*(d1-1)/2: (d1-1)/2
            for l = -1*(d2-1)/2: (d2-1)/2
                templist(t) = temp(i + k,j + l);
                t=t+1;
            end
        end
        
        Y(i,j) = median(templist);
    end
end
Y=Y(1 + (d1-1)/2 : M + (d1-1)/2,1 + (d2-1)/2 : N + (d2-1)/2);
Y=uint8(Y);


