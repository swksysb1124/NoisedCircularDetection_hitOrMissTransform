%%%%%%%%%%%%%%%%%%%%%%     Function clm    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute the complement of the input imagea
%
% Input Variables:
%      X       MxN input 2D gray-scale image to be complemented
%      
% Returned Results:
%     complement     the complemental image of input image 
%
% Processing Flow:
%      1.  get the dimension of input image X
%      2.  For each valid pixel,
%             if the value of pixels of the input image greater than zero, 
%             set these value to one in the same positon in output image.
%             ; Other case, set to zero in output image.
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      none
%
%  Author:      WEI-KAI SU
%  Date:        01/28/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function complement = clm(X)
[M N]= size(X);
for i=1:M
    for j=1:N
        if (X(i,j)>0)
            complement(i,j)=0;
        else
            complement(i,j)=1;
        end
    end
end