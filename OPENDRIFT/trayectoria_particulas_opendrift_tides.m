%Obtencion de indices de las simualciones de opendrift

% clear all
% close all
% clc
% 
% addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
% dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'
%file1= [dir 'mosa_VM_1mes_horario_back_AS_27-31Enero.nc']
% file2= [dir 'mosa_VM_1mes_horario_back_AS_22-26Enero.nc']
% file3=[dir 'mosa_VM_1mes_horario_back_AS_17-21Enero.nc']
% file4=[dir 'mosa_VM_1mes_horario_back_AS_12-16Enero.nc']
% file5=[dir 'mosa_VM_1mes_horario_back_AS_07-11Enero.nc']
% file6=[dir 'mosa_VM_1mes_horario_back_AS_01-06Enero.nc']


% lon1=ncread([file1],'lon');
% lat1=ncread([file1],'lat');
% z1=ncread([file1],'z');


% lon2=ncread([file2],'lon');
% lat2=ncread([file2],'lat');
% z2=ncread([file2],'z');


% lon3=ncread([file3],'lon');
% lat3=ncread([file3],'lat');
% z3=ncread([file3],'z');

% lon4=ncread([file4],'lon');
% lat4=ncread([file4],'lat');
% z4=ncread([file4],'z');


% lon5=ncread([file5],'lon');
% lat5=ncread([file5],'lat');
% z5=ncread([file5],'z');

% lon6=ncread([file6],'lon');
% lat6=ncread([file6],'lat');
% z6=ncread([file6],'z');

%Calculo de indice entre 27-31

%   lat1(find(lat1>0))=NaN;
%   lon1(find(lon1>0))=NaN;
% 
%   ind_nor01=find((lat1(841,:)>-43.5) & (lon1(841,:)<-74.0)); %Norte
%   ind_sur01=find((lat1(841,:)<-43.5) & (lon1(841,:)<-74.0));%Sur
%   ind_in_mic01=find((lat1(841,:)>-43.5) & (lon1(841,:)>-74.0));%MIC
%   ind_in_fior01=find((lat1(841,:)<-43.5) & (lon1(841,:)>-74.0));%Fiordos
% 
%   
%   figure()
%   subplot(221)
%   plot(lon1(end,ind_nor01),lat1(end,ind_nor01),'o')
%   subplot(222)
%   plot(lon1(end,ind_sur01),lat1(end,ind_sur01),'o')
%   subplot(223)
%   plot(lon1(end,ind_in_mic01),lat1(end,ind_in_mic01),'o')
%   subplot(224)
%   plot(lon1(end,ind_in_fior01),lat1(end,ind_in_fior01),'o')
    
%   
%   final=length(ind_nor01)+length(ind_sur01)+length(ind_in_mic01)+length(ind_in_fior01)
%   inicial=length(z1)
%   perdidas=final-inicial 
%   
%   save('ind_nor01.mat','ind_nor01');
%   save('ind_sur01.mat','ind_sur01');
%   save('ind_in_mic01.mat','ind_in_mic01');
%   save('ind_in_fior01.mat','ind_in_fior01');
%   save('lon1.mat','lon1');
%   save('lat1.mat','lat1');
%   save('z1.mat','z1');
  
%Calculo de indice entre 22-26  

% lat2(find(lat2>0))=NaN;
% lon2(find(lon2>0))=NaN;
%   
%   ind_nor02=find((lat2(841,:)>-43.5) & (lon2(841,:)<-74)); %Norte
%   ind_sur02=find((lat2(841,:)<-43.5) & (lon2(841,:)<-74));%Sur
%   ind_in_mic02=find((lat2(841,:)>-43.5) & (lon2(841,:)>-74));%MIC
%   ind_in_fior02=find((lat2(841,:)<-43.5) & (lon2(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor02)+length(ind_sur02)+length(ind_in_mic02)+length(ind_in_fior02)
%   inicial=length(z2)
%   perdidas=final-inicial
%   
%   save('ind_nor02.mat','ind_nor02');
%   save('ind_sur02.mat','ind_sur02');
%   save('ind_in_mic02.mat','ind_in_mic02');
%   save('ind_in_fior02.mat','ind_in_fior02');
%   save('lon2.mat','lon2');
%   save('lat2.mat','lat2');
%   save('z2.mat','z2');
%   
%   
%   figure()
%   subplot(221)
%   plot(lon2(end,ind_nor02),lat2(end,ind_nor02),'o')
%   subplot(222)
%   plot(lon2(end,ind_sur02),lat2(end,ind_sur02),'o')
%   subplot(223)
%   plot(lon2(end,ind_in_mic02),lat2(end,ind_in_mic02),'o')
%   subplot(224)
%   plot(lon2(end,ind_in_fior02),lat2(end,ind_in_fior02),'o')

  

%Calculo de indice entre 17-21 

%  lat3(find(lat3>0))=NaN;
%  lon3(find(lon3>0))=NaN;
%   
%   ind_nor03=find((lat3(841,:)>-43.5) & (lon3(841,:)<-74)); %Norte
%   ind_sur03=find((lat3(841,:)<-43.5) & (lon3(841,:)<-74));%Sur
%   ind_in_mic03=find((lat3(841,:)>-43.5) & (lon3(841,:)>-74));%MIC
%   ind_in_fior03=find((lat3(841,:)<-43.5) & (lon3(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor03)+length(ind_sur03)+length(ind_in_mic03)+length(ind_in_fior03)
%   inicial=length(z3)
%   perdidas=final-inicial
%   
%   save('ind_nor03.mat','ind_nor03');
%   save('ind_sur03.mat','ind_sur03');
%   save('ind_in_mic03.mat','ind_in_mic03');
%   save('ind_in_fior03.mat','ind_in_fior03');  
%   save('lon3.mat','lon3');
%   save('lat3.mat','lat3');
%   save('z3.mat','z3');
%  
%   figure()
%   subplot(221)
%   plot(lon3(end,ind_nor03),lat3(end,ind_nor03),'o')
%   subplot(222)
%   plot(lon3(end,ind_sur03),lat3(end,ind_sur03),'o')
%   subplot(223)
%   plot(lon3(end,ind_in_mic03),lat3(end,ind_in_mic03),'o')
%   subplot(224)
%   plot(lon3(end,ind_in_fior03),lat3(end,ind_in_fior03),'o')
%   
%   
%Calculo de indice entre 12-16
% 
%   lat4(find(lat4>0))=NaN;
%   lon4(find(lon4>0))=NaN;
%   
%   ind_nor04=find((lat4(841,:)>-43.5) & (lon4(841,:)<-74)); %Norte
%   ind_sur04=find((lat4(841,:)<-43.5) & (lon4(841,:)<-74));%Sur
%   ind_in_mic04=find((lat4(841,:)>-43.5) & (lon4(841,:)>-74));%MIC
%   ind_in_fior04=find((lat4(841,:)<-43.5) & (lon4(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor04)+length(ind_sur04)+length(ind_in_mic04)+length(ind_in_fior04)
%   inicial=length(z4)
%   perdidas=final-inicial
%   
%   save('ind_nor04.mat','ind_nor04');
%   save('ind_sur04.mat','ind_sur04');
%   save('ind_in_mic04.mat','ind_in_mic04');
%   save('ind_in_fior04.mat','ind_in_fior04');    
%   save('lon4.mat','lon4');
%   save('lat4.mat','lat4');
%   save('z4.mat','z4');
% 
%   figure()
%   subplot(221)
%   plot(lon4(end,ind_nor04),lat4(end,ind_nor04),'o')
%   subplot(222)
%   plot(lon4(end,ind_sur04),lat4(end,ind_sur04),'o')
%   subplot(223)
%   plot(lon4(end,ind_in_mic04),lat4(end,ind_in_mic04),'o')
%   subplot(224)
%   plot(lon4(end,ind_in_fior04),lat4(end,ind_in_fior04),'o')


%Calculo de indice entre 07-11

%   lat5(find(lat5>0))=NaN;
%   lon5(find(lon5>0))=NaN;
%  
%   ind_nor05=find((lat5(841,:)>-43.5) & (lon5(841,:)<-74)); %Norte
%   ind_sur05=find((lat5(841,:)<-43.5) & (lon5(841,:)<-74));%Sur
%   ind_in_mic05=find((lat5(841,:)>-43.5) & (lon5(841,:)>-74));%MIC
%   ind_in_fior05=find((lat5(841,:)<-43.5) & (lon5(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor05)+length(ind_sur05)+length(ind_in_mic05)+length(ind_in_fior05)
%   inicial=length(z5)
%   perdidas=final-inicial
%   
%   save('ind_nor05.mat','ind_nor05');
%   save('ind_sur05.mat','ind_sur05');
%   save('ind_in_mic05.mat','ind_in_mic05');
%   save('ind_in_fior05.mat','ind_in_fior05');
%   save('lon5.mat','lon5');
%   save('lat5.mat','lat5');
%   save('z5.mat','z5');
%    
%   figure()
%   subplot(221)
%   plot(lon5(end,ind_nor05),lat5(end,ind_nor05),'o')
%   subplot(222)
%   plot(lon5(end,ind_sur05),lat5(end,ind_sur05),'o')
%   subplot(223)
%   plot(lon5(end,ind_in_mic05),lat5(end,ind_in_mic05),'o')
%   subplot(224)
%   plot(lon5(end,ind_in_fior05),lat5(end,ind_in_fior05),'o')
%   
  
%Calculo de indice entre 01-06

%   lat6(find(lat6>0))=NaN;
%   lon6(find(lon6>0))=NaN;
%   
%   ind_nor06=find((lat6(841,:)>-43.5) & (lon6(841,:)<-74)); %Norte
%   ind_sur06=find((lat6(841,:)<-43.5) & (lon6(841,:)<-74));%Sur
%   ind_in_mic06=find((lat6(841,:)>-43.5) & (lon6(841,:)>-74));%MIC
%   ind_in_fior06=find((lat6(841,:)<-43.5) & (lon6(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor06)+length(ind_sur06)+length(ind_in_mic06)+length(ind_in_fior06)
%   inicial=length(z6)
%   perdidas=final-inicial
  
%   save('ind_nor06.mat','ind_nor06');
%   save('ind_sur06.mat','ind_sur06');
%   save('ind_in_mic06.mat','ind_in_mic06');
%   save('ind_in_fior06.mat','ind_in_fior06');
%   save('lon6.mat','lon6');
%   save('lat6.mat','lat6');
%   save('z6.mat','z6');

%   figure()
%   subplot(221)
%   plot(lon6(end,ind_nor06),lat6(end,ind_nor06),'o')
%   subplot(222)
%   plot(lon6(end,ind_sur06),lat6(end,ind_sur06),'o')
%   subplot(223)
%   plot(lon6(end,ind_in_mic06),lat6(end,ind_in_mic06),'o')
%   subplot(224)
%   plot(lon6(end,ind_in_fior06),lat6(end,ind_in_fior06),'o')
%   
   
%% Grafico de Seccion vertical opendrift en la Boca del Guafo
clear all
close all
clc

addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
addpath('/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/Indices/')
dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'

%Cargar simulaciones de opendrift
load('lon1.mat');load('lat1.mat');load('z1.mat');
load('lon2.mat');load('lat2.mat');load('z2.mat');
load('lon3.mat');load('lat3.mat');load('z3.mat');
load('lon4.mat');load('lat4.mat');load('z4.mat');
load('lon5.mat');load('lat5.mat');load('z5.mat');

lon6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','lon');
lat6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','lat');
z6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','z');

%Indices de cada simulacion 
load('ind_nor01.mat'); load('ind_sur01.mat'); load('ind_in_mic01.mat'); load('ind_in_fior01.mat');
load('ind_nor02.mat'); load('ind_sur02.mat'); load('ind_in_mic02.mat'); load('ind_in_fior02.mat');
load('ind_nor03.mat'); load('ind_sur03.mat'); load('ind_in_mic03.mat'); load('ind_in_fior03.mat');
load('ind_nor04.mat'); load('ind_sur04.mat'); load('ind_in_mic04.mat'); load('ind_in_fior04.mat');
load('ind_nor05.mat'); load('ind_sur05.mat'); load('ind_in_mic05.mat'); load('ind_in_fior05.mat');
load('ind_nor06.mat'); load('ind_sur06.mat'); load('ind_in_mic06.mat'); load('ind_in_fior06.mat');

%Figura preliminar de los indices del norte
 figure()
 hold on
 plot(lon1(end,ind_nor01(1:100:end)),lat1(end,ind_nor01(1:100:end)),'o')
 plot(lon2(end,ind_nor02(1:100:end)),lat2(end,ind_nor02(1:100:end)),'o')
 plot(lon3(end,ind_nor03(1:100:end)),lat3(end,ind_nor03(1:100:end)),'o')
 plot(lon4(end,ind_nor04(1:100:end)),lat4(end,ind_nor04(1:100:end)),'o')
 plot(lon5(end,ind_nor05(1:100:end)),lat5(end,ind_nor05(1:100:end)),'o')
 plot(lon6(end,ind_nor06(1:100:end)),lat6(end,ind_nor06(1:100:end)),'o')
 
%Campo de particulas en el tiempo 2

lat_ini1=lat1(1,:);
lon_ini1=lon1(1,:);
z_ini1=z1(1,:);
indx1=find(lat_ini1>0);
lat_ini1(indx1)=NaN;
lon_ini1(indx1)=NaN;
z_ini1(indx1)=NaN;

lat_ini2=lat2(1,:);
lon_ini2=lon2(1,:);
z_ini2=z2(1,:);
indx2=find(lat_ini2>0);
lat_ini2(indx2)=NaN;
lon_ini2(indx2)=NaN;
z_ini2(indx2)=NaN;

lat_ini3=lat3(1,:);
lon_ini3=lon3(1,:);
z_ini3=z3(1,:);
indx3=find(lat_ini3>0);
lat_ini3(indx3)=NaN;
lon_ini3(indx3)=NaN;
z_ini3(indx3)=NaN;

lat_ini4=lat4(1,:);
lon_ini4=lon4(1,:);
z_ini4=z4(1,:);
indx4=find(lat_ini4>0);
lat_ini4(indx4)=NaN;
lon_ini4(indx4)=NaN;
z_ini4(indx4)=NaN;

lat_ini5=lat5(1,:);
lon_ini5=lon5(1,:);
z_ini5=z5(1,:);
indx5=find(lat_ini5>0);
lat_ini5(indx5)=NaN;
lon_ini5(indx5)=NaN;
z_ini5(indx5)=NaN;

lat_ini6=lat6(1,:);
lon_ini6=lon6(1,:);
z_ini6=z6(1,:);
indx6=find(lat_ini6>0);
lat_ini6(indx6)=NaN;
lon_ini6(indx6)=NaN;
z_ini6(indx6)=NaN;

%% Graficos de seccion en la Boca del Guafo

figure(1)
subplot(141)
hold on
plot(lat_ini1(1,:),z_ini1(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini1(1,ind_nor01),z_ini1(1,ind_nor01),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini2(1,ind_nor02),z_ini2(1,ind_nor02),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini3(1,ind_nor03),z_ini3(1,ind_nor03),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini4(1,ind_nor04),z_ini4(1,ind_nor04),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini5(1,ind_nor05),z_ini5(1,ind_nor05),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_nor06),z_ini6(1,ind_nor06),'b.','MarkerSize',10,'LineWidth',5)
title('North')
text(-43.73,-190,'a)','FontSize',25,'FontWeight','bold')
text(-43.38,-218,'N','FontName','Lucida Fax','FontSize',28,'FontWeight','bold')
text(-43.78,-218,'S','FontName','Lucida Fax','FontSize',28,'FontWeight','bold')
xlabel('Latitude')
ylabel('[m]')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
%legend([ b ],'North')
text(-43.36,-190,'n=193.009','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(142)
hold on
plot(lat_ini1(1,:),z_ini1(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini1(1,ind_sur01),z_ini1(1,ind_sur01),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini2(1,ind_sur02),z_ini2(1,ind_sur02),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini3(1,ind_sur03),z_ini3(1,ind_sur03),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini4(1,ind_sur04),z_ini4(1,ind_sur04),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini5(1,ind_sur05),z_ini5(1,ind_sur05),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_sur06),z_ini6(1,ind_sur06),'g.','MarkerSize',10,'LineWidth',5)
title('South')
set(gca,'yticklabel',' ')
xlabel('Latitude')
text(-43.73,-190,'b)','FontSize',25,'FontWeight','bold')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=1.594.769','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(143)
hold on
plot(lat_ini1(1,:),z_ini1(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
d=plot(lat_ini1(1,ind_in_mic01),z_ini1(1,ind_in_mic01),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini2(1,ind_in_mic02),z_ini2(1,ind_in_mic02),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini3(1,ind_in_mic03),z_ini3(1,ind_in_mic03),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini4(1,ind_in_mic04),z_ini4(1,ind_in_mic04),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini5(1,ind_in_mic05),z_ini5(1,ind_in_mic05),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_in_mic06),z_ini6(1,ind_in_mic06),'y.','MarkerSize',10,'LineWidth',5)
title('Inland Sea')
set(gca,'yticklabel',' ')
set(gca,'Xdir','reverse')
text(-43.73,-190,'c)','FontSize',25,'FontWeight','bold')
xlabel('Latitude')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=721.619','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(144)
hold on
plot(lat_ini1(1,:),z_ini1(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
e=plot(lat_ini1(1,ind_in_fior01),z_ini1(1,ind_in_fior01),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini2(1,ind_in_fior02),z_ini2(1,ind_in_fior02),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini3(1,ind_in_fior03),z_ini3(1,ind_in_fior03),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini4(1,ind_in_fior04),z_ini4(1,ind_in_fior04),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini5(1,ind_in_fior05),z_ini5(1,ind_in_fior05),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_in_fior06),z_ini6(1,ind_in_fior06),'r.','MarkerSize',10,'LineWidth',5)
title('Fjords')
text(-43.73,-190,'d)','FontSize',25,'FontWeight','bold')
xlabel('Latitude')
set(gca,'yticklabel',' ')
xlim([-43.82 -43.35])
set(gca,'Xdir','reverse')
box on
set(gca, 'FontSize', 25)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
%legend([ b c d e],'norte','sur','mic','Fjords')
text(-43.36,-190,'n=1.130.950','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')


%% Grafico de particulas horizontal
addpath(genpath('C:\Users\Valentina\Downloads\m_map'))

 figure()
 subplot(141)
 hold on
 m_proj('miller','lon',[-76 -72],'lat',[-46 -41])
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',16);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the North','FontSize',16)
 decimar=100;
 m_scatter(lon1(end,ind_nor01(1:100:end)),lat1(end,ind_nor01(1:100:end)),30.0,z1(end,ind_nor01(1:100:end)),'filled')
 m_scatter(lon2(end,ind_nor02(1:100:end)),lat2(end,ind_nor02(1:100:end)),30.0,z2(end,ind_nor02(1:100:end)),'filled')
 m_scatter(lon3(end,ind_nor03(1:100:end)),lat3(end,ind_nor03(1:100:end)),30.0,z3(end,ind_nor03(1:100:end)),'filled')
 m_scatter(lon4(end,ind_nor04(1:100:end)),lat4(end,ind_nor04(1:100:end)),30.0,z4(end,ind_nor04(1:100:end)),'filled')
 m_scatter(lon5(end,ind_nor05(1:100:end)),lat5(end,ind_nor05(1:100:end)),30.0,z5(end,ind_nor05(1:100:end)),'filled')
 m_scatter(lon6(end,ind_nor06(1:100:end)),lat6(end,ind_nor06(1:100:end)),30.0,z6(end,ind_nor06(1:100:end)),'filled')
 caxis([-340 0])
 colorbar
 set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',16,'FontWeight','Normal', 'LineWidth', 2);
 set(gca, 'FontSize', 16)
 subplot(142)
 hold on
 m_proj('miller','lon',[-77 -72],'lat',[-47 -41])
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the South','FontSize',16)
 decimar=100;
 m_scatter(lon1(end,ind_sur01(1:100:end)),lat1(end,ind_sur01(1:100:end)),30.0,z1(end,ind_sur01(1:100:end)),'filled')
 m_scatter(lon2(end,ind_sur02(1:100:end)),lat2(end,ind_sur02(1:100:end)),30.0,z2(end,ind_sur02(1:100:end)),'filled')
 m_scatter(lon3(end,ind_sur03(1:100:end)),lat3(end,ind_sur03(1:100:end)),30.0,z3(end,ind_sur03(1:100:end)),'filled')
 m_scatter(lon4(end,ind_sur04(1:100:end)),lat4(end,ind_sur04(1:100:end)),30.0,z4(end,ind_sur04(1:100:end)),'filled')
 m_scatter(lon5(end,ind_sur05(1:100:end)),lat5(end,ind_sur05(1:100:end)),30.0,z5(end,ind_sur05(1:100:end)),'filled')
 m_scatter(lon6(end,ind_sur06(1:100:end)),lat6(end,ind_sur06(1:100:end)),30.0,z6(end,ind_sur06(1:100:end)),'filled')
 caxis([-340 0])
 colorbar
 set(gca, 'FontSize', 17)
 subplot(143)
 hold on
 m_proj('miller','lon',[-76 -72],'lat',[-46 -41])
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the MIC','FontSize',16)
 decimar=100;
 m_scatter(lon1(end,ind_in_mic01(1:100:end)),lat1(end,ind_in_mic01(1:100:end)),30.0,z1(end,ind_in_mic01(1:100:end)),'filled')
 m_scatter(lon2(end,ind_in_mic02(1:100:end)),lat2(end,ind_in_mic02(1:100:end)),30.0,z2(end,ind_in_mic02(1:100:end)),'filled')
 m_scatter(lon3(end,ind_in_mic03(1:100:end)),lat3(end,ind_in_mic03(1:100:end)),30.0,z3(end,ind_in_mic03(1:100:end)),'filled')
 m_scatter(lon4(end,ind_in_mic04(1:100:end)),lat4(end,ind_in_mic04(1:100:end)),30.0,z4(end,ind_in_mic04(1:100:end)),'filled')
 m_scatter(lon5(end,ind_in_mic05(1:100:end)),lat5(end,ind_in_mic05(1:100:end)),30.0,z5(end,ind_in_mic05(1:100:end)),'filled')
 m_scatter(lon6(end,ind_in_mic06(1:100:end)),lat6(end,ind_in_mic06(1:100:end)),30.0,z6(end,ind_in_mic06(1:100:end)),'filled')
 caxis([-340 0])
 colorbar
 set(gca, 'FontSize', 17)
 
 subplot(144)
 hold on
 m_proj('miller','lon',[-76 -72],'lat',[-46 -41])
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the Fjords','FontSize',16)
 decimar=100;
 m_scatter(lon1(end,ind_in_fior01(1:100:end)),lat1(end,ind_in_fior01(1:100:end)),30.0,z1(end,ind_in_fior01(1:100:end)),'filled')
 m_scatter(lon2(end,ind_in_fior02(1:100:end)),lat2(end,ind_in_fior02(1:100:end)),30.0,z2(end,ind_in_fior02(1:100:end)),'filled')
 m_scatter(lon3(end,ind_in_fior03(1:100:end)),lat3(end,ind_in_fior03(1:100:end)),30.0,z3(end,ind_in_fior03(1:100:end)),'filled')
 m_scatter(lon4(end,ind_in_fior04(1:100:end)),lat4(end,ind_in_fior04(1:100:end)),30.0,z4(end,ind_in_fior04(1:100:end)),'filled')
 m_scatter(lon5(end,ind_in_fior05(1:100:end)),lat5(end,ind_in_fior05(1:100:end)),30.0,z5(end,ind_in_fior05(1:100:end)),'filled')
 m_scatter(lon6(end,ind_in_fior06(1:100:end)),lat6(end,ind_in_fior06(1:100:end)),30.0,z6(end,ind_in_fior06(1:100:end)),'filled')
 caxis([-340 0])
 colorbar
 set(gca, 'FontSize', 17)

%% Porcentajes

%Total de particulas por cuadrante

tt_nor=length(ind_nor01)+length(ind_nor02)+length(ind_nor03)+length(ind_nor04)+length(ind_nor05)+length(ind_nor06)
tt_sur=length(ind_sur01)+length(ind_sur02)+length(ind_sur03)+length(ind_sur04)+length(ind_sur05)+length(ind_sur06)
tt_mic=length(ind_in_mic01)+length(ind_in_mic02)+length(ind_in_mic03)+length(ind_in_mic04)+length(ind_in_mic05)+length(ind_in_mic06)
tt_fior=length(ind_in_fior01)+length(ind_in_fior02)+length(ind_in_fior03)+length(ind_in_fior04)+length(ind_in_fior05)+length(ind_in_fior06)

total=tt_nor+tt_sur+tt_mic+tt_fior; %total de todas las particulas

 %Porcentaje considerando el 100% como 3.640.347, el cual corresponde al
 %total de las particulas en el tiempo final

   p_nor=tt_nor/total*100
   p_sur=tt_sur/total*100
   p_mic=tt_mic/total*100
   p_fior=tt_fior/total*100
   
   total_por=p_nor+p_sur+p_mic+p_fior
   
   disp(['p_nor ' 'p_sur' 'p_mic ' 'p_fior' ' total_por'])
   procentajes=[p_nor p_sur p_mic p_fior  total_por]
   
   