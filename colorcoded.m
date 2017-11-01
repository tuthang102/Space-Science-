% Altitude_max,Latitude_min,MLT_min,MLT_max,Lshell_min,Lshell_max.
clear;clf
load('de2all.mat')

cond1=[450,30,6,9,4,8];
p1=data_filter(cond1); 


%%%%%%%%%%%%%%%%%%%%%%

pos1=[1,2,3,4,5,6,7,8,9,10,11,18,27,28,29]; % Enter variables from above list in an increasing order
defil1=variable_filter(p1,pos1); 
data_set1=addname(defil1,pos1);

figure(1) % Plot of |v-u| vs T_ion with density color coded
veldif1=defil1(:,12)-defil1(:,15);
subplot(2,1,1)
scatter(veldif1,defil1(:,13),100,defil1(:,14),'filled')
xlabel('Velocity difference (m/s)')
ylabel('Tion (K)')
ylim([0 5000])
c=colorbar;
ylabel(c,'Ion density (cm^-3)')
set(gca,'fontsize',15)
% caxis([0 700000]) %set cmin cmax 
caxis auto
% v=caxis; % return cmin and cmax  

subplot(2,1,2)
scatter(defil1(:,15),defil1(:,13),100,defil1(:,14),'filled')
xlabel('Eastward ion velocity (m/s)')
ylabel('Tion (K)')
ylim([0 5000])
c=colorbar;
ylabel(c,'Ion density (cm^-3)')
set(gca,'fontsize',15)
% caxis([0 500000]) %set cmin cmax 
caxis auto
% v=caxis; % return cmin and cmax 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2) % Plot veldif1 vs ion vel and veldiff1 vs neutral vel
subplot(2,1,1)
plot(veldif1,defil1(:,15),'o')
ylabel('Eastward ion velocity (m/s)')
xlabel('Velocity difference (m/s)')
set(gca,'fontsize',12)
xlim([-2000 1000])
ylim([-1000 2000])
subplot(2,1,2)
plot(veldif1,defil1(:,12),'o')
xlabel('Velocity difference (m/s)')
ylabel('Eastward neutral velocity (m/s)')
set(gca,'fontsize',12)
