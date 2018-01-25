% extract color features of each superpixel regions in a image
% after using SLIC method
function color_vectors = get_color_vectors(img_name)

img = imread(img_name);
[labels, numlabels] = slicmex(img,200,20); % numlabels is the same as number of superpixels

r_sum = int32(zeros(1,numlabels));
g_sum = int32(zeros(1,numlabels));
b_sum = int32(zeros(1,numlabels));
n_sum = int32(zeros(1,numlabels));

[row, col, channel] = size(img);
for r = 1:row
    for c = 1:col
        r_sum(labels(r,c)+1) = r_sum(labels(r,c)+1) + int32(img(r,c,1));
        g_sum(labels(r,c)+1) = g_sum(labels(r,c)+1) + int32(img(r,c,2));
        b_sum(labels(r,c)+1) = b_sum(labels(r,c)+1) + int32(img(r,c,3));
        n_sum(labels(r,c)+1) = n_sum(labels(r,c)+1) + 1;
    end
end

r_avg = r_sum./n_sum;
g_avg = g_sum./n_sum;
b_avg = b_sum./n_sum;

im_res = zeros(size(img));

for r = 1:row
    for c = 1:col
        im_res(r,c,1) = r_avg(labels(r,c)+1);
        im_res(r,c,2) = g_avg(labels(r,c)+1);
        im_res(r,c,3) = b_avg(labels(r,c)+1);
    end
end

% figure;imshow(uint8(im_res(:,:,1)));
% figure;imshow(uint8(im_res(:,:,2)));
% figure;imshow(uint8(im_res(:,:,3)));
% imshow(uint8(im_res));

% compute the color feature vector for each region
color_vectors = double([r_avg; g_avg; b_avg]);
% this is the color feature vectors of all superpixel regions
res_max = max(color_vectors');
% normalize to [0, 1]
norm_res = color_vectors;
s_res = size(color_vectors);
for i = 1:s_res(1)
    norm_res(i,:) = norm_res(i,:)/res_max(i);
end
% norm_res contains the result vectors
color_vectors = norm_res;