clear; clc; close all;

ROWS = 256;
COLS = 256;

% read image
img = imread('moon.png');

% convert to grayscale
if size(img, 3) == 3
    img = rgb2gray(img);
end

% resize for hardware
img = imresize(img, [ROWS COLS]);

% improve contrast slightly
img = imadjust(img);

% show image
figure;
imshow(img);
title('Hardware input image');

% save png
imwrite(img, 'hardware_input.png');
disp('Saved hardware png');

% write to Verilog file
fid = fopen('image_input.txt', 'w');

if fid == -1
    error('Could not open');
end

for r = 1:ROWS
    for c = 1:COLS
        fprintf(fid, '%02X\n', img(r,c));
    end
end

fclose(fid);

disp('Input image created');
