%%%%%%%%%%%%%%%%%%%%%%%    Function findcoodi    %%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      find coordinates of pixels with value bigger than zero
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be complemented
%      
% Returned Results:
%     coodi    Two-column matrix stored the coordinates of non-zero pixels.
%              ; the first column for x, the second for y.
%
% Processing Flow:
%      1.  get the dimension of input image X
%      2.  For each valid pixel,
%             if the value of pixels of the input image greater than zero, 
%             put the indexs of this pixel to coodi 
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
function coodi=findcoodi(f)
[M N]=size(f);  
k=1;
coodi(1,1)=0;
coodi(1,2)=0;
for i=1:M
    for j=1:N
        if( f(i,j) > 0 )
                coodi(k,1)=i;
                coodi(k,2)=j;
                k=k+1;
        end
    end
end