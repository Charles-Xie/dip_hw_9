% this script shows how to extract color-texture vectors
% containing the average of Gabor texture features and color features
% appended together

function vectors = get_color_texture_vectors(img_name)

color_vectors = get_color_vectors(img_name);

texture_vectors = get_texture_vectors(img_name);

% the result is already NORMALIZED
vectors = [color_vectors; texture_vectors];
