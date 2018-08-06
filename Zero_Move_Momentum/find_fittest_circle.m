function [max_c_x, max_c_y, rad] = find_fittest_circle(centers, radii, bw)
    max_c_x = centers(1,1);
    max_c_y = centers(1,2);
    max_sum = 0;
    rad = 0
    [m,n] = size(centers);
    sum_t = 0;
    for k=1:m
        d_b_x = int32(centers(k,2)-radii(k));
        d_b_y = int32(centers(k,1)-radii(k));
        u_b_x = int32(centers(k,2)+radii(k));
        u_b_y = int32(centers(k,1)+radii(k));
        if (d_b_x < 0 || d_b_y < 0 || u_b_x > 640 || u_b_y > 480)
            continue;
        end
        for i=d_b_y:u_b_y
            for j=d_b_x:u_b_x
                sum_t = sum_t + bw(i,j);
                if (sum_t > max_sum)
                    max_sum = sum_t;
                    max_c_x = centers(k,1);
                    max_c_y = centers(k,2);
                    rad = radii(k);
                end
            end
        end
        sum_t = 0;
    end
end