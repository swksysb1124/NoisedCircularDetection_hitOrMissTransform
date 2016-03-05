%%%%%%%%%%%%%%%%%%%%%%%   Function threholdv   %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     compute thresholding to make image X be a binary image
%
% Input Variables:
%     X       MxN input 2D gray-scale image to be complemented
%     value   threshold vale: above this value, set pixel to 255; below
%             this value, set pixel to 0;
% 
% Returned Results:
%     Y        MxN output 2D binary image 
% 
% Processing Flow:
%      1.  get the dimension of image X
%      2.  For each valid pixel,
%           if the pixels is above threshold value, set pixel to 255; below
%           this value, set pixel to 0;        
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