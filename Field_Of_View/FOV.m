%% Load and Inicialize image 
clear all;
clc;
img = imread('1.jpg');  
img = rgb2gray(img);
bw = im2bw(img, 0.26);
bw = not(bw);
figure;
imshow(bw);

%% Filter image and Get edges
gaussianFilter = fspecial('gaussian',20, 10);
img_filted = imfilter(img, gaussianFilter,'symmetric');% Filted Image
filted_edges = edge(img_filted, 'Canny'); % Edges found in filted image

%% Find Circles (Use hough transform for circles)
[centers, radii] = find_circles(filted_edges, [45,48]);
hough_circles_draw(img, centers, radii);

%% Find Fittest Circle
[max_c_x, max_c_y, rad] = find_fittest_circle(centers, radii, bw);
hough_circles_draw(img, [max_c_x, max_c_y], rad);

%% Crop Objective Image
Pic = crop_objective_image(img, max_c_x, max_c_y, rad, 1, 0.26, 60);
figure;
imshow(Pic);

%% Calculate Rectangle
[S,s] = calcu_rect_FOV(Pic, img)

