function dst = Zoom(PATH)
img = imread(PATH);
newIcon=javax.swing.ImageIcon('icon.jpg');
h=figure('NumberTitle', 'off', 'Name', '插值前'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(img);
gray = rgb2gray(img);
imgInfo = size(gray);
height = imgInfo(1);
width = imgInfo(2);
n = 2;
dst = zeros(n*height-1,n*width-1,'uint8');
dst(:,:,1) = interp(img(:,:,1),n);%b
dst(:,:,2) = interp(img(:,:,2),n);%g
dst(:,:,3) = interp(img(:,:,3),n);%r
h=figure('NumberTitle', 'off', 'Name', '插值后'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(dst);