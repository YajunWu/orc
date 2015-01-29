clc, close all, clear all

%���޼��
figure;
src_void=imread('E:\�������\��ҵ����\img\void1.jpg');
subplot(2,2,1);imshow(src_void);title('ԭͼ��');
[m_void,n_void,g_void]=size(src_void);
hu_void = imcrop(src_void,[20,100,n_void-40,m_void-200]);
subplot(2,2,2);imshow(hu_void);title('������');

imwrite(hu_void,'hu_void.jpg')
gray_void=rgb2gray(hu_void);
subplot(2,2,3);imshow(gray_void);title('�Ҷ�ͼ��');
threshold_void = graythresh(gray_void);
binary_void = ~im2bw(gray_void,threshold_void);
subplot(2,2,4);imshow(binary_void);title('��ֵͼ��');




%�㵹���
figure;
src_dao=imread('E:\�������\��ҵ����\img\dao2.jpg');
subplot(2,2,1);imshow(src_dao);title('ԭͼ��');
[m_dao,n_dao,g_dao]=size(src_dao);
hu_dao = imcrop(src_dao,[20,100,n_dao-40,m_dao-200]);
subplot(2,2,2);imshow(hu_dao);title('������');
imwrite(hu_dao,'hu_dao.jpg')

gray_dao=rgb2gray(hu_dao);
subplot(2,2,3);imshow(gray_dao);title('�Ҷ�ͼ��');
threshold_dao = graythresh(gray_dao);
binary_dao = ~im2bw(gray_dao,threshold_dao);
subplot(2,2,4);imshow(binary_dao);title('��ֵͼ��');



%�ߵ����
figure;
src_fan=imread('E:\�������\��ҵ����\img\fanxiang4.jpg');
subplot(2,2,1);imshow(src_fan);title('ԭͼ��');
[m_fan,n_fan,g_fan]=size(src_fan);
hu_fan = imcrop(src_fan,[20,100,n_fan-40,m_fan-200]);
subplot(2,2,2);imshow(hu_fan);title('������');


gray_fan=rgb2gray(hu_fan);
subplot(2,2,3);imshow(gray_fan);title('�Ҷ�ͼ��');
threshold_fan = graythresh(gray_fan);
binary_fan = ~im2bw(gray_fan,threshold_fan);
subplot(2,2,4);imshow(binary_fan);title('��ֵͼ��');



%�ϸ�
figure;
src_ok=imread('E:\�������\��ҵ����\img\zhengmian3.jpg');
subplot(2,2,1);imshow(src_ok);title('ԭͼ��');
[m_ok,n_ok,g_ok]=size(src_ok);
hu_ok = imcrop(src_ok,[20,100,n_ok-40,m_ok-200]);
subplot(2,2,2);imshow(hu_ok);title('������');


gray_ok=rgb2gray(hu_ok);
subplot(2,2,3);imshow(gray_ok);title('�Ҷ�ͼ��');
threshold_ok = graythresh(gray_ok);
binary_ok = ~im2bw(gray_ok,threshold_ok);
subplot(2,2,4);imshow(binary_ok);title('��ֵͼ��');



figure;
src=imread('E:\�������\��ҵ����\img\zhengmian3.jpg');
%src=imread('E:\�������\��ҵ����\img\fanxiang4.jpg');
%src=imread('E:\�������\��ҵ����\img\dao1.jpg');
%src=imread('E:\�������\��ҵ����\img\void.jpg');
[m,n]=size(src);
%ee=imadjust(src,[0.7 0.7 0.1;1 1 0.3],[0.6 0.6 0.8;0.8 0.8 1],[]);


subplot(2,2,1);imshow(src);title('ԭͼ��');
[m_ok,n_ok,g_ok]=size(src);
hu_ok = imcrop(src,[20,100,n_ok-40,m_ok-200]);
rectangle('Position',[20,110,n_ok-40,m_ok-220],'LineWidth',2,'EdgeColor','r');



[m_ok,n_ok,g_ok]=size(hu_ok);

hu_ok=imadjust(hu_ok,[0.3;0.7],[]);

for x=1:m_ok-1
    for y=1:n_ok-1
        if hu_ok(x,y,3)>(hu_ok(x,y,2)+12)&& hu_ok(x,y,3)>(hu_ok(x,y,1)+32)
            hu_ok(x,y,3)=0;
            hu_ok(x,y,2)=0;
            hu_ok(x,y,1)=0;
        end
    end
end

subplot(2,2,2);imshow(hu_ok);title('������');
gray_ok=rgb2gray(hu_ok);

subplot(2,2,3);imshow(gray_ok);title('�Ҷ�ͼ��');
threshold_ok = graythresh(gray_ok);
binary_ok = ~im2bw(gray_ok,threshold_ok);
subplot(2,2,4);imshow(binary_ok);title('��ֵͼ��');
figure;imshow(binary_ok);


figure;imshow(gray_ok);
K1=filter2(fspecial('average',7),gray_ok)/255;
threshold_ok = graythresh(K1);
binary_ok = ~im2bw(K1,threshold_ok);
figure;imshow(K1);
figure;imshow(binary_ok);

