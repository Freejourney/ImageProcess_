function [S,s] = calcu_rect_FOV(Pic, img)
    columns_sum = sum(Pic);
    lines_sum = sum(Pic,2);

    [M,N]=size(img);
    total = M*N
    m = max(columns_sum)
    n = max(lines_sum)

    n=m*n %nΪ���ΰ���Ԫ����
    S=(2*M*atand(9/1200))/n %SΪ�����ӳ���
    s=(2*atand(9/1200))/n %sΪ����˲ʱ�ӳ���
end