% cluster the image with individual pixel feature
% using color feature here

img_name = '7.png';

img = imread(img_name);

s_im = size(img);
% for each pixel in the image, the rgb value vector is its feature vector
% reshape it to an array
pixel_vectors_r = reshape(img(:,:,1)', [1, s_im(1) * s_im(2)]);
pixel_vectors_g = reshape(img(:,:,2)', [1, s_im(1) * s_im(2)]);
pixel_vectors_b = reshape(img(:,:,3)', [1, s_im(1) * s_im(2)]);

pixel_vectors = [pixel_vectors_r; pixel_vectors_g; pixel_vectors_b];

[IDX, C, SUMD, D] = kmeans(double(pixel_vectors'), 2, 'Replicates', 10);

pixel_labels = IDX';
% reshape it back
label_matrix = reshape(pixel_labels, [s_im(1), s_im(2)]);
% transpose to get the result
label_matrix = label_matrix';

showSegmentResult(img, label_matrix);
