% this shows how to get gabor features

img_name = '5.png';
img = imread(img_name);
img_gray = rgb2gray(img);

nscale = 4;
norient = 6;
minWaveLength = 3;
mult = 1.7;
sigmaOnf = 0.65;
dThetaOnSigma = 1.3;
Lnorm = 0;
feedback = 1;

[EO, BP] = gaborconvolve(img_gray, nscale, norient, minWaveLength, mult, sigmaOnf, dThetaOnSigma, Lnorm, feedback);

size_bp = size(BP);
size_eo = size(EO);
% imshow(img);
% for r = 1:size_bp(1)
%     for c = 1:size_bp(2)
%         figure; 
%         imshow(BP{r,c}, []);
% %         imsave;
%     end
% end
for r = 1:size_eo(1)
    for c = 1:size_eo(2)
        figure; 
        imshow(EO{r,c}, []);
    end
end
% figure;
% for r = 1:size_bp(1)
%     for c = 1:size_bp(2)
%         subplot(2, 2, (r-1)*size_bp(2)+c);
%         imshow(BP{r,c}, []);
%     end
% end
% imsave;