function [center_x_1, center_y_1] = find_center_pixel(Pic)
    flag = 0;
    [m,n] = size(Pic)
    left_up_x = 0;
    left_up_y = 0;
    for i=1:1:m/2
        for j=1:1:n/2
            if (Pic(i,j)==1||Pic(i+1,j)==1||Pic(i,j+1)==1||Pic(i+1,j+1)==1)
                left_up_x = i;
                left_up_y = j;
                flag = 1;
                break;
            end
        end
        if (flag == 1)
            break;
        end
    end
    flag = 0;
    right_up_x = 0;
    right_up_y = 0;
    for i=1:1:m/2
        for j=n:-1:n/2
            if (Pic(i,j)==1||Pic(i+1,j)==1||Pic(i,j-1)==1||Pic(i+1,j-1)==1)
                right_up_x = j;
                right_up_y = i;
                flag = 1;
                break;
            end
        end
        if (flag == 1)
            break;
        end
    end
    flag = 0;
    right_down_x = 0;
    right_down_y = 0;
    for i=m:-1:m/2
        for j=n:-1:n/2
            if (Pic(i,j)==1||Pic(i-1,j)==1||Pic(i,j-1)==1||Pic(i-1,j-1)==1)
                right_down_x = j;
                right_down_y = i;
                flag = 1;
                break;
            end
        end
        if (flag == 1)
            break;
        end
    end
    flag = 0;
    left_down_x = 0;
    left_down_y = 0;
    for i=m:-1:m/2
        for j=1:1:n/2
            if (Pic(i,j)==1||Pic(i-1,j)==1||Pic(i,j+1)==1||Pic(i-1,j+1)==1)
                left_down_x = j;
                left_down_y = i;
                flag = 1;
                break;
            end
        end
        if (flag == 1)
            break;
        end
    end

    center_x_1 = (left_down_x+right_up_x+left_up_x+right_down_x)/4;
    center_y_1 = (left_down_y+right_up_y+left_up_y+right_down_y)/4;
end
