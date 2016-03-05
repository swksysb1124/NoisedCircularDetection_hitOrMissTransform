%%%%%%%%%%%%%%%%%%%   Function erosion1   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      implement erosion operation for input X by a structuring element
%
% Input Variables:
%      X       MxN input 2D gray-scale image to be complemented
%      SE      wm x wn structuring element
%      
% Returned Results:
%     Y        MxN output 2D gray-scale image after dilation
%
% Processing Flow:
%      1.  get the dimension of input image X and of structuring element SE
%      2.  Padding with zeros on the border of image X to avoid border
%          effect
%      3.  use find the coordinate of structing element and the central
%          point of SE is origin.
%      4.  For each coodinate of SE,
%             move image X to all the cooidnates as the central point of image
%             X is origing. 
%      5.  use AND operation to combine all moved image X to output Y
%      6.  cut out the padding area to get M X N output Y
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      findcoodi
%
%  Author:      WEI-KAI SU
%  Date:        01/30/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Y = erosion1 (X,SE)
[M N] = size(X); %image x's row = N
[wm wn] = size(SE);

% Process Structing Element
SE_coodi = findcoodi(SE);                   % find all the coordinate of the structuring elements

% set the coodinate of structuring element as the central point is origin
origin(1) = (wm+1)/2;
origin(2) = (wn+1)/2;
SE_coodi(:,1) = SE_coodi(:,1) - origin(1); 
SE_coodi(:,2) = SE_coodi(:,2) - origin(2);

Xtemp = ones(M+wm-1,N+wn-1);

for i = 1:size(SE_coodi(:,1))               % Structuring element's is stored as N by 2 array
    
    Xtemp1 = zeros(M+wm-1,N+wn-1);          % empty image X , the size is the same as Xtemp
    % (g1,g2) is coordinate
    g1 = SE_coodi(i,1) + (wm-1)/2;          % (wm-1)/2 is the radius of SE
    g2 = SE_coodi(i,2) + (wn-1)/2;          % IMAGE X SHOULD BE MOVED TO THE MIDDLE OF THE XTEMP 
    
    Xtemp1( g1+1:g1+M, g2+1:g2+N )= X;      % select location and put the image X
    Xtemp = Xtemp & Xtemp1;
end

Y = Xtemp((wm-1)/2+1:(wm-1)/2+M, (wn-1)/2+1:(wn-1)/2+N); % output only the original size of image X
        
