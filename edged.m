function imggray = edged(name)%边缘提取
img = imread(name);
newIcon=javax.swing.ImageIcon('icon.jpg');
h=figure('NumberTitle', 'off', 'Name', '原图'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(img);
imggray = rgb2gray(img);%转换为灰度图像
imgsize = size(imggray);
height = imgsize(1);
width = imgsize(2);
a = [0,0,0;0,0,0;0,0,0];
bx = [1,2,1;0,0,0;-1,-2,-1];%x方向梯度计算矩阵
by = [1,0,-1;2,0,-2;1,0,-1];%y方向梯度计算矩阵
grad = zeros(imgsize(1)-2,imgsize(2)-2,'uint8');%梯度图像预分配
for i = 1:height-2
    for j = 1:width-2
        for m =1:3
            for n =1:3
                a(m,n) = imggray(i+m-1,j+n-1);
            end
        end
        gx = a(1)*bx(1)+a(2)*bx(2)+a(3)*bx(3)+a(4)*bx(4)+a(5)*bx(5)+a(6)*bx(6);
        gy = a(1)*by(1)+a(3)*by(3)+a(4)*by(4)+a(6)*by(6)+a(7)*by(7)+a(9)*by(9);
        grad(i,j) = sqrt(gx*gx+gy*gy);
    end
end
meanedge = mean(grad(:));%梯度平均值
for i = 1:height-2%梯度图像二义化
    for j = 1:width-2
        if grad(i,j) > meanedge
            imggray(i,j) = 255;
        else
            imggray(i,j) = 0;
        end
    end
end
[test,num,edge,imggray] = noisedelete(imggray);%降噪处理
h=figure('NumberTitle', 'off', 'Name', '边缘'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(imggray);