%% Load and Inicialize image 
clear all;
clc;
Before_img = imread('5.jpg'); 
After_img = imread('4.jpg');
Before_img = rgb2gray(Before_img);
After_img = rgb2gray(After_img);
Before_bw = im2bw(Before_img, 0.26);
After_bw = im2bw(After_img, 0.26);
Before_bw = not(Before_bw);
After_bw = not(After_bw);
figure;
imshow(Before_bw);
figure;
imshow(After_bw);
%% Filter image and Get edges
gaussianFilter = fspecial('gaussian',20, 10);
Before_img_filted = imfilter(Before_img, gaussianFilter,'symmetric');
After_img_filted = imfilter(After_img, gaussianFilter,'symmetric');
Before_filted_edges = edge(Before_img_filted, 'Canny');
After_filted_edges = edge(After_img_filted, 'Canny');

%% Find Circles (Use hough transform for circles)
[centers, radii] = find_circles(Before_filted_edges, [45,48]);
[centers_2, radii_2] = find_circles(After_filted_edges, [45,48]);
hough_circles_draw(Before_img, centers, radii);
hough_circles_draw(After_img, centers, radii);
%% Find Fittest Circle
[max_c_x, max_c_y, rad] = find_fittest_circle(centers, radii, Before_bw);
hough_circles_draw(Before_img, [max_c_x, max_c_y], rad);
[max_c_x_2, max_c_y_2, rad_2] = find_fittest_circle(centers_2, radii_2, After_bw);
hough_circles_draw(After_img, [max_c_x_2, max_c_y_2], rad_2);

%% Crop Objective Image
Before_Pic = crop_objective_image(Before_img, max_c_x, max_c_y, rad, 0.7, 0.215, 60);
figure;
imshow(Before_Pic);title('Before_Pic');
After_Pic = crop_objective_image(After_img, max_c_x_2, max_c_y_2, rad, 0.7, 0.193, 60);
figure;
imshow(After_Pic);title('After_Pic');

%% Get One Pixel (I use four corners to calculate the center pixel coordinate)
[center_x1, center_y1] = find_center_pixel(Before_Pic);
[center_x2, center_y2] = find_center_pixel(After_Pic);

center_x1,center_y1,center_x2,center_y2
change_x = center_x2-center_x1
change_y = center_y2-center_y1