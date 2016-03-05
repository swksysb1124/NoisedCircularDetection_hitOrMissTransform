%%
%  This project is mainly focus on applying the hit-or-miss transform to detect three middle-
%  size disks. The given binary-valued image considers WHITE to be background and
%  BLACK to be foreground and with ve dierent sized black disks scattered around. 
% 
%  The objectives of this project 1 are listed as follows:
%  1. Remove the 10% level of salt-and-pepper noise.
%  2. Threshold the input image to convert to a truly binary-valued image.
%  3. Design an appropriate hit-or-miss transform 
%%
clc; clear;
f=imread('RandomDisks-P10.jpg');        %input a image as a matrix
figure('name','Original image'),imshow(f);
title('Original image');
%%
% Convert to grayscale
f = uint16(f);                          % allow f can be larger number
X = (f(:,:,1) + f(:,:,2) + f(:,:,3))/3; % X is a grey-level image
X = uint8(X);
%%
%  Pepper-and-Salt-Noise filtering 
%  Method 1: using median filtering
% Y = medianFilt(X,[3 3]);    % should be defined by ourselves %[5 5] is local window %purpose: separate
% figure('name','After median filtering'), imshow(Y);
% title('After median filtering');
% Y=threholdv(Y,200);         % choose 200 as threshod value for thresholding
% figure('name','After thresholding after median filtering'), imshow(Y);
% title('After thresholding after median filtering');

%%
% Method 2: using close / open method
% The procedure is as follow:
% 1. thresholding grayscale image to binary image.
%    Then, because by choosing a propriate threshold value, holes in disks
%    will disappear and remain pepper noise.
% 2. create an small disk ,O, which slightly bigger than pepper as structuring element
% 3. implement opening method to remove small detail (pepper-noise)
Y=threholdv(X,200);                     % choose 200 as threshod value for thresholding
figure('name','After thresholding from original image'), imshow(Y);
title('After thresholding from original image');
% O = segen(1,[3 3]);                     % choose a O slightly bigger than pepper
% Y = dilation1(Y,O);                     % implement opening method: 1. dilation the image by O
% Y = erosion1(Y,O);                      %                           2. erosion the image by O
% figure('name','Aftering opening'), imshow(Y);
% title('After opening');
%%
% For convinence of computaton, we inverse the value of pixels, that is
% grey level 255 means 0, and grey level 0 means 255

Y=clm(Y);               % inverse the value of pixels; clm.m is a function to implement complement of Y
figure('name','Inverse value for computation'), imshow(Y);      
title('Inverse value for computation');
%%
% Oberserving disks dimention   
% We need to create proper sizes of disks as structuring element, 
% so we use impixelinfor to show the coodinates in the image and observe
% and report the radius of disks in in the image
impixelinfo;            
%%

% select the second smallest disk as structring element 
SE = segen(11,[23 23]);                 % generate a disk with radii 11 as struturing element,SE
SE = sym1(SE);                          % Symmetry of SE

% erosion of Y by structuring element SE
Y_subSE = erosion1(Y,SE);               % Y erosiong by SE
figure('name','erosiong by disks (radii 11)'),imshow(Y_subSE);
title('erosiong by disks (radii 11)');
%%
% erosion of the complement of Y by structuring element W-A'
Yc = clm(Y);
SE1 = segen(15, [31 31]);               % [27 27] is the dimension of W and the radii of A' is 13
W_A = sym1(SE1);                        % W-A' 
W_A = clm(W_A);                         % Symmetry of W-A' 

% erosion of the complement of Y by structuring element W-A'
Yc_subW_A = erosion1(Yc,W_A);           % Yc erosion by W-A'
figure('name','erosiong by hole(radii 15),window(31 X 31)'),imshow(Yc_subW_A);
title('erosiong by hole(radii 15),window(31 X 31)');
%%
Y_ress = Y_subSE & Yc_subW_A;           % use hit-and-miss method to detect the central point of selected disks
figure('name','central points of second smallest disks'),imshow(Y_ress);
title('central points of second smallest disks');
%%

%  select the middle disk as structring element 
SE=segen(21,[43 43]);                   % generate a disk with radii 21 as struturing element,SE
SE=sym1(SE);

% erosion of Y by structuring element SE
Y_subSE = erosion1(Y,SE);              % Y erosiong by the symmatry of SE
figure('name','erosiong by disks (radii 21)'),imshow(Y_subSE);
title('erosiong by disks (radii 21)');
%%
% erosion of the complement of Y by structuring element W-A'
Yc=clm(Y);
SE1=segen(23,[48 48]);                  % [48 48] is the dimension of W and the radii of A' is 23
W_A = sym1(SE1);                        % W-A' 
W_A = clm(W_A);                         % Symmetry of W-A' 

% erosion of the complement of Y by structuring element W-A'
Yc_subW_A = erosion1(Yc,W_A);            % Yc erosion by W-A'
figure('name','erosiong by hole(radii 23),window(48 X 48)'),imshow(Yc_subW_A);
title('erosiong by hole(radii 23),window(48 X 48)');
%%
Y_rem = Y_subSE & Yc_subW_A;             % use hit-and-miss method to detect the central point of selected disks
figure('name','central points of middle disks'),imshow(Y_rem);
title('central points of middle disks');
%%

% select the second biggest disk as structring element  
SE=segen(28,[57 57]);                   % generate a disk with radii 21 as struturing element,SE
SE=sym1(SE);

% erosion of Y by structuring element SE
Y_subSE = erosion1(Y,SE);               % Y erosiong by the symmatry of SE
figure('name','erosiong by disks (radii 28)'),imshow(Y_subSE);
title('erosiong by disks (radii 28)');
%%
% erosion of the complement of Y by structuring element W-A
Yc=clm(Y);
SE1=segen(31,[65 65]);                  % [65 65] is the dimension of W and the radii of A' is 31
W_A = sym1(SE1);                        % W-A' 
W_A = clm(W_A);                         % Symmetry of W-A' 

% erosion of the complement of Y by structuring element W-A'
Yc_subW_A = erosion1(Yc,W_A);            % Yc erosion by W-A'
figure('name','erosiong by hole(radii 31),window(65 X 65)'),imshow(Yc_subW_A);
title('erosiong by hole(radii 31),window(65 X 65)');
%%
Y_resb = Y_subSE & Yc_subW_A;            % use hit-and-miss method to detect the central point of selected disks
figure('name','central points of sencond biggest disks'),imshow(Y_resb);
title('central points of sencond biggest disks');
%%
%  Final result 
Y_final = Y_ress | ( Y_rem | Y_resb);      % combine central points of three middle-size disks in the same image
Y_final = dilation1( Y_final,segen(2,[5 5]));   % In order to let the central points more apparent, dilation these points a little
figure('name','central points of three middle-disks'),imshow(Y_final);
title('central points of three middle-disks');
%%
pointcoordi = findcoodi(Y_final);
X_final=X;
% mark the central points on the original image
for i=1:size(pointcoordi(:,1))
   X_final( pointcoordi(i,1) , pointcoordi(i,2) ) = 255;
end
figure('name','final result'),imshow(X_final);
title('final result');
    

