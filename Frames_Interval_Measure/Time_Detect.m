clear;
reource_p_su=imread('guo.png');
reource_p_sr=imread('18.png');

videoObj = VideoReader('开机.avi');%读视频文件
nframes = get(videoObj, 'NumberOfFrames')%获取视频文件帧个数

begin = 10000;
endnum = 10000;
for k = 1 : nframes
    k
    currentFrame = read(videoObj, k);%读取第i帧
    reource_p=rgb2gray(currentFrame);
    bw = im2bw(reource_p);
    bw_sum = sum(sum(bw))
    if(bw_sum>13000 && bw_sum < 17000)
        if(begin>k)
            begin=k;
        else
            continue;
        end
        reource_p_sub=rgb2gray(reource_p_su);
        [m,n]=size(reource_p);
        [m0,n0]=size(reource_p_sub);
        result=zeros(m-m0+1,n-n0+1);
        vec_sub = double( reource_p_sub(:) );
        norm_sub = norm( vec_sub );
        for i=1:m-m0+1
            for j=1:n-n0+1
                subMatr=reource_p(i:i+m0-1,j:j+n0-1);
                vec=double( subMatr(:) );
                result(i,j)=vec'*vec_sub / (norm(vec)*norm_sub+eps);
            end
        end
        %找到最大相关位置
        if(max(result(:))>0.7)
            begin = k;
            [iMaxPos,jMaxPos]=find( result==max( result(:)));
            figure,
            subplot(121);imshow(reource_p_sub),title('匹配模板子图像');
            subplot(122);imshow(reource_p);title('标记出匹配区域的原图');
        else
            continue
        end
    elseif(bw_sum > 18000 && bw_sum < 30000)
        
        if(endnum>k)
            endnum=k;
        else
            continue;
        end
        reource_p_srb=rgb2gray(reource_p_sr);
        [m,n]=size(reource_p);
        [m0,n0]=size(reource_p_srb);
        result=zeros(m-m0+1,n-n0+1);
        vec_sub = double( reource_p_srb(:) );
        norm_sub = norm( vec_sub );
        for i=1:m-m0+1
            for j=1:n-n0+1
                subMatr=reource_p(i:i+m0-1,j:j+n0-1);
                vec=double( subMatr(:) );
                result(i,j)=vec'*vec_sub / (norm(vec)*norm_sub+eps);
            end
        end
        %找到最大相关位置
        if(max(result(:))>0.7)
            endnum=k
            [iMaxPos,jMaxPos]=find( result==max( result(:)));
            figure,
            subplot(121);imshow(reource_p_srb),title('匹配模板子图像');
            subplot(122);imshow(reource_p);title('标记出匹配区域的原图');
        else
            continue
        end
    else
        continue
    end
end

t = (endnum-begin)*1/25