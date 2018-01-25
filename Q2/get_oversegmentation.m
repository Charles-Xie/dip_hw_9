% oversegment the image into superpixels

img = imread('7.png');
[labels, numlabels] = slicmex(img,200,10); % numlabels is the same as number of superpixels

% call the custom function to show image with segmentation boundaries
showSegmentResult(img, labels);
