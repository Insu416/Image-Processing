function [result_img] = dithering(img_path)

img = imread(img_path);
figure('Name', 'Original image', 'NumberTitle', 'off'); imshow(img);

[height, width, depth] = size(img);

D = [0 56; 84 28];

if depth==3
    D = cat(3, D, D, D);
end

r = repmat(D, ceil(height/2), ceil(width/2));

img = double(img);
q = floor(img/85);
img4 = q + (img-85*q > r(1:height, 1:width, :));
result_img = uint8(85*img4);

figure('Name', 'Dithering image', 'NumberTitle', 'off'); imshow(result_img);

end