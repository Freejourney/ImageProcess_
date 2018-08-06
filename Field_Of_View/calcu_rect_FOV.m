function [S,s] = calcu_rect_FOV(Pic, img)
    columns_sum = sum(Pic);
    lines_sum = sum(Pic,2);

    [M,N]=size(img);
    total = M*N
    m = max(columns_sum)
    n = max(lines_sum)

    n=m*n %n为方形靶像元个数
    S=(2*M*atand(9/1200))/n %S为所求视场角
    s=(2*atand(9/1200))/n %s为所求瞬时视场角
end