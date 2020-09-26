function dst = autoduibi(img)
img = imread(PATH);
newIcon=javax.swing.ImageIcon('icon.jpg');
h=figure('NumberTitle', 'off', 'Name', '转换前'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(img);
gray = rgb2gray(img);
imgInfo = size(gray);
height = imgInfo(1);
width = imgInfo(2);
amean = 127;
dst = zeros(height,width,'uint8');
dst(:,:,1) = autodb(img(:,:,1),amean);%b
dst(:,:,2) = autodb(img(:,:,2),amean);%g
dst(:,:,3) = autodb(img(:,:,3),amean);%r
h=figure('NumberTitle', 'off', 'Name', '转换后'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(dst);