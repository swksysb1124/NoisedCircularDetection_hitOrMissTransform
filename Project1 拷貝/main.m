clc; clear;
f=imread('RandomDisks-P10.jpg');  %f is array
figure,imshow(f);

%Convert to grayscale
% f = uint16(f); % since the original class of f is unit8, we should transfer the class to 
% X = (f(:,:,1) + f(:,:,2) + f(:,:,3))/3; % X is a grey-level image
X = rgb2gray(f);

% remove pepper-and-salt noise
Y=medfilt2(X,[5 5]);  % should be defined by ourselves %[5 5] is local window %purpose: separate
figure, imshow(Y);

% set a thresholding value to get a binary image
Y=threholdv(Y,200);
figure, imshow(Y);

% For convinence of computaton, we inverse the value of pixels, that is
% grey level 255 means 0, and grey level 0 means 1 

Y=clm(Y); % inverse the value of pixels
figure, imtool(Y);

% SE=segen(21,[43 43]);
% SE=segen(28,[57 57]);
SE=segen(11,[23 23]);
SE=sym1(SE);

% erosion of Y by structuring element SE
Y1=erosion1(Y,SE);
figure,imshow(Y1);

Yc=clm(Y);

% SE1=segen(23,[48 48]);
% SE1=segen(31,[65 65]);
SE1=segen(15, [33 33]); % [33 33] is the dimension of W
SE1=sym1(SE1);
W_A=clm(SE1);   % W-A 

% erosion of the complement of Y by structuring element W-A
Y2=erosion1(Yc,W_A);
figure,imshow(Y2);
Y_final = Y1 & Y2;
figure,imshow(Y_final);


