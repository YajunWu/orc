clc, close all, clear all


ok=imread('E:\�������\��ҵ����\code\img\hu_zhengmian.jpg');
zhengmian = imread('E:\�������\��ҵ����\code\img\hu_ok_zengqiang.jpg');
dao = imread('E:\�������\��ҵ����\code\img\hu_dao.jpg');
fanxiang = imread('E:\�������\��ҵ����\code\img\hu_fanxiang.jpg');

disp('=================����=================')
r1=WyjMatch(ok,zhengmian);
figure;imshow(r1.img);hold on
disp(r1.img)
for i=1:r1.pipei
    plot([r1.pos1(i,2) r1.pos2(i,2)+r1.width]',[r1.pos1(i,1) r1.pos2(i,1)]','-');
    plot([r1.pos1(i,2) r1.pos2(i,2)+r1.width]',[r1.pos1(i,1) r1.pos2(i,1)]','o');
end
zheng=r1.zheng/r1.key;
fan=r1.fan/r1.key;
if r1.pipei/r1.key>0.2 
    if zheng>0.6 && fan<0.2
        disp('����')
    else if zheng<0.05 && fan>0.05
            disp('�ߵ�')
        else
            disp('δ֪���')
        end
    end
else if zheng<0.3 && fan<0.1
        disp('�㵹');
    else
        disp('δ֪���')
    end
end

disp('=================�ߵ�=================')
r2=WyjMatch(ok,fanxiang);
if r2.pipei>0.2 
    if r2.zheng>0.6 && r2.fan<0.2
        disp('����');
    else if r2.zheng<0.05 && r2.fan>0.05
            disp('�ߵ�')
        else
            disp('δ֪���')
        end
    end
else if r2.zheng<0.3 && r2.fan<0.1
        disp('�㵹');
    else
        disp('δ֪���')
    end
end

disp('=================�㵹=================')
WyjMatch(ok,dao);
%{
I=imread('E:\�������\��ҵ����\code\hu_zhengmian.jpg');
 % Set this option to true if you want to see more information
   Options.verbose=false; 
   Options.init_sample=10;
 % Get the Key Points
   Ipts=OpenSurf(I,Options);
 % Draw points on the image
   PaintSURF(I, Ipts);
%}