% Plot of Veldiff vs Lattitude 

clear
load('de2all.mat')
pos=[1,2,3,4,5,6,7,8,9,10,11,18,29]; % Vn Vi


cond1=[450,30,3,6,4,8];
p1=data_filter(cond1); 
defil1=variable_filter(p1,pos); 
data_set1=addname(defil1,pos);

cond2=[450,30,6,9,4,8];
p2=data_filter(cond2); 
defil2=variable_filter(p2,pos); 


cond3=[450,30,15,18,4,8];
p3=data_filter(cond3); 
defil3=variable_filter(p3,pos); 


cond4=[450,30,18,21,4,8];
p4=data_filter(cond4); 
defil4=variable_filter(p4,pos); 

veldif1=defil1(:,13)-defil1(:,12); % velocity diff
veldif2=defil2(:,13)-defil2(:,12);
veldif3=-defil3(:,12)+defil3(:,13);
veldif4=-defil4(:,12)+defil4(:,13);

x1=defil1(:,5); % latitude
x2=defil2(:,5); 
x3=defil3(:,5);
x4=defil4(:,5);
% Vdiff         Vn             Vi
yd1=veldif1; yn1=defil1(:,12); yi1=defil1(:,13); 
yd2=veldif2; yn2=defil2(:,12); yi2=defil2(:,13);
yd3=veldif3; yn3=defil3(:,12); yi3=defil3(:,13);
yd4=veldif4; yn4=defil4(:,12); yi4=defil4(:,13);

yyd1 = smooth(x1,yd1,100,'lowess'); yyi1 =smooth(x1,yi1,100,'lowess'); yyn1=smooth(x1,yn1,100,'lowess');
yyd2 = smooth(x2,yd2,100,'lowess'); yyi2 =smooth(x2,yi2,100,'lowess'); yyn2=smooth(x2,yn2,100,'lowess');
yyd3 = smooth(x3,yd3,100,'lowess'); yyi3 =smooth(x3,yi3,100,'lowess'); yyn3=smooth(x3,yn3,100,'lowess');
yyd4 = smooth(x4,yd4,100,'lowess'); yyi4 =smooth(x4,yi4,100,'lowess'); yyn4=smooth(x4,yn4,100,'lowess');

[xxd1,id1] = sort(x1); [xxi1,ii1]=sort(x1); [xxn1,in1]=sort(x1); % sort data
[xxd2,id2] = sort(x2); [xxi2,ii2]=sort(x2); [xxn2,in2]=sort(x2);
[xxd3,id3] = sort(x3); [xxi3,ii3]=sort(x3); [xxn3,in3]=sort(x3);
[xxd4,id4] = sort(x4); [xxi4,ii4]=sort(x4); [xxn4,in4]=sort(x4);




figure(1)

subplot(3,1,1) %Vdiff plot
plot(xxd1,yd1(id1),'b.',xxd1,yyd1(id1),'r-')
ylim([-200 1000])

subplot(3,1,2) % Vion plot
plot(xxi1,yi1(ii1),'b.',xxi1,yyi1(ii1),'r-')
ylim([-200 1000])

subplot(3,1,3) % Vneutral plot
plot(xxn1,yn1(in1),'b.',xxn1,yyn1(in1),'r-')
ylim([-200 1000])

figure(2)
subplot(3,1,1) %Vdiff plot
plot(xxd2,yd2(id2),'b.',xxd2,yyd2(id2),'r-')
ylim([-200 1000])

subplot(3,1,2) % Vion plot
plot(xxi2,yi2(ii2),'b.',xxi2,yyi2(ii2),'r-')
ylim([-200 1000])

subplot(3,1,3) % Vneutral plot
plot(xxn2,yn2(in2),'b.',xxn2,yyn2(in2),'r-')
ylim([-200 1000])


figure(3)
subplot(3,1,1) %Vdiff plot
plot(xxd3,yd3(id3),'b.',xxd3,yyd3(id3),'r-')
ylim([-1000 200])

subplot(3,1,2) % Vion plot
plot(xxi3,yi3(ii3),'b.',xxi3,yyi3(ii3),'r-')
ylim([-1000 200])

subplot(3,1,3) % Vneutral plot
plot(xxn3,yn3(in3),'b.',xxn3,yyn3(in3),'r-')
ylim([-1000 200])

figure(4)
subplot(3,1,1) %Vdiff plot
plot(xxd4,yd4(id4),'b.',xxd4,yyd4(id4),'r-')
ylim([-1000 200])

subplot(3,1,2) % Vion plot
plot(xxi4,yi4(ii4),'b.',xxi4,yyi4(ii4),'r-')
ylim([-1000 200])

subplot(3,1,3) % Vneutral plot
plot(xxn4,yn4(in4),'b.',xxn4,yyn4(in4),'r-')
ylim([-1000 200])



% figure(1)
% 
% subplot(2,2,1)
% plot(defil1(:,5),veldif1,'o')
% title('3-6 region')
% xlabel('Latitude (deg)')
% ylabel('Vi-Vn (m/s)')
% 
% subplot(2,2,2)
% plot(defil2(:,5),veldif2,'o')
% title('6-9 region')
% xlabel('Latitude (deg)')
% ylabel('Vi-Vn (m/s)')
% 
% subplot(2,2,3)
% plot(defil3(:,5),veldif3,'o')
% title('15-18 region')
% xlabel('Latitude (deg)')
% ylabel('Vn-Vi (m/s)')
% 
% subplot(2,2,4)
% plot(defil4(:,5),veldif4,'o')
% title('18-21 region')
% xlabel('Latitude (deg)')
% ylabel('Vn-Vi (m/s)')
