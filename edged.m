function imggray = edged(name)%��Ե��ȡ
img = imread(name);
newIcon=javax.swing.ImageIcon('icon.jpg');
h=figure('NumberTitle', 'off', 'Name', 'ԭͼ'); %����һ��Figure������������
figFrame = get(h,'JavaFrame'); %ȡ��Figure��JavaFrame��
figFrame.setFigureIcon(newIcon); %�޸�ͼ��
imshow(img);
imggray = rgb2gray(img);%ת��Ϊ�Ҷ�ͼ��
imgsize = size(imggray);
height = imgsize(1);
width = imgsize(2);
a = [0,0,0;0,0,0;0,0,0];
bx = [1,2,1;0,0,0;-1,-2,-1];%x�����ݶȼ������
by = [1,0,-1;2,0,-2;1,0,-1];%y�����ݶȼ������
grad = zeros(imgsize(1)-2,imgsize(2)-2,'uint8');%�ݶ�ͼ��Ԥ����
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
meanedge = mean(grad(:));%�ݶ�ƽ��ֵ
for i = 1:height-2%�ݶ�ͼ����廯
    for j = 1:width-2
        if grad(i,j) > meanedge
            imggray(i,j) = 255;
        else
            imggray(i,j) = 0;
        end
    end
end
[test,num,edge,imggray] = noisedelete(imggray);%���봦��
h=figure('NumberTitle', 'off', 'Name', '��Ե'); %����һ��Figure������������
figFrame = get(h,'JavaFrame'); %ȡ��Figure��JavaFrame��
figFrame.setFigureIcon(newIcon); %�޸�ͼ��
imshow(imggray);