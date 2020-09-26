function dst = Zoom(PATH)
img = imread(PATH);
newIcon=javax.swing.ImageIcon('icon.jpg');
h=figure('NumberTitle', 'off', 'Name', '��ֵǰ'); %����һ��Figure������������
figFrame = get(h,'JavaFrame'); %ȡ��Figure��JavaFrame��
figFrame.setFigureIcon(newIcon); %�޸�ͼ��
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
h=figure('NumberTitle', 'off', 'Name', '��ֵ��'); %����һ��Figure������������
figFrame = get(h,'JavaFrame'); %ȡ��Figure��JavaFrame��
figFrame.setFigureIcon(newIcon); %�޸�ͼ��
imshow(dst);