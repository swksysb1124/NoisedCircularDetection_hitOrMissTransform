%%%%%%%%%%%%%%%%%%%%%%%   Function segen  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Create an window with a disk in the centor
%
% Input Variables:
%     radii   The radii of central disk in the window
%     wd      A vector stored the dimension of window
% 
% Returned Results:
%     SE        output 2D gray-scale image with the same of window
%
% Processing Flow:
%      1.  get the dimension of window from venter vd
%      2.  set central point of window as origin.
%      3.  create a disk with radii in the center.
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
function SE=segen(radii,wd)
M = wd(1);
N = wd(2);
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