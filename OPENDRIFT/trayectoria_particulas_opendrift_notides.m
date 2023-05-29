%Obtencion de indices de las simualciones de opendrift sin mareas

clear all
close all
clc

% addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
% dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'
% file1= [dir 'mosa_VM_1mes_horario_back_AS_27-31Enero.nc']
% file2= [dir 'mosa_VM_1mes_horario_back_AS_22-26Enero.nc']
% file3=[dir 'mosa_VM_1mes_horario_back_AS_17-21Enero.nc']
% file4=[dir 'mosa_VM_1mes_horario_back_AS_12-16Enero.nc']
% file5=[dir 'mosa_VM_1mes_horario_back_AS_07-11Enero.nc']
% file6=[dir 'mosa_VM_1mes_horario_back_AS_01-06Enero.nc']


% lon7=ncread('mosa_VM_1mes_horario_back_27-31_SinMareas.nc','lon');
% lat7=ncread('mosa_VM_1mes_horario_back_27-31_SinMareas.nc','lat');
% z7=ncread('mosa_VM_1mes_horario_back_27-31_SinMareas.nc','z');

% lon8=ncread('mosa_VM_1mes_horario_back_22-26_SinMareas.nc','lon');
% lat8=ncread('mosa_VM_1mes_horario_back_22-26_SinMareas.nc','lat');
% z8=ncread('mosa_VM_1mes_horario_back_22-26_SinMareas.nc','z');

% lon9=ncread('mosa_VM_1mes_horario_back_17-21_SinMareas.nc','lon');
% lat9=ncread('mosa_VM_1mes_horario_back_17-21_SinMareas.nc','lat');
% z9=ncread('mosa_VM_1mes_horario_back_17-21_SinMareas.nc','z');

% lon10=ncread('mosa_VM_1mes_horario_back_12-16_SinMareas.nc','lon');
% lat10=ncread('mosa_VM_1mes_horario_back_12-16_SinMareas.nc','lat');
% z10=ncread('mosa_VM_1mes_horario_back_12-16_SinMareas.nc','z');

% lon11=ncread('mosa_VM_1mes_horario_back_07-11_SinMareas.nc','lon');
% lat11=ncread('mosa_VM_1mes_horario_back_07-11_SinMareas.nc','lat');
% z11=ncread('mosa_VM_1mes_horario_back_07-11_SinMareas.nc','z');

% lon12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lon');
% lat12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lat');
% z12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','z');


%Calculo de indice entre 27-31

  % lat7(find(lat7>0))=NaN;
  % lon7(find(lon7>0))=NaN;
  % 
  % ind_nor07=find((lat7(841,:)>-43.5) & (lon7(841,:)<-74.0)); %Norte
  % ind_sur07=find((lat7(841,:)<-43.5) & (lon7(841,:)<-74.0));%Sur
  % ind_in_mic07=find((lat7(841,:)>-43.5) & (lon7(841,:)>-74.0));%MIC
  % ind_in_fior07=find((lat7(841,:)<-43.5) & (lon7(841,:)>-74.0));%Fiordos
  % 
  % 
  % figure()
  % subplot(221)
  % plot(lon7(end,ind_nor07),lat7(end,ind_nor07),'o')
  % subplot(222)
  % plot(lon7(end,ind_sur07),lat7(end,ind_sur07),'o')
  % subplot(223)
  % plot(lon7(end,ind_in_mic07),lat7(end,ind_in_mic07),'o')
  % subplot(224)
  % plot(lon7(end,ind_in_fior07),lat7(end,ind_in_fior07),'o')
  % 
  % 
  % final=length(ind_nor07)+length(ind_sur07)+length(ind_in_mic07)+length(ind_in_fior07)
  % inicial=length(z7)
  % perdidas=final-inicial 
  % 
  % save('ind_nor07.mat','ind_nor07');
  % save('ind_sur07.mat','ind_sur07');
  % save('ind_in_mic07.mat','ind_in_mic07');
  % save('ind_in_fior07.mat','ind_in_fior07');
  % save('lon7.mat','lon7');
  % save('lat7.mat','lat7');
  % save('z7.mat','z7');
  
%Calculo de indice entre 22-26  

% lat8(find(lat8>0))=NaN;
% lon8(find(lon8>0))=NaN;
% 
%   ind_nor08=find((lat8(841,:)>-43.5) & (lon8(841,:)<-74)); %Norte
%   ind_sur08=find((lat8(841,:)<-43.5) & (lon8(841,:)<-74));%Sur
%   ind_in_mic08=find((lat8(841,:)>-43.5) & (lon8(841,:)>-74));%MIC
%   ind_in_fior08=find((lat8(841,:)<-43.5) & (lon8(841,:)>-74));%Fiordos
% 
%   final=length(ind_nor08)+length(ind_sur08)+length(ind_in_mic08)+length(ind_in_fior08)
%   inicial=length(z8)
%   perdidas=final-inicial
% 
%   save('ind_nor08.mat','ind_nor08');
%   save('ind_sur08.mat','ind_sur08');
%   save('ind_in_mic08.mat','ind_in_mic08');
%   save('ind_in_fior08.mat','ind_in_fior08');
%   save('lon8.mat','lon8');
%   save('lat8.mat','lat8');
%   save('z8.mat','z8');
% 
% 
%   figure()
%   subplot(221)
%   plot(lon8(end,ind_nor08),lat8(end,ind_nor08),'o')
%   subplot(222)
%   plot(lon8(end,ind_sur08),lat8(end,ind_sur08),'o')
%   subplot(223)
%   plot(lon8(end,ind_in_mic08),lat8(end,ind_in_mic08),'o')
%   subplot(224)
%   plot(lon8(end,ind_in_fior08),lat8(end,ind_in_fior08),'o')

  

%Calculo de indice entre 17-21 

 % lat9(find(lat9>0))=NaN;
 % lon9(find(lon9>0))=NaN;
 % 
 %  ind_nor09=find((lat9(841,:)>-43.5) & (lon9(841,:)<-74)); %Norte
 %  ind_sur09=find((lat9(841,:)<-43.5) & (lon9(841,:)<-74));%Sur
 %  ind_in_mic09=find((lat9(841,:)>-43.5) & (lon9(841,:)>-74));%MIC
 %  ind_in_fior09=find((lat9(841,:)<-43.5) & (lon9(841,:)>-74));%Fiordos
 % 
 %  final=length(ind_nor09)+length(ind_sur09)+length(ind_in_mic09)+length(ind_in_fior09)
 %  inicial=length(z9)
 %  perdidas=final-inicial
 % 
 %  save('ind_nor09.mat','ind_nor09');
 %  save('ind_sur09.mat','ind_sur09');
 %  save('ind_in_mic09.mat','ind_in_mic09');
 %  save('ind_in_fior09.mat','ind_in_fior09');  
 %  save('lon9.mat','lon9');
 %  save('lat9.mat','lat9');
 %  save('z9.mat','z9');
 % 
 %  figure()
 %  subplot(221)
 %  plot(lon9(end,ind_nor09),lat9(end,ind_nor09),'o')
 %  subplot(222)
 %  plot(lon9(end,ind_sur09),lat9(end,ind_sur09),'o')
 %  subplot(223)
 %  plot(lon9(end,ind_in_mic09),lat9(end,ind_in_mic09),'o')
 %  subplot(224)
 %  plot(lon9(end,ind_in_fior09),lat9(end,ind_in_fior09),'o')


%Calculo de indice entre 12-16

  % lat10(find(lat10>0))=NaN;
  % lon10(find(lon10>0))=NaN;
  % 
  % ind_nor10=find((lat10(841,:)>-43.5) & (lon10(841,:)<-74)); %Norte
  % ind_sur10=find((lat10(841,:)<-43.5) & (lon10(841,:)<-74));%Sur
  % ind_in_mic10=find((lat10(841,:)>-43.5) & (lon10(841,:)>-74));%MIC
  % ind_in_fior10=find((lat10(841,:)<-43.5) & (lon10(841,:)>-74));%Fiordos
  % 
  % final=length(ind_nor10)+length(ind_sur10)+length(ind_in_mic10)+length(ind_in_fior10)
  % inicial=length(z10)
  % perdidas=final-inicial
  % 
  % save('ind_nor10.mat','ind_nor10');
  % save('ind_sur10.mat','ind_sur10');
  % save('ind_in_mic10.mat','ind_in_mic10');
  % save('ind_in_fior10.mat','ind_in_fior10');    
  % save('lon10.mat','lon10');
  % save('lat10.mat','lat10');
  % save('z10.mat','z10');
  % 
  % figure()
  % subplot(221)
  % plot(lon10(end,ind_nor10),lat10(end,ind_nor10),'o')
  % subplot(222)
  % plot(lon10(end,ind_sur10),lat10(end,ind_sur10),'o')
  % subplot(223)
  % plot(lon10(end,ind_in_mic10),lat10(end,ind_in_mic10),'o')
  % subplot(224)
  % plot(lon10(end,ind_in_fior10),lat10(end,ind_in_fior10),'o')


%Calculo de indice entre 07-11

  % lat11(find(lat11>0))=NaN;
  % lon11(find(lon11>0))=NaN;
  % 
  % ind_nor11=find((lat11(841,:)>-43.5) & (lon11(841,:)<-74)); %Norte
  % ind_sur11=find((lat11(841,:)<-43.5) & (lon11(841,:)<-74));%Sur
  % ind_in_mic11=find((lat11(841,:)>-43.5) & (lon11(841,:)>-74));%MIC
  % ind_in_fior11=find((lat11(841,:)<-43.5) & (lon11(841,:)>-74));%Fiordos
  % 
  % final=length(ind_nor11)+length(ind_sur11)+length(ind_in_mic11)+length(ind_in_fior11)
  % inicial=length(z11)
  % perdidas=final-inicial
  % 
  % save('ind_nor11.mat','ind_nor11');
  % save('ind_sur11.mat','ind_sur11');
  % save('ind_in_mic11.mat','ind_in_mic11');
  % save('ind_in_fior11.mat','ind_in_fior11');
  % save('lon11.mat','lon11');
  % save('lat11.mat','lat11');
  % save('z11.mat','z11');
  % 
  % figure()
  % subplot(221)
  % plot(lon11(end,ind_nor11),lat11(end,ind_nor11),'o')
  % subplot(222)
  % plot(lon11(end,ind_sur11),lat11(end,ind_sur11),'o')
  % subplot(223)
  % plot(lon11(end,ind_in_mic11),lat11(end,ind_in_mic11),'o')
  % subplot(224)
  % plot(lon11(end,ind_in_fior11),lat11(end,ind_in_fior11),'o')
  % 
  % 
%Calculo de indice entre 01-06

  % lat12(find(lat12>0))=NaN;
  % lon12(find(lon12>0))=NaN;
  % 
  % ind_nor12=find((lat12(841,:)>-43.5) & (lon12(841,:)<-74)); %Norte
  % ind_sur12=find((lat12(841,:)<-43.5) & (lon12(841,:)<-74));%Sur
  % ind_in_mic12=find((lat12(841,:)>-43.5) & (lon12(841,:)>-74));%MIC
  % ind_in_fior12=find((lat12(841,:)<-43.5) & (lon12(841,:)>-74));%Fiordos
  % 
  % final=length(ind_nor12)+length(ind_sur12)+length(ind_in_mic12)+length(ind_in_fior12)
  % inicial=length(z12)
  % perdidas=final-inicial
  % 
  % save('ind_nor12.mat','ind_nor12');
  % save('ind_sur12.mat','ind_sur12');
  % save('ind_in_mic12.mat','ind_in_mic12');
  % save('ind_in_fior12.mat','ind_in_fior12');
  % save('lon12.mat','lon12');
  % save('lat12.mat','lat12');
  % save('z12.mat','z12');
  % 
  % figure()
  % subplot(221)
  % plot(lon12(end,ind_nor12),lat12(end,ind_nor12),'o')
  % subplot(222)
  % plot(lon12(end,ind_sur12),lat12(end,ind_sur12),'o')
  % subplot(223)
  % plot(lon12(end,ind_in_mic12),lat12(end,ind_in_mic12),'o')
  % subplot(224)
  % plot(lon12(end,ind_in_fior12),lat12(end,ind_in_fior12),'o')
  % 
  % 
%% Grafico de Seccion vertical opendrift en la Boca del Guafo
clear all
close all
clc

addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
addpath('/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/Indices/')
dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'

%Cargar simulaciones de opendrift
load('lon7.mat');load('lat7.mat');load('z7.mat');
load('lon8.mat');load('lat8.mat');load('z8.mat');
load('lon9.mat');load('lat9.mat');load('z9.mat');
load('lon10.mat');load('lat10.mat');load('z10.mat');
load('lon11.mat');load('lat11.mat');load('z11.mat');

lon12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lon');
lat12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lat');
z12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','z');

%Indices de cada simulacion 
load('ind_nor07.mat'); load('ind_sur07.mat'); load('ind_in_mic07.mat'); load('ind_in_fior07.mat');
load('ind_nor08.mat'); load('ind_sur08.mat'); load('ind_in_mic08.mat'); load('ind_in_fior08.mat');
load('ind_nor09.mat'); load('ind_sur09.mat'); load('ind_in_mic09.mat'); load('ind_in_fior09.mat');
load('ind_nor10.mat'); load('ind_sur10.mat'); load('ind_in_mic10.mat'); load('ind_in_fior10.mat');
load('ind_nor11.mat'); load('ind_sur11.mat'); load('ind_in_mic11.mat'); load('ind_in_fior11.mat');
load('ind_nor12.mat'); load('ind_sur12.mat'); load('ind_in_mic12.mat'); load('ind_in_fior12.mat');

%Figura preliminar de los indices del norte
 figure()
 hold on
 plot(lon7(end,ind_nor07(1:100:end)),lat7(end,ind_nor07(1:100:end)),'o')
 plot(lon8(end,ind_nor08(1:100:end)),lat8(end,ind_nor08(1:100:end)),'o')
 plot(lon9(end,ind_nor09(1:100:end)),lat9(end,ind_nor09(1:100:end)),'o')
 plot(lon10(end,ind_nor10(1:100:end)),lat10(end,ind_nor10(1:100:end)),'o')
 plot(lon11(end,ind_nor11(1:100:end)),lat11(end,ind_nor11(1:100:end)),'o')
 plot(lon12(end,ind_nor12(1:100:end)),lat12(end,ind_nor12(1:100:end)),'o')
 
%Campo de particulas en el tiempo 2

lat_ini7=lat7(1,:);
lon_ini7=lon7(1,:);
z_ini7=z7(1,:);
indx7=find(lat_ini7>0);
lat_ini7(indx7)=NaN;
lon_ini7(indx7)=NaN;
z_ini7(indx7)=NaN;

lat_ini8=lat8(1,:);
lon_ini8=lon8(1,:);
z_ini8=z8(1,:);
indx8=find(lat_ini8>0);
lat_ini8(indx8)=NaN;
lon_ini8(indx8)=NaN;
z_ini8(indx8)=NaN;

lat_ini9=lat9(1,:);
lon_ini9=lon9(1,:);
z_ini9=z9(1,:);
indx9=find(lat_ini9>0);
lat_ini9(indx9)=NaN;
lon_ini9(indx9)=NaN;
z_ini9(indx9)=NaN;

lat_ini10=lat10(1,:);
lon_ini10=lon10(1,:);
z_ini10=z10(1,:);
indx10=find(lat_ini10>0);
lat_ini10(indx10)=NaN;
lon_ini10(indx10)=NaN;
z_ini10(indx10)=NaN;

lat_ini11=lat11(1,:);
lon_ini11=lon11(1,:);
z_ini11=z11(1,:);
indx11=find(lat_ini11>0);
lat_ini11(indx11)=NaN;
lon_ini11(indx11)=NaN;
z_ini11(indx11)=NaN;

lat_ini12=lat12(1,:);
lon_ini12=lon12(1,:);
z_ini12=z12(1,:);
indx12=find(lat_ini12>0);
lat_ini12(indx12)=NaN;
lon_ini12(indx12)=NaN;
z_ini12(indx12)=NaN;


%% Graficos de seccion en la Boca del Guafo

figure(1)
subplot(141)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini7(1,ind_nor07),z_ini7(1,ind_nor07),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_nor08),z_ini8(1,ind_nor08),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_nor09),z_ini9(1,ind_nor09),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_nor10),z_ini10(1,ind_nor10),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_nor11),z_ini11(1,ind_nor11),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_nor12),z_ini12(1,ind_nor12),'b.','MarkerSize',10,'LineWidth',5)
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
text(-43.36,-190,'n=565.118','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(142)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini7(1,ind_sur07),z_ini7(1,ind_sur07),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_sur08),z_ini8(1,ind_sur08),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_sur09),z_ini9(1,ind_sur09),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_sur10),z_ini10(1,ind_sur10),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_sur11),z_ini11(1,ind_sur11),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_sur12),z_ini12(1,ind_sur12),'g.','MarkerSize',10,'LineWidth',5)
title('South')
set(gca,'yticklabel',' ')
xlabel('Latitude')
text(-43.73,-190,'b)','FontSize',25,'FontWeight','bold')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=1.563.852','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(143)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini7(1,ind_in_mic07),z_ini7(1,ind_in_mic07),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_in_mic08),z_ini8(1,ind_in_mic08),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_in_mic09),z_ini9(1,ind_in_mic09),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_in_mic10),z_ini10(1,ind_in_mic10),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_in_mic11),z_ini11(1,ind_in_mic11),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_in_mic12),z_ini12(1,ind_in_mic12),'y.','MarkerSize',10,'LineWidth',5)
title('Inland Sea')
set(gca,'yticklabel',' ')
set(gca,'Xdir','reverse')
text(-43.73,-190,'c)','FontSize',25,'FontWeight','bold')
xlabel('Latitude')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=688.553','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(144)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
e=plot(lat_ini7(1,ind_in_fior07),z_ini7(1,ind_in_fior07),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_in_fior08),z_ini8(1,ind_in_fior08),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_in_fior09),z_ini9(1,ind_in_fior09),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_in_fior10),z_ini10(1,ind_in_fior10),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_in_fior11),z_ini11(1,ind_in_fior11),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_in_fior12),z_ini12(1,ind_in_fior12),'r.','MarkerSize',10,'LineWidth',5)
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
text(-43.36,-190,'n=822.832','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')


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
 m_scatter(lon7(end,ind_nor07(1:100:end)),lat7(end,ind_nor07(1:100:end)),30.0,z7(end,ind_nor07(1:100:end)),'filled')
 m_scatter(lon8(end,ind_nor08(1:100:end)),lat8(end,ind_nor08(1:100:end)),30.0,z8(end,ind_nor08(1:100:end)),'filled')
 m_scatter(lon9(end,ind_nor09(1:100:end)),lat9(end,ind_nor09(1:100:end)),30.0,z9(end,ind_nor09(1:100:end)),'filled')
 m_scatter(lon10(end,ind_nor10(1:100:end)),lat10(end,ind_nor10(1:100:end)),30.0,z10(end,ind_nor10(1:100:end)),'filled')
 m_scatter(lon11(end,ind_nor11(1:100:end)),lat11(end,ind_nor11(1:100:end)),30.0,z11(end,ind_nor11(1:100:end)),'filled')
 m_scatter(lon12(end,ind_nor12(1:100:end)),lat12(end,ind_nor12(1:100:end)),30.0,z12(end,ind_nor12(1:100:end)),'filled')
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
 m_scatter(lon7(end,ind_sur07(1:100:end)),lat7(end,ind_sur07(1:100:end)),30.0,z7(end,ind_sur07(1:100:end)),'filled')
 m_scatter(lon8(end,ind_sur08(1:100:end)),lat8(end,ind_sur08(1:100:end)),30.0,z8(end,ind_sur08(1:100:end)),'filled')
 m_scatter(lon9(end,ind_sur09(1:100:end)),lat9(end,ind_sur09(1:100:end)),30.0,z9(end,ind_sur09(1:100:end)),'filled')
 m_scatter(lon10(end,ind_sur10(1:100:end)),lat10(end,ind_sur10(1:100:end)),30.0,z10(end,ind_sur10(1:100:end)),'filled')
 m_scatter(lon11(end,ind_sur11(1:100:end)),lat11(end,ind_sur11(1:100:end)),30.0,z11(end,ind_sur11(1:100:end)),'filled')
 m_scatter(lon12(end,ind_sur12(1:100:end)),lat12(end,ind_sur12(1:100:end)),30.0,z12(end,ind_sur12(1:100:end)),'filled')
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
 m_scatter(lon7(end,ind_in_mic07(1:100:end)),lat7(end,ind_in_mic07(1:100:end)),30.0,z7(end,ind_in_mic07(1:100:end)),'filled')
 m_scatter(lon8(end,ind_in_mic08(1:100:end)),lat8(end,ind_in_mic08(1:100:end)),30.0,z8(end,ind_in_mic08(1:100:end)),'filled')
 m_scatter(lon9(end,ind_in_mic09(1:100:end)),lat9(end,ind_in_mic09(1:100:end)),30.0,z9(end,ind_in_mic09(1:100:end)),'filled')
 m_scatter(lon10(end,ind_in_mic10(1:100:end)),lat10(end,ind_in_mic10(1:100:end)),30.0,z10(end,ind_in_mic10(1:100:end)),'filled')
 m_scatter(lon11(end,ind_in_mic11(1:100:end)),lat11(end,ind_in_mic11(1:100:end)),30.0,z11(end,ind_in_mic11(1:100:end)),'filled')
 m_scatter(lon12(end,ind_in_mic12(1:100:end)),lat12(end,ind_in_mic12(1:100:end)),30.0,z12(end,ind_in_mic12(1:100:end)),'filled')
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
 m_scatter(lon7(end,ind_in_fior07(1:100:end)),lat7(end,ind_in_fior07(1:100:end)),30.0,z7(end,ind_in_fior07(1:100:end)),'filled')
 m_scatter(lon8(end,ind_in_fior08(1:100:end)),lat8(end,ind_in_fior08(1:100:end)),30.0,z8(end,ind_in_fior08(1:100:end)),'filled')
 m_scatter(lon9(end,ind_in_fior09(1:100:end)),lat9(end,ind_in_fior09(1:100:end)),30.0,z9(end,ind_in_fior09(1:100:end)),'filled')
 m_scatter(lon10(end,ind_in_fior10(1:100:end)),lat10(end,ind_in_fior10(1:100:end)),30.0,z10(end,ind_in_fior10(1:100:end)),'filled')
 m_scatter(lon11(end,ind_in_fior11(1:100:end)),lat11(end,ind_in_fior11(1:100:end)),30.0,z11(end,ind_in_fior11(1:100:end)),'filled')
 m_scatter(lon12(end,ind_in_fior12(1:100:end)),lat12(end,ind_in_fior12(1:100:end)),30.0,z12(end,ind_in_fior12(1:100:end)),'filled')
 caxis([-340 0])
 colorbar
 set(gca, 'FontSize', 17)



%% Porcentajes

%Total de particulas por cuadrante

tt_nor=length(ind_nor07)+length(ind_nor08)+length(ind_nor09)+length(ind_nor10)+length(ind_nor11)+length(ind_nor12)
tt_sur=length(ind_sur07)+length(ind_sur08)+length(ind_sur09)+length(ind_sur10)+length(ind_sur11)+length(ind_sur12)
tt_mic=length(ind_in_mic07)+length(ind_in_mic08)+length(ind_in_mic09)+length(ind_in_mic10)+length(ind_in_mic11)+length(ind_in_mic12)
tt_fior=length(ind_in_fior07)+length(ind_in_fior08)+length(ind_in_fior09)+length(ind_in_fior10)+length(ind_in_fior11)+length(ind_in_fior12)

total=tt_nor+tt_sur+tt_mic+tt_fior

%Porcentaje considerando el 100% como 3.640.355, el cual corresponde al
 %total de las particulas en el tiempo final

   p_nor=tt_nor/total*100
   p_sur=tt_sur/total*100
   p_mic=tt_mic/total*100
   p_fior=tt_fior/total*100
   
   total_por=p_nor+p_sur+p_mic+p_fior
   
   disp(['p_nor ' 'p_sur' 'p_mic ' 'p_fior' ' total_por'])
   procentajes=[p_nor p_sur p_mic p_fior  total_por]

