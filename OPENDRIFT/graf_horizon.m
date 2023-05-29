%Graficos horizontal de las figuras de opendrift

clear all
close all
clc

addpath( 'D:\OPENDRIFT\Simualacion_final\Mareas\Indices\')

%Cargar simulaciones de opendrift
load('lon1.mat');load('lat1.mat');load('z1.mat');
lat_end1=lat1(end,:);
lon_end1=lon1(end,:);
z_end1=z1(end,:);
indx1=find(lat_end1>0);
lat_end1(indx1)=NaN;
lon_end1(indx1)=NaN;
z_end1(indx1)=NaN;

clear lon1 lat1 z1 indx1

load('lon2.mat');load('lat2.mat');load('z2.mat');
lat_end2=lat2(end,:);
lon_end2=lon2(end,:);
z_end2=z2(end,:);
indx2=find(lat_end2>0);
lat_end2(indx2)=NaN;
lon_end2(indx2)=NaN;
z_end2(indx2)=NaN;

clear lon2 lat2 z2 indx2

load('lon3.mat');load('lat3.mat');load('z3.mat');
lat_end3=lat3(end,:);
lon_end3=lon3(end,:);
z_end3=z3(end,:);
indx3=find(lat_end3>0);
lat_end3(indx3)=NaN;
lon_end3(indx3)=NaN;
z_end3(indx3)=NaN;

clear lon3 lat3 z3 indx3

load('lon4.mat');load('lat4.mat');load('z4.mat');
lat_end4=lat4(end,:);
lon_end4=lon4(end,:);
z_end4=z4(end,:);
indx4=find(lat_end4>0);
lat_end4(indx4)=NaN;
lon_end4(indx4)=NaN;
z_end4(indx4)=NaN;

clear lon4 lat4 z4 indx4

load('lon5.mat');load('lat5.mat');load('z5.mat');
lat_end5=lat5(end,:);
lon_end5=lon5(end,:);
z_end5=z5(end,:);
indx5=find(lat_end5>0);
lat_end5(indx5)=NaN;
lon_end5(indx5)=NaN;
z_end5(indx5)=NaN;

clear lon5 lat5 z5 indx5

load('lon7.mat');load('lat7.mat');load('z7.mat');
lat_end7=lat7(end,:);
lon_end7=lon7(end,:);
z_end7=z7(end,:);
indx7=find(lat_end7>0);
lat_end7(indx7)=NaN;
lon_end7(indx7)=NaN;
z_end7(indx7)=NaN;

clear lon7 lat7 z7 indx7

load('lon8.mat');load('lat8.mat');load('z8.mat');
lat_end8=lat8(end,:);
lon_end8=lon8(end,:);
z_end8=z8(end,:);
indx8=find(lat_end8>0);
lat_end8(indx8)=NaN;
lon_end8(indx8)=NaN;
z_end8(indx8)=NaN;

clear lon8 lat8 z8 indx8

load('lon9.mat');load('lat9.mat');load('z9.mat');
lat_end9=lat9(end,:);
lon_end9=lon9(end,:);
z_end9=z9(end,:);
indx9=find(lat_end9>0);
lat_end9(indx9)=NaN;
lon_end9(indx9)=NaN;
z_end9(indx9)=NaN;

clear lon9 lat9 z9 indx9

load('lon10.mat');load('lat10.mat');load('z10.mat');
lat_end10=lat10(end,:);
lon_end10=lon10(end,:);
z_end10=z10(end,:);
indx10=find(lat_end10>0);
lat_end10(indx10)=NaN;
lon_end10(indx10)=NaN;
z_end10(indx10)=NaN;

clear lon10 lat10 z10 indx10

load('lon11.mat');load('lat11.mat');load('z11.mat');
lat_end11=lat11(end,:);
lon_end11=lon11(end,:);
z_end11=z11(end,:);
indx11=find(lat_end11>0);
lat_end11(indx11)=NaN;
lon_end11(indx11)=NaN;
z_end11(indx11)=NaN;

clear lon11 lat11 z11 indx11

lon6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','lon');
lat6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','lat');
z6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','z');

lat_end6=lat6(end,:);
lon_end6=lon6(end,:);
z_end6=z6(end,:);
indx6=find(lat_end6>0);
lat_end6(indx6)=NaN;
lon_end6(indx6)=NaN;
z_end6(indx6)=NaN;

clear lon6 lat6 z6 indx6

lon12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lon');
lat12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lat');
z12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','z');

lat_end12=lat12(end,:);
lon_end12=lon12(end,:);
z_end12=z12(end,:);
indx12=find(lat_end12>0);
lat_end12(indx12)=NaN;
lon_end12(indx12)=NaN;
z_end12(indx12)=NaN;

clear lon12 lat12 z12 indx12

%Indices de cada simulacion 
load('ind_nor01.mat'); load('ind_sur01.mat'); load('ind_in_mic01.mat'); load('ind_in_fior01.mat');
load('ind_nor02.mat'); load('ind_sur02.mat'); load('ind_in_mic02.mat'); load('ind_in_fior02.mat');
load('ind_nor03.mat'); load('ind_sur03.mat'); load('ind_in_mic03.mat'); load('ind_in_fior03.mat');
load('ind_nor04.mat'); load('ind_sur04.mat'); load('ind_in_mic04.mat'); load('ind_in_fior04.mat');
load('ind_nor05.mat'); load('ind_sur05.mat'); load('ind_in_mic05.mat'); load('ind_in_fior05.mat');
load('ind_nor06.mat'); load('ind_sur06.mat'); load('ind_in_mic06.mat'); load('ind_in_fior06.mat');
load('ind_nor07.mat'); load('ind_sur07.mat'); load('ind_in_mic07.mat'); load('ind_in_fior07.mat');
load('ind_nor08.mat'); load('ind_sur08.mat'); load('ind_in_mic08.mat'); load('ind_in_fior08.mat');
load('ind_nor09.mat'); load('ind_sur09.mat'); load('ind_in_mic09.mat'); load('ind_in_fior09.mat');
load('ind_nor10.mat'); load('ind_sur10.mat'); load('ind_in_mic10.mat'); load('ind_in_fior10.mat');
load('ind_nor11.mat'); load('ind_sur11.mat'); load('ind_in_mic11.mat'); load('ind_in_fior11.mat');
load('ind_nor12.mat'); load('ind_sur12.mat'); load('ind_in_mic12.mat'); load('ind_in_fior12.mat');

addpath(genpath('C:\Users\Valentina\Downloads\m_map'))



%figure('Position',[488,45.800,521.800,668])
ax=subplot(141) 
hold on
 m_proj('mercator','lon',[-80 -72.5],'lat',[-47.2 -41.8])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 %m_grid('linewi',2,'linest','none','tickdir','out','xticklabels',[],'fontsize',16);
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',16);
 title('Particles from the North','FontSize',16)
 decimar=100;
 m_scatter(lon_end1(1,ind_nor01(1:100:end)),lat_end1(1,ind_nor01(1:100:end)),30.0,z_end1(1,ind_nor01(1:100:end)),'filled')
 m_scatter(lon_end2(1,ind_nor02(1:100:end)),lat_end2(1,ind_nor02(1:100:end)),30.0,z_end2(1,ind_nor02(1:100:end)),'filled')
 m_scatter(lon_end3(1,ind_nor03(1:100:end)),lat_end3(1,ind_nor03(1:100:end)),30.0,z_end3(1,ind_nor03(1:100:end)),'filled')
 m_scatter(lon_end4(1,ind_nor04(1:100:end)),lat_end4(1,ind_nor04(1:100:end)),30.0,z_end4(1,ind_nor04(1:100:end)),'filled')
 m_scatter(lon_end5(1,ind_nor05(1:100:end)),lat_end5(1,ind_nor05(1:100:end)),30.0,z_end4(1,ind_nor05(1:100:end)),'filled')
 m_scatter(lon_end6(1,ind_nor06(1:100:end)),lat_end6(1,ind_nor06(1:100:end)),30.0,z_end6(1,ind_nor06(1:100:end)),'filled')
 clim([-340 0])
 colormap(jet)
 ax.position=[0.05 0.69 0.92 0.27]
 set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',16,'FontWeight','Normal', 'LineWidth', 2);
 set(gca, 'FontSize', 16)


%figure('Position',[488,45.800,521.800,668])
subplot(142) 
hold on
 m_proj('lambert','lon',[-80 -72.5],'lat',[-47.2 -41.8])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',16);
 title('Particles from the South','FontSize',16)
 decimar=100;
 m_scatter(lon_end1(1,ind_sur01(1:100:end)),lat_end1(1,ind_sur01(1:100:end)),5.0,z_end1(1,ind_sur01(1:100:end)),'filled')
 m_scatter(lon_end2(1,ind_sur02(1:100:end)),lat_end2(1,ind_sur02(1:100:end)),5.0,z_end2(1,ind_sur02(1:100:end)),'filled')
 m_scatter(lon_end3(1,ind_sur03(1:100:end)),lat_end3(1,ind_sur03(1:100:end)),5.0,z_end3(1,ind_sur03(1:100:end)),'filled')
 m_scatter(lon_end4(1,ind_sur04(1:100:end)),lat_end4(1,ind_sur04(1:100:end)),5.0,z_end4(1,ind_sur04(1:100:end)),'filled')
 m_scatter(lon_end5(1,ind_sur05(1:100:end)),lat_end5(1,ind_sur05(1:100:end)),5.0,z_end5(1,ind_sur05(1:100:end)),'filled')
 m_scatter(lon_end6(1,ind_sur06(1:100:end)),lat_end6(1,ind_sur06(1:100:end)),5.0,z_end6(1,ind_sur06(1:100:end)),'filled')
 caxis([-340 0])
 colormap(jet)
 set(gca, 'FontSize', 16)

%figure('Position',[488,45.800,521.800,668])
subplot(143) 
hold on
 m_proj('lambert','lon',[-80 -72.5],'lat',[-47.2 -41.8])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',16);
 title('Particles from the South','FontSize',16)
 decimar=100;
 m_scatter(lon_end1(1,ind_in_mic01(1:100:end)),lat_end1(1,ind_in_mic01(1:100:end)),5.0,z_end1(1,ind_in_mic01(1:100:end)),'filled')
 m_scatter(lon_end2(1,ind_in_mic02(1:100:end)),lat_end2(1,ind_in_mic02(1:100:end)),5.0,z_end2(1,ind_in_mic02(1:100:end)),'filled')
 m_scatter(lon_end3(1,ind_in_mic03(1:100:end)),lat_end3(1,ind_in_mic03(1:100:end)),5.0,z_end3(1,ind_in_mic03(1:100:end)),'filled')
 m_scatter(lon_end4(1,ind_in_mic04(1:100:end)),lat_end4(1,ind_in_mic04(1:100:end)),5.0,z_end4(1,ind_in_mic04(1:100:end)),'filled')
 m_scatter(lon_end5(1,ind_in_mic05(1:100:end)),lat_end5(1,ind_in_mic05(1:100:end)),5.0,z_end5(1,ind_in_mic05(1:100:end)),'filled')
 m_scatter(lon_end6(1,ind_in_mic06(1:100:end)),lat_end6(1,ind_in_mic06(1:100:end)),5.0,z_end6(1,ind_in_mic06(1:100:end)),'filled')
 caxis([-340 0])
 colormap(jet)
 set(gca, 'FontSize', 16)


 %figure('Position',[488,45.800,521.800,668])
 subplot(144)
 hold on
 m_proj('lambert','lon',[-80 -72.5],'lat',[-47.2 -41.8])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',16);
 title('Particles from the South','FontSize',16)
 decimar=100;
 m_scatter(lon_end1(1,ind_in_fior01(1:100:end)),lat_end1(1,ind_in_fior01(1:100:end)),5.0,z_end1(1,ind_in_fior01(1:100:end)),'filled')
 m_scatter(lon_end2(1,ind_in_fior02(1:100:end)),lat_end2(1,ind_in_fior02(1:100:end)),5.0,z_end2(1,ind_in_fior02(1:100:end)),'filled')
 m_scatter(lon_end3(1,ind_in_fior03(1:100:end)),lat_end3(1,ind_in_fior03(1:100:end)),5.0,z_end3(1,ind_in_fior03(1:100:end)),'filled')
 m_scatter(lon_end4(1,ind_in_fior04(1:100:end)),lat_end4(1,ind_in_fior04(1:100:end)),5.0,z_end4(1,ind_in_fior04(1:100:end)),'filled')
 m_scatter(lon_end5(1,ind_in_fior05(1:100:end)),lat_end5(1,ind_in_fior05(1:100:end)),5.0,z_end5(1,ind_in_fior05(1:100:end)),'filled')
 m_scatter(lon_end6(1,ind_in_fior06(1:100:end)),lat_end6(1,ind_in_fior06(1:100:end)),5.0,z_end6(1,ind_in_fior06(1:100:end)),'filled')
 caxis([-340 0])
 colormap(jet)
 set(gca, 'FontSize', 16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 figure('Position',[488,45.800,521.800,668])
 hold on
 m_proj('lambert','lon',[-77 -72],'lat',[-46.5 -41.5])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',16);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the North','FontSize',16)
 decimar=100;
 m_scatter(lon_end7(1,ind_nor07(1:100:end)),lat_end7(1,ind_nor07(1:100:end)),5.0,z_end7(1,ind_nor07(1:100:end)),'filled')
 m_scatter(lon_end8(1,ind_nor08(1:100:end)),lat_end8(1,ind_nor08(1:100:end)),5.0,z_end8(1,ind_nor08(1:100:end)),'filled')
 m_scatter(lon_end9(1,ind_nor09(1:100:end)),lat_end9(1,ind_nor09(1:100:end)),5.0,z_end9(1,ind_nor09(1:100:end)),'filled')
 m_scatter(lon_end10(1,ind_nor10(1:100:end)),lat_end10(1,ind_nor10(1:100:end)),5.0,z_end10(1,ind_nor10(1:100:end)),'filled')
 m_scatter(lon_end11(1,ind_nor11(1:100:end)),lat_end11(1,ind_nor11(1:100:end)),5.0,z_end11(1,ind_nor11(1:100:end)),'filled')
 m_scatter(lon_end12(1,ind_nor12(1:100:end)),lat_end12(1,ind_nor12(1:100:end)),5.0,z_end12(1,ind_nor12(1:100:end)),'filled')
 caxis([-340 0])
 colormap(jet)
 set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',16,'FontWeight','Normal', 'LineWidth', 2);
 set(gca, 'FontSize', 16)


 figure('Position',[488,45.800,521.800,668])
 hold on
 m_proj('lambert','lon',[-80 -72.5],'lat',[-47.2 -41.8])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the South','FontSize',16)
 decimar=100;
 m_scatter(lon_end7(1,ind_sur07(1:100:end)),lat_end7(1,ind_sur07(1:100:end)),5.0,z_end7(1,ind_sur07(1:100:end)),'filled')
 m_scatter(lon_end8(1,ind_sur08(1:100:end)),lat_end8(1,ind_sur08(1:100:end)),5.0,z_end8(1,ind_sur08(1:100:end)),'filled')
 m_scatter(lon_end9(1,ind_sur09(1:100:end)),lat_end9(1,ind_sur09(1:100:end)),5.0,z_end9(1,ind_sur09(1:100:end)),'filled')
 m_scatter(lon_end10(1,ind_sur10(1:100:end)),lat_end10(1,ind_sur10(1:100:end)),5.0,z_end10(1,ind_sur10(1:100:end)),'filled')
 m_scatter(lon_end11(1,ind_sur11(1:100:end)),lat_end11(1,ind_sur11(1:100:end)),5.0,z_end11(1,ind_sur11(1:100:end)),'filled')
 m_scatter(lon_end12(1,ind_sur12(1:100:end)),lat_end12(1,ind_sur12(1:100:end)),5.0,z_end12(1,ind_sur12(1:100:end)),'filled')
 caxis([-340 0])
 colormap(jet)
 set(gca, 'FontSize', 16)




 figure('Position',[488,45.800,521.800,668])
 hold on
 m_proj('lambert','lon',[-80 -72.5],'lat',[-47.2 -41.8])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the MIC','FontSize',16)
 decimar=100;
 m_scatter(lon_end7(1,ind_in_mic07(1:100:end)),lat_end7(1,ind_in_mic07(1:100:end)),5.0,z_end7(1,ind_in_mic07(1:100:end)),'filled')
 m_scatter(lon_end8(1,ind_in_mic08(1:100:end)),lat_end8(1,ind_in_mic08(1:100:end)),5.0,z_end8(1,ind_in_mic08(1:100:end)),'filled')
 m_scatter(lon_end9(1,ind_in_mic09(1:100:end)),lat_end9(1,ind_in_mic09(1:100:end)),5.0,z_end9(1,ind_in_mic09(1:100:end)),'filled')
 m_scatter(lon_end10(1,ind_in_mic10(1:100:end)),lat_end10(1,ind_in_mic10(1:100:end)),5.0,z_end10(1,ind_in_mic10(1:100:end)),'filled')
 m_scatter(lon_end11(1,ind_in_mic11(1:100:end)),lat_end11(1,ind_in_mic11(1:100:end)),5.0,z_end11(1,ind_in_mic11(1:100:end)),'filled')
 m_scatter(lon_end12(1,ind_in_mic12(1:100:end)),lat_end12(1,ind_in_mic12(1:100:end)),5.0,z_end12(1,ind_in_mic12(1:100:end)),'filled')
 caxis([-340 0])
 colormap(jet)
 set(gca, 'FontSize', 16)
 
 figure('Position',[488,45.800,521.800,668])
 hold on
 m_proj('lambert','lon',[-80 -72.5],'lat',[-47.2 -41.8])
 m_gshhs_f('patch',[0.8 0.8 0.8]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particles from the Fjords','FontSize',16)
 decimar=100;
 m_scatter(lon_end7(1,ind_in_fior07(1:100:end)),lat_end7(1,ind_in_fior07(1:100:end)),5.0,z_end7(1,ind_in_fior07(1:100:end)),'filled')
 m_scatter(lon_end8(1,ind_in_fior08(1:100:end)),lat_end8(1,ind_in_fior08(1:100:end)),5.0,z_end8(1,ind_in_fior08(1:100:end)),'filled')
 m_scatter(lon_end9(1,ind_in_fior09(1:100:end)),lat_end9(1,ind_in_fior09(1:100:end)),5.0,z_end9(1,ind_in_fior09(1:100:end)),'filled')
 m_scatter(lon_end10(1,ind_in_fior10(1:100:end)),lat_end10(1,ind_in_fior10(1:100:end)),5.0,z_end10(1,ind_in_fior10(1:100:end)),'filled')
 m_scatter(lon_end11(1,ind_in_fior11(1:100:end)),lat_end11(1,ind_in_fior11(1:100:end)),5.0,z_end11(1,ind_in_fior11(1:100:end)),'filled')
 m_scatter(lon_end12(1,ind_in_fior12(1:100:end)),lat_end12(1,ind_in_fior12(1:100:end)),5.0,z_end12(1,ind_in_fior12(1:100:end)),'filled')
 caxis([-340 0])
 colormap(jet)
 set(gca, 'FontSize', 16)

