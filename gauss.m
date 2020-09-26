function dst = gauss(PATH)
img = imread(PATH);
newIcon=javax.swing.ImageIcon('icon.jpg');
h=figure('NumberTitle', 'off', 'Name', '滤波前'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(img);
imgInfo = size(img);
height = imgInfo(1);
width = imgInfo(2);
dst = zeros(height-4,width-4,3,'uint8');
dst(:,:,1) = channelgaussian(img(:,:,1));%b
dst(:,:,2) = channelgaussian(img(:,:,2));%g
dst(:,:,3) = channelgaussian(img(:,:,3));%r
h=figure('NumberTitle', 'off', 'Name', '滤波后'); %创建一个Figure，并返回其句柄
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
imshow(dst);