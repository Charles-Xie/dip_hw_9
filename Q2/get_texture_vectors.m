% this script shows how to extract texture feature vectors
% containing the average of Gabor texture features
function texture_vectors = get_texture_vectors(img_name)

img = imread(img_name);
% get the superpixel regions
[labels, numlabels] = slicmex(img,200,20); % numlabels is the same as number of superpixels
% showSegmentResult(img, labels);
% convert to gray scale image
img_gray = rgb2gray(img);

% parameters
nscale = 4;
norient = 4;
minWaveLength = 3;   % 3 suggested
mult = 1.7;
sigmaOnf = 0.65;   % 0.65 suggested
dThetaOnSigma = 1.3;
Lnorm = 0;
feedback = 0;

[EO, BP] = gaborconvolve(img_gray, nscale, norient, minWaveLength, mult, sigmaOnf, dThetaOnSigma, Lnorm, feedback);

% imshow(EO{1,1},[]);

% EO:gabor texture features, size = nscale*norient, each cell is a gabor
% texture feature of one orientation and one scale
s_bp = size(BP);
s_eo = size(EO);
numvalues = s_eo(1)*s_eo(2);
% caculate the average 

% get sum first
eo_res = zeros(numvalues, numlabels);
gabor_features = reshape(EO', [1, numvalues]);

num_in_superpixel = zeros(1,numlabels);
s = size(img_gray);
for r = 1:s(1)
    for c = 1:s(2)
        num_in_superpixel(labels(r,c)+1) = num_in_superpixel(labels(r,c)+1) + 1;
    end
end        

for nv = 1:numvalues
    feature = gabor_features{nv};
    s = size(feature);
    for r = 1:s(1)
        for c = 1:s(2)
            eo_res(nv, labels(r,c)+1) = eo_res(nv, labels(r,c)+1) + feature(r,c);
        end
    end
    eo_res(nv,:) = eo_res(nv,:)./num_in_superpixel;
end

% imshow(eo_res, []);
% get abs
abs_res = abs(eo_res);
% get max
res_max = max(abs_res');
% normalize to [0, 1]
norm_res = abs_res;
s_res = size(abs_res);
for i = 1:s_res(1)
    norm_res(i,:) = norm_res(i,:)/res_max(i);
end
texture_vectors = norm_res;