function Pic = crop_objective_image(img, max_c_x, max_c_y, rad, size_p, boundary, degree)
    bw = im2bw(img, boundary);
    [m,n]=size(bw);
    Pic = [m,n];
    down_b_y = int32(max_c_y-rad*size_p)
    down_b_x = int32(max_c_x-rad*size_p)
    up_b_y = int32(max_c_y+rad*size_p)
    up_b_x = int32(max_c_x+rad*size_p)
    for i=down_b_x:up_b_x
        for j=down_b_y:up_b_y
            Pic(i-down_b_x+1,j-down_b_y+1) = bw(i,j);
        end
    end
    Pic = bwareaopen(Pic, degree);
end