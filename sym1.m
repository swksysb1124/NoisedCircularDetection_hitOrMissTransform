%%%%%%%%%%%%%%%%%%%%%%%   Function sym1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      implement symmetry operation for input X with the central point as
%      origin
%
% Input Variables:
%      X       MxN input 2D gray-scale image to be complemented
%      
% Returned Results:
%     Y        MxN output 2D gray-scale image after dilation
%
% Processing Flow:
%      1.  get the dimension of input image X and of structuring element SE
%      2.  set central point of X as origin.
%      3.  For each pixel in X
%             move the pixels to the symmetry locaitons of origin.
% 
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      none
%
%  Author:      WEI-KAI SU
%  Date:        01/30/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Y=sym1(X)
[M N]=size(X); % M : column #
ox = (M+1)/2;
oy = (N+1)/2;
for i=1:M
    for j=1:N
        Y(2*ox-i,2*oy-j)=X(i,j);
    end
end