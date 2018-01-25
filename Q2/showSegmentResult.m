% FUNCTION
% USAGE: show the segmented image with segmentation boundaries

function showSegmentResult(img, labels)

% figure;
% imshow(labels, []);

% edge detector
filter = [0 1 0; 1 -4 1; 0 1 0];

labels_16 = uint16(labels);
% convolution to get the boudaries
filt_res = imfilter(labels_16, filter, 'replicate');
[r_num, c_num] = size(filt_res);

for r = 1:r_num
    for c = 1:c_num
        if filt_res(r,c) ~= 0
            filt_res(r,c) = 1;
        else
            filt_res(r,c) = 0;
        end
    end
end

% figure;
% subplot(131);
% imshow(img);
% title('original');
% 
% subplot(132);
% imshow(filt_res, []);
% title('segmentation');

im_region = img;
for r = 1:r_num
    for c = 1:c_num
        if filt_res(r,c) == 1
%             make the boudaries to be white line
            im_region(r,c,1) = 255;
            im_region(r,c,2) = 255;
            im_region(r,c,3) = 255;
            if c > 1
                im_region(r,c-1,1) = 0;
                im_region(r,c-1,2) = 0;
                im_region(r,c-1,3) = 0;
            end
            if c > 2
                im_region(r,c-2,1) = 0;
                im_region(r,c-2,2) = 0;
                im_region(r,c-2,3) = 0;
            end
            if c > 3
                im_region(r,c-3,1) = 0;
                im_region(r,c-3,2) = 0;
                im_region(r,c-3,3) = 0;
            end
            if c < c_num
                im_region(r,c+1,1) = 0;
                im_region(r,c+1,2) = 0;
                im_region(r,c+1,3) = 0;
            if c < c_num-1
                im_region(r,c+2,1) = 0;
                im_region(r,c+2,2) = 0;
                im_region(r,c+2,3) = 0;
            end
            if c < c_num-2
                im_region(r,c+3,1) = 0;
                im_region(r,c+3,2) = 0;
                im_region(r,c+3,3) = 0;
            end
            end
        end
    end
end

% subplot(133);
% imshow(im_region);
% title('superpixels');

% % show boundaries
% figure;
% imshow(filt_res, []);

figure;
% subplot(111);
imshow(im_region);
% title('segmentation detail');