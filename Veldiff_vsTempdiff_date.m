% Plot of Vedil vs Ti in 4 regions and Veldif vs Tempdif and Date
clear all
clf
load('de2all.mat')

% pos=[1,2,3,4,5,6,7,8,9,10,11,18,27,29]; % Vn Ti Vi


% cond1=[450,30,3,6,4,8];
% p1=data_filter(cond1); 
% defil1=variable_filter(p1,pos); 
% data_set1=addname(defil1,pos);
% 
% cond2=[450,30,6,9,4,8];
% p2=data_filter(cond2); 
% defil2=variable_filter(p2,pos); 
% 
% 
% cond3=[450,30,15,18,4,8];
% p3=data_filter(cond3); 
% defil3=variable_filter(p3,pos); 
% 
% 
% cond4=[450,30,18,21,4,8];
% p4=data_filter(cond4); 
% defil4=variable_filter(p4,pos); 
% 
% veldif1=defil1(:,14)-defil1(:,12);
% veldif2=defil2(:,14)-defil2(:,12);
% veldif3=defil3(:,12)-defil3(:,14);
% veldif4=defil4(:,12)-defil4(:,14);
% 
% figure(1)
% 
% subplot(2,2,1)
% plot(veldif1,defil1(:,13),'o')
% xlabel('Vi-Vn (m/s)')
% ylabel('Ti (K)')
% set(gca,'fontsize',14)
% title('3-6 region')
% xlim([-1000 2000])
% ylim([0 5000])
% 
% 
% subplot(2,2,2)
% plot(veldif2,defil2(:,13),'o')
% xlabel('Vi-Vn (m/s)')
% ylabel('Ti (K)')
% set(gca,'fontsize',14)
% title('6-9 region')
% xlim([-1000 2000])
% ylim([0 8000])
% 
% 
% subplot(2,2,3)
% plot(veldif3,defil3(:,13),'o')
% xlabel('Vn-Vi (m/s)')
% ylabel('Ti (K)')
% set(gca,'fontsize',14)
% title('15-18 region')
% xlim([-1000 2000])
% ylim([0 8000])
% 
% subplot(2,2,4)
% plot(veldif4,defil4(:,13),'o')
% xlabel('Vn-Vi (m/s)')
% ylabel('Ti (K)')
% set(gca,'fontsize',14)
% title('18-21 region')
% xlim([-1000 2000])
% ylim([0 8000])

% Plot Veldfil vs Ti-Tn
pos1=[1,2,3,4,5,6,7,8,9,10,11,17,18,27,29];


cond5=[450,30,3,6,4,8];
p1=data_filter(cond5); 
defil5=variable_filter(p1,pos1); 

cond6=[450,30,6,9,4,8];
p6=data_filter(cond6); 
defil6=variable_filter(p6,pos1); 


cond7=[450,30,15,18,4,8];
p7=data_filter(cond7); 
defil7=variable_filter(p7,pos1); 


cond8=[450,30,18,21,4,8];
p8=data_filter(cond8); 
defil8=variable_filter(p8,pos1); 

veldif5=-defil5(:,13)+defil5(:,15);
veldif6=-defil6(:,13)+defil6(:,15);
veldif7=defil7(:,13)-defil7(:,15);
veldif8=defil8(:,13)-defil8(:,15);

tempdif5=abs(defil5(:,12)-defil5(:,14));
tempdif6=abs(defil6(:,12)-defil6(:,14));
tempdif7=abs(defil7(:,12)-defil7(:,14));
tempdif8=abs(defil8(:,12)-defil8(:,14));

m5=[veldif5,tempdif5]; % create a new maxtrix with veldif and tempdif
m6=[veldif6,tempdif6];
m7=[veldif7,tempdif7];
m8=[veldif8,tempdif8];

p5=zeros(length(m5),1);
p6=zeros(length(m6),1);
p7=zeros(length(m7),1);
p8=zeros(length(m8),1);

% Filter out points >1500
for i=1:length(m5)
    if m5(i,2)<1500
        p5(i,1)=i;
    end
  
end
for i=1:length(m6)
    if m6(i,2)<1500
        p6(i,1)=i;
    end
   
end
for i=1:length(m7)
    if m7(i,2)<1500
        p7(i,1)=i;
    end
   
end
for i=1:length(m7)
    if m7(i,2)<1500
        p7(i,1)=i;
    end
   
end
for i=1:length(m8)
    if m8(i,2)<1500
        p8(i,1)=i;
    end
   
end
 p5=p5(p5>0);
 p6=p6(p6>0);
 p7=p7(p7>0);
 p8=p8(p8>0);
 
m5n=[m5(p5,1),m5(p5,2)];
m6n=[m6(p6,1),m6(p6,2)];
m7n=[m7(p7,1),m7(p7,2)];
m8n=[m8(p8,1),m8(p8,2)];

m5x=m5(p5,1); % these are values < 1500 
m6x=m6(p6,1);
m7x=m7(p7,1);
m8x=m8(p8,1);


m5y=m5(p5,2); % these are values < 1500 
m6y=m6(p6,2);
m7y=m7(p7,2);
m8y=m8(p8,2);

% Date/Time/MLT/Altitude/Latitude Plots


figure(3)
subplot(2,1,1)
hold on
plot(defil5(:,1),defil5(:,15),'bo')
plot(defil6(:,1),defil6(:,15),'r*')
plot(defil7(:,1),defil7(:,15),'gx')
plot(defil8(:,1),defil8(:,15),'kd')
xlabel('Date (yyddd)')
ylabel('Vi (m/s)')
legend('3-6 region','6-9 region','15-18 region','18-21 region')
set(gca,'fontsize',14)
subplot(2,1,2)
plot(de2all(:,1),de2all(:,29),'o')


figure(4)
hold on
plot(defil5(:,7),defil5(:,15),'bo')
plot(defil6(:,7),defil6(:,15),'r*')
plot(defil7(:,7),defil7(:,15),'gx')
plot(defil8(:,7),defil8(:,15),'kd')
xlabel('Local Solar Time (hr)')
ylabel('Vi (m/s)')
legend('3-6 region','6-9 region','15-18 region','18-21 region')
set(gca,'fontsize',14)
% 
% figure(5)
% hold on
% plot(defil5(:,8),defil5(:,15),'bo')
% plot(defil6(:,8),defil6(:,15),'r*')
% plot(defil7(:,8),defil7(:,15),'gx')
% plot(defil8(:,8),defil8(:,15),'kd')
% xlabel('MLT (hr)')
% ylabel('Vi (m/s)')
% legend('3-6 region','6-9 region','15-18 region','18-21 region')
% set(gca,'fontsize',14)
% 
% figure(6)
% hold on
% plot(defil5(:,4),defil5(:,15),'bo')
% plot(defil6(:,4),defil6(:,15),'r*')
% plot(defil7(:,4),defil7(:,15),'gx')
% plot(defil8(:,4),defil8(:,15),'kd')
% xlabel('Altitude (Km)')
% ylabel('Vi (m/s)')
% legend('3-6 region','6-9 region','15-18 region','18-21 region')
% set(gca,'fontsize',14)
% 
% figure(7) 
% hold on
% plot(defil5(:,5),defil5(:,15),'bo')
% plot(defil6(:,5),defil6(:,15),'r*')
% plot(defil7(:,5),defil7(:,15),'gx')
% plot(defil8(:,5),defil8(:,15),'kd')
% xlabel('Latitude (degree)')
% ylabel('Vi (m/s)')
% legend('3-6 region','6-9 region','15-18 region','18-21 region')
% set(gca,'fontsize',14)
% 
% %%%%%%%%%%%%%%%%%%%%

data_set1=addname(defil5,pos1);


