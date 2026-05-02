clear; clc; close all;

ROWS = 256;
COLS = 256;
TOTAL = ROWS * COLS;

% read input image
fid = fopen('image_input.txt', 'r');
input_data = fscanf(fid, '%x');
fclose(fid);

input_data = input_data(1:TOTAL);
img_in = uint8(reshape(input_data, [COLS ROWS])');

% helper function to read + reshape
read_image = @(filename) ...
    uint8(reshape( ...
        fscanf(fopen(filename,'r'),'%x'), ...
        [COLS ROWS])');

% read all outputs
img_seq      = read_image('image_output.txt');
img_parallel = read_image('image_output_parallel.txt');
img_sobel    = read_image('image_output_sobel.txt');

% improve display visibility
img_seq_disp      = imadjust(img_seq);
img_parallel_disp = imadjust(img_parallel);
img_sobel_disp    = imadjust(img_sobel);

% save all images
imwrite(img_in,            'input.png');
imwrite(img_seq,           'sequential_raw.png');
imwrite(img_parallel,      'parallel_raw.png');
imwrite(img_sobel,         'sobel_raw.png');

imwrite(img_seq_disp,      'sequential_display.png');
imwrite(img_parallel_disp, 'parallel_display.png');
imwrite(img_sobel_disp,    'sobel_display.png');

disp('saved all PNG outputs');

% display all images
figure('Name','Image Processing Comparison');

subplot(2,2,1);
imshow(img_in, []);
title('Input');

subplot(2,2,2);
imshow(img_seq_disp, []);
title('Sequential');

subplot(2,2,3);
imshow(img_parallel_disp, []);
title('Parallel (4-pixel)');

subplot(2,2,4);
imshow(img_sobel_disp, []);
title('Sobel Edge');

drawnow;
