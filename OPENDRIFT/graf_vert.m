%Graficos de seccion vertical de las particulas opendrift
clear all
close all
clc

addpath( 'D:\OPENDRIFT\Simualacion_final\Mareas\Indices\')

%Cargar simulaciones de opendrift
load('lon1.mat');load('lat1.mat');load('z1.mat');
lat_ini1=lat1(1,:);
lon_ini1=lon1(1,:);
z_ini1=z1(1,:);
indx1=find(lat_ini1>0);
lat_ini1(indx1)=NaN;
lon_ini1(indx1)=NaN;
z_ini1(indx1)=NaN;

clear lon1 lat1 z1 indx1

load('lon2.mat');load('lat2.mat');load('z2.mat');
lat_ini2=lat2(1,:);
lon_ini2=lon2(1,:);
z_ini2=z2(1,:);
indx2=find(lat_ini2>0);
lat_ini2(indx2)=NaN;
lon_ini2(indx2)=NaN;
z_ini2(indx2)=NaN;

clear lon2 lat2 z2 indx2

load('lon3.mat');load('lat3.mat');load('z3.mat');
lat_ini3=lat3(1,:);
lon_ini3=lon3(1,:);
z_ini3=z3(1,:);
indx3=find(lat_ini3>0);
lat_ini3(indx3)=NaN;
lon_ini3(indx3)=NaN;
z_ini3(indx3)=NaN;

clear lon3 lat3 z3 indx3

load('lon4.mat');load('lat4.mat');load('z4.mat');
lat_ini4=lat4(1,:);
lon_ini4=lon4(1,:);
z_ini4=z4(1,:);
indx4=find(lat_ini4>0);
lat_ini4(indx4)=NaN;
lon_ini4(indx4)=NaN;
z_ini4(indx4)=NaN;

clear lon4 lat4 z4 indx4

load('lon5.mat');load('lat5.mat');load('z5.mat');
lat_ini5=lat5(1,:);
lon_ini5=lon5(1,:);
z_ini5=z5(1,:);
indx5=find(lat_ini5>0);
lat_ini5(indx5)=NaN;
lon_ini5(indx5)=NaN;
z_ini5(indx5)=NaN;

clear lon5 lat5 z5 indx5

load('lon7.mat');load('lat7.mat');load('z7.mat');
lat_ini7=lat7(1,:);
lon_ini7=lon7(1,:);
z_ini7=z7(1,:);
indx7=find(lat_ini7>0);
lat_ini7(indx7)=NaN;
lon_ini7(indx7)=NaN;
z_ini7(indx7)=NaN;

clear lon7 lat7 z7 indx7

load('lon8.mat');load('lat8.mat');load('z8.mat');
lat_ini8=lat8(1,:);
lon_ini8=lon8(1,:);
z_ini8=z8(1,:);
indx8=find(lat_ini8>0);
lat_ini8(indx8)=NaN;
lon_ini8(indx8)=NaN;
z_ini8(indx8)=NaN;

clear lon8 lat8 z8 indx8

load('lon9.mat');load('lat9.mat');load('z9.mat');
lat_ini9=lat9(1,:);
lon_ini9=lon9(1,:);
z_ini9=z9(1,:);
indx9=find(lat_ini9>0);
lat_ini9(indx9)=NaN;
lon_ini9(indx9)=NaN;
z_ini9(indx9)=NaN;

clear lon9 lat9 z9 indx9

load('lon10.mat');load('lat10.mat');load('z10.mat');
lat_ini10=lat10(1,:);
lon_ini10=lon10(1,:);
z_ini10=z10(1,:);
indx10=find(lat_ini10>0);
lat_ini10(indx10)=NaN;
lon_ini10(indx10)=NaN;
z_ini10(indx10)=NaN;

clear lon10 lat10 z10 indx10

load('lon11.mat');load('lat11.mat');load('z11.mat');
lat_ini11=lat11(1,:);
lon_ini11=lon11(1,:);
z_ini11=z11(1,:);
indx11=find(lat_ini11>0);
lat_ini11(indx11)=NaN;
lon_ini11(indx11)=NaN;
z_ini11(indx11)=NaN;

clear lon11 lat11 z11 indx11

lon6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','lon');
lat6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','lat');
z6=ncread('mosa_VM_1mes_horario_back_AS_01-06Enero.nc','z');

lat_ini6=lat6(1,:);
lon_ini6=lon6(1,:);
z_ini6=z6(1,:);
indx6=find(lat_ini6>0);
lat_ini6(indx6)=NaN;
lon_ini6(indx6)=NaN;
z_ini6(indx6)=NaN;

clear lon6 lat6 z6 indx6

lon12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lon');
lat12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','lat');
z12=ncread('mosa_VM_1mes_horario_back_01-06_SinMareas.nc','z');

lat_ini12=lat12(1,:);
lon_ini12=lon12(1,:);
z_ini12=z12(1,:);
indx12=find(lat_ini12>0);
lat_ini12(indx12)=NaN;
lon_ini12(indx12)=NaN;
z_ini12(indx12)=NaN;

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

figure(1)
subplot(241)
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
text(-43.73,-180,'a)','FontSize',25,'FontWeight','bold')
%text(-43.38,-218,'N','FontName','Lucida Fax','FontSize',28,'FontWeight','bold')
%text(-43.78,-218,'S','FontName','Lucida Fax','FontSize',28,'FontWeight','bold')
%xlabel('Latitude')
ylabel('[m]')
xlim([-43.82 -43.35])
set(gca,'xticklabel',' ')
box on
set(gca, 'FontSize', 22)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
%legend([ b ],'North')
text(-43.36,-190,'n=193.009','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(242)
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
%xlabel('Latitude')
text(-43.73,-180,'b)','FontSize',25,'FontWeight','bold')
xlim([-43.82 -43.35])
set(gca,'xticklabel',' ')
set(gca,'yticklabel',' ')
box on
set(gca, 'FontSize', 22)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=1.594.769','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(243)
hold on
plot(lat_ini1(1,:),z_ini1(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini1(1,ind_in_mic01),z_ini1(1,ind_in_mic01),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini2(1,ind_in_mic02),z_ini2(1,ind_in_mic02),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini3(1,ind_in_mic03),z_ini3(1,ind_in_mic03),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini4(1,ind_in_mic04),z_ini4(1,ind_in_mic04),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini5(1,ind_in_mic05),z_ini5(1,ind_in_mic05),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_in_mic06),z_ini6(1,ind_in_mic06),'y.','MarkerSize',10,'LineWidth',5)
title('Inland Sea')
set(gca,'Xdir','reverse')
text(-43.73,-180,'c)','FontSize',25,'FontWeight','bold')
%xlabel('Latitude')
xlim([-43.82 -43.35])
set(gca,'xticklabel',' ')
set(gca,'yticklabel',' ')
box on
set(gca, 'FontSize', 22)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=721.619','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')

subplot(244)
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
text(-43.73,-180,'d)','FontSize',25,'FontWeight','bold')
%xlabel('Latitude')
set(gca,'xticklabel',' ')
set(gca,'yticklabel',' ')
xlim([-43.82 -43.35])
set(gca,'Xdir','reverse')
box on
set(gca, 'FontSize', 22)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
%legend([ b c d e],'norte','sur','mic','Fjords')
text(-43.36,-190,'n=1.130.950','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')

subplot(245)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini7(1,ind_nor07),z_ini7(1,ind_nor07),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_nor08),z_ini8(1,ind_nor08),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_nor09),z_ini9(1,ind_nor09),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_nor10),z_ini10(1,ind_nor10),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_nor11),z_ini11(1,ind_nor11),'b.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_nor12),z_ini12(1,ind_nor12),'b.','MarkerSize',10,'LineWidth',5)
%title('North')
text(-43.73,-180,'e)','FontSize',25,'FontWeight','bold')
text(-43.38,-245,'N','FontName','Lucida Fax','FontSize',22,'FontWeight','bold')
text(-43.78,-245,'S','FontName','Lucida Fax','FontSize',22,'FontWeight','bold')
xlabel('Latitude')
ylabel('[m]')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 22)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
%legend([ b ],'North')
text(-43.36,-190,'n=565.118','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(246)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini7(1,ind_sur07),z_ini7(1,ind_sur07),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_sur08),z_ini8(1,ind_sur08),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_sur09),z_ini9(1,ind_sur09),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_sur10),z_ini10(1,ind_sur10),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_sur11),z_ini11(1,ind_sur11),'g.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_sur12),z_ini12(1,ind_sur12),'g.','MarkerSize',10,'LineWidth',5)
%title('South')
set(gca,'yticklabel',' ')
xlabel('Latitude')
text(-43.73,-180,'f)','FontSize',25,'FontWeight','bold')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 22)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=1.563.852','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(247)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini7(1,ind_in_mic07),z_ini7(1,ind_in_mic07),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_in_mic08),z_ini8(1,ind_in_mic08),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_in_mic09),z_ini9(1,ind_in_mic09),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_in_mic10),z_ini10(1,ind_in_mic10),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_in_mic11),z_ini11(1,ind_in_mic11),'y.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_in_mic12),z_ini12(1,ind_in_mic12),'y.','MarkerSize',10,'LineWidth',5)
%title('Inland Sea')
set(gca,'yticklabel',' ')
set(gca,'Xdir','reverse')
text(-43.73,-180,'g)','FontSize',25,'FontWeight','bold')
xlabel('Latitude')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 22)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
text(-43.36,-190,'n=688.553','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')
subplot(248)
hold on
plot(lat_ini7(1,:),z_ini7(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
e=plot(lat_ini7(1,ind_in_fior07),z_ini7(1,ind_in_fior07),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini8(1,ind_in_fior08),z_ini8(1,ind_in_fior08),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini9(1,ind_in_fior09),z_ini9(1,ind_in_fior09),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini10(1,ind_in_fior10),z_ini10(1,ind_in_fior10),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini11(1,ind_in_fior11),z_ini11(1,ind_in_fior11),'r.','MarkerSize',10,'LineWidth',5)
plot(lat_ini12(1,ind_in_fior12),z_ini12(1,ind_in_fior12),'r.','MarkerSize',10,'LineWidth',5)
%title('Fjords')
text(-43.73,-180,'h)','FontSize',25,'FontWeight','bold')
xlabel('Latitude')
set(gca,'yticklabel',' ')
xlim([-43.82 -43.35])
set(gca,'Xdir','reverse')
box on
set(gca, 'FontSize', 22)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',22,'FontWeight','Normal', 'LineWidth', 2);
%legend([ b c d e],'norte','sur','mic','Fjords')
text(-43.36,-190,'n=822.832','FontName','DejaVu Sans Mono','FontSize',14,'FontWeight','bold')


