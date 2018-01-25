% cluster superpixels according to their texture features

img_name = '7.png';

img = imread(img_name);
[labels, numlabels] = slicmex(img, 200, 20);

vectors = get_texture_vectors(img_name);

% use kmeans clustering method
[IDX, C, SUMD, D] = kmeans(vectors', 4, 'Replicates', 12);

seg_labels = IDX';

img_res = img;
s_img = size(img);
label_res = zeros(s_img(1), s_img(2));

% map the cluster labels to each pixel in the image
for r = 1:s_img(1)
    for c = 1:s_img(2)
        label_res(r,c) = seg_labels(labels(r,c)+1);
    end
end

% figure;
% imshow(label_res, []);
% label_res is the matrix we want

showSegmentResult(img, label_res);
