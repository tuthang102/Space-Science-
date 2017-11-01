% fucntion #1: Apply restrictions to data and output the position
% function #2: Give a matrix of variables satisfying conditions
% function #3: Give data set of variables with names 
% List of variables
%                        1.Date                         yyddd
%                        2.Time                         ms
%                        3.Orbit number
%                        4.Altitude                     km
%                        5.Latitude                     deg
%                        6.Longitude                    deg
%                        7.Local solar time             hr
%                        8.Local magnetic time          hr
%                        9.L Shell
%                        10.Invariant latitude           deg
%                        11.Solar zenith angle           deg
%         NACS N2   %    12.Density                      cm-3
%         NACS O    %    13.Density                      cm-3
%         NACS HE	     14.Density                      cm-3
%         NACS AR	     15.Density                      cm-3
%         NACS N         16.Density                      cm-3
%         WATS TN	%    17.Neutral temperature          K
%         WATS NVE  %    18.Eastward neutral wind        m/s
%         WATS NVU       19.Upward neutral wind          m/s
%         LANG NP	     20.Plasma density               cm-3
%         LANG TE	     21.Electron temperature         K
%         FPI  FWAV      22.Wavelength                   Angstrom
%         FPI  FALT      23.Tangent altitude             km
%         FPI  FVN       24.Northward neutral wind       m/s
%         FPI  FTEM      25.Neutral temperature          K
%         FPI  RAY       26.Intensity                    Raleighs
%         RPA  TI   %    27.Ion temperature              K
%         RPA  NI   %    28.Total ion density            cm-3
%         RPA  IVE  %    29.Eastward ion drift           m/s
%         RPA  IVN       30.Northward ion drift          m/s
%         RPA  IVU       31.Upward ion drift             m/s

% cond=input('Enter your region of interest:');
% pos=input('Enter the order paramaters from list as a vector:');


% Altitude_max,Latitude_min,MLT_min,MLT_max,Lshell_min,Lshell_max.
clear;clf
load('de2all.mat')

cond1=[450,30,18,21,4,8];
p1=data_filter(cond1); 


%%%%%%%%%%%%%%%%%%%%%%

pos1=[1,2,3,4,5,6,7,8,9,10,11,18,27,28,29]; % Enter variables from above list in an increasing order
defil1=variable_filter(p1,pos1); 
data_set1=addname(defil1,pos1);

figure(1) % Plot of Vn-Vi vs T_ion with density color coded
veldif1=defil1(:,12)-defil1(:,15);
subplot(2,1,1)
scatter(veldif1,defil1(:,13),100,defil1(:,14),'filled')
xlabel('Vn - Vi (m/s)')
ylabel('Ti (K)')
ylim([0 5000])
c=colorbar;
ylabel(c,'Ion density (cm^-3)')
set(gca,'fontsize',14)
% caxis([0 700000]) %set cmin cmax 
caxis auto
% v=caxis; % return cmin and cmax  
% xlim([-2000 1000]) % 3-9
xlim([-1000 2000]) % 15-21

subplot(2,1,2)
scatter(defil1(:,15),defil1(:,13),100,defil1(:,14),'filled')
xlabel('Vi (m/s)')
ylabel('Ti (K)')
ylim([0 5000])
c=colorbar;
ylabel(c,'Ion density (cm^-3)')
set(gca,'fontsize',14)
% caxis([0 500000]) %set cmin cmax 
caxis auto
% v=caxis; % return cmin and cmax 
% xlim([-1000 2000]) % 3-9
xlim([-2000 1000]) % 15-21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2) % Plot veldif1 vs ion vel and veldiff1 vs neutral vel
subplot(2,1,1)
plot(veldif1,defil1(:,14),'o')
ylabel('Vi (m/s)')
xlabel('Vn -Vi (m/s)')
set(gca,'fontsize',14)
% xlim([-2000 1000]); ylim([-1000 2000])% 3-9
xlim([-1000 2000]);ylim([-2000 1000]) % 15-21

subplot(2,1,2)
plot(veldif1,defil1(:,14),'o')
xlabel('Vn -Vi (m/s)')
ylabel('Vn (m/s)')
set(gca,'fontsize',14)
% xlim([-2000 1000]) % 3-9
xlim([-1000 2000]) % 15-21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(3) % Plot veldif vs L-shell and Ion vel vs L-shell
% subplot(2,1,1)
% plot(defil1(:,9),veldif1,'o')
% xlabel('L Shell')
% ylabel('Velocity difference (m/s)')
% set(gca,'fontsize',15)
% subplot(2,1,2)
% plot(defil1(:,9),defil1(:,15),'o')
% xlabel('L Shell')
% ylabel('Ion velocity (m/s)')
% set(gca,'fontsize',15)
% % ylim([-2000 1000]) % 3-9
% % ylim([-1000 2000]) % 15-21

%--------------------------------
pos2=[1,2,3,4,5,6,7,8,9,10,11,12,28];
defil2=variable_filter(p1,pos2); 
data_set2=addname(defil2,pos2);

% figure(4) % Plot density of ion vs neutral 
% 
% plot(defil2(:,12),defil2(:,13),'o')
% xlabel('N2 density (cm^-3)')
% ylabel('Ion density (cm^-3)')
% set(gca,'fontsize',15)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)

plot(defil1(:,12),defil1(:,15),'o')
xlabel('Vn (m/s)')
ylabel('Vi (m/s)')
hold on
% axis equal
% xlim([0 2000])
% ylim([0 2000])
set(gca,'fontsize',14)

% for n=1:5
%    saveas(n,sprintf('figure%d',n),'png')
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




















