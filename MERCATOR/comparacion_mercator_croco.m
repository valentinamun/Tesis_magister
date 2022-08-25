 %Comparacion de modelo Mercator con modelo CROCO
clear all
close all
addpath= '/home/valentina/Escritorio/Tesis1/Avance_Tesis/';

% Cargar datos modelo Mercator

dir='/home/valentina/Escritorio/Tesis1/Mercator/';

% reading NCEP2 files
file1 = [dir 'PCUC_2019_01.nc'];

ncdisp(file1);

%Cargar los datos 2020
lon=ncread([file1],'longitude');
lat=ncread([file1],'latitude');
time1=ncread([file1],'time');
sal1=ncread([file1],'so');
temp1=ncread([file1],'thetao');
depth=ncread([file1],'depth');
vo1=ncread([file1],'vo');
uo1=ncread([file1],'uo');

%Tiempo de datos
T1 = datetime(1950,1,1) + hours(time1);
T1.Format = 'yyyy-MM-dd';
%Seccion mes de feb,may,julio,nov del año 2020 modelo mercator

%Promedio mensual de febrero,mayo,julio,noviembre

%Febrero
feb_t=temp1(:,:,:,32:60);
feb_s=sal1(:,:,:,32:60);
feb_v=vo1(:,:,:,32:60);
feb_tt=mean(feb_t,4);
feb_ss=mean(feb_s,4);
feb_vv=mean(feb_v,4);

%Mayo
may_t=temp1(:,:,:,122:152);
may_s=sal1(:,:,:,122:152);
may_v=vo1(:,:,:,122:152);
may_tt=mean(may_t,4);
may_ss=mean(may_s,4);
may_vv=mean(may_v,4);

%Julio
jul_t=temp1(:,:,:,183:213);
jul_s=sal1(:,:,:,183:213);
jul_v=vo1(:,:,:,183:213);
jul_tt=mean(jul_t,4);
jul_ss=mean(jul_s,4);
jul_vv=mean(jul_v,4);

%Noviembre
nov_t=temp1(:,:,:,306:335);
nov_s=sal1(:,:,:,306:335);
nov_v=vo1(:,:,:,306:335);
nov_tt=mean(nov_t,4);
nov_ss=mean(nov_s,4);
nov_vv=mean(nov_v,4);

%Seccion Febrero a -40.5 Sur

t_f=squeeze(feb_tt(:,55,:));
s_f=squeeze(feb_ss(:,55,:));
v_f=squeeze(feb_vv(:,55,:));

%Transformar a Distancia las longitudes.

%Convertir de grados a km seccion 1

lon1=double(lon(1:31));
lat1=-40.5;
%lon1=flipud(lon1);
    
for i=1:length(lon1)-1
        DISTANCIA(i)=deg2km(distance(lat1,lon(i),lat1,lon(i+1)));
       %DISTANCIA(i)=deg2km(distance(lon1(i),lat,lon1(i+1),lat));
end

DISTANCIA_ACUMULADA=cumsum(DISTANCIA);    
Dis=[0;DISTANCIA_ACUMULADA'];
Dis=flipud(Dis)


figure()
subplot(131)
pcolor(Dis,depth(1:31),t_f(1:31,1:31)')
shading interp 
title('Temperatura a -40.5 Feb/2020')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h = colorbar;
ylabel(h,'[°C]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'Fontsize',14)
subplot(132)
pcolor(Dis,depth(1:31),s_f(1:31,1:31)')
shading interp
title('Salinidad a -40.5 Feb/2020')
xlabel('Distancia [km]')
h = colorbar;
ylabel(h,'PSU')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.5])
set(gca,'Fontsize',14)
subplot(133)
pcolor(Dis,depth(1:31),v_f(1:31,1:31)')
shading interp
title('Velocidad V a -40.5 Feb/2020')
xlabel('Distancia [km]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h=colorbar;
ylabel(h,'[m/s]')
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'Fontsize',14)


% a -40.5 Sur Mayo

t_m=squeeze(may_tt(:,55,:));
s_m=squeeze(may_ss(:,55,:));
v_m=squeeze(may_vv(:,55,:));


figure()
subplot(131)
pcolor(Dis,depth(1:31),t_m(1:31,1:31)')
shading interp 
title('Temperatura a -40.5 May/2020')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h = colorbar;
ylabel(h,'[°C]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'Fontsize',14)
subplot(132)
pcolor(Dis,depth(1:31),s_m(1:31,1:31)')
shading interp
title('Salinidad a -40.5 May/2020')
xlabel('Distancia [km]')
h = colorbar;
ylabel(h,'PSU')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.5])
set(gca,'Fontsize',14)
subplot(133)
pcolor(Dis,depth(1:31),v_m(1:31,1:31)')
shading interp
title('Velocidad V a -40.5 May/2020')
xlabel('Distancia [km]')
colorbar
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h = colorbar;
ylabel(h,'[m/s]')
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'Fontsize',14)


% a -40.5 Sur Julio

t_j=squeeze(jul_tt(:,55,:));
s_j=squeeze(jul_ss(:,55,:));
v_j=squeeze(jul_vv(:,55,:));


figure()
subplot(131)
pcolor(Dis,depth(1:31),t_j(1:31,1:31)')
shading interp 
title('Temperatura a -40.5 Jul/2020')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h = colorbar;
ylabel(h,'[°C]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'Fontsize',14)
subplot(132)
pcolor(Dis,depth(1:31),s_j(1:31,1:31)')
shading interp
title('Salinidad a -40.5 Jul/2020')
xlabel('Distancia [km]')
h = colorbar;
ylabel(h,'PSU')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.5])
set(gca,'Fontsize',14)
subplot(133)
pcolor(Dis,depth(1:31),v_j(1:31,1:31)')
shading interp
title('Velocidad V a -40.5 Jul/2020')
xlabel('Distancia [km]')
colorbar
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h = colorbar;
ylabel(h,'[m/s]')
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'Fontsize',14)


% a -40.5 Sur Noviembre

t_n=squeeze(nov_tt(:,55,:));
s_n=squeeze(nov_ss(:,55,:));
v_n=squeeze(nov_vv(:,55,:));


figure()
subplot(131)
pcolor(Dis,depth(1:31),t_n(1:31,1:31)')
shading interp 
title('Temperatura a -40.5 Nov/2020')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h = colorbar;
ylabel(h,'[°C]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'Fontsize',14)
subplot(132)
pcolor(Dis,depth(1:31),s_n(1:31,1:31)')
shading interp
title('Salinidad a -40.5 Nov/2020')
xlabel('Distancia [km]')
h = colorbar;
ylabel(h,'PSU')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.5])
set(gca,'Fontsize',14)
subplot(133)
pcolor(Dis,depth(1:31),v_n(1:31,1:31)')
shading interp
title('Velocidad V a -40.5 Nov/2020')
xlabel('Distancia [km]')
colorbar
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h = colorbar;
ylabel(h,'[m/s]')
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'Fontsize',14)

%% Seccion para el año 2021 del modelo mercator a 40°S

clear all
close all
addpath= '/home/valentina/Escritorio/Tesis1/';

% Cargar datos modelo Mercator

dir='/home/valentina/Escritorio/Tesis1/Mercator/';

% reading NCEP2 files
file1 = [dir 'PCUC_2019_01.nc'];
file2 = [dir 'PCUC_2021_01.nc'];

ncdisp(file1);
ncdisp(file2);

%Cargar los datos 2020-2021
lon=ncread([file1],'longitude');
lat=ncread([file1],'latitude');
time2=ncread([file2],'time');
sal2=ncread([file2],'so');
temp2=ncread([file2],'thetao');
depth=ncread([file1],'depth');
vo2=ncread([file2],'vo');
uo2=ncread([file2],'uo');


T2 = datetime(1950,1,1) + hours(time2);
T2.Format = 'yyyy-MM-dd';

%Febrero

feb_t=temp2(:,:,:,33:60);
feb_s=sal2(:,:,:,33:60);
feb_v=vo2(:,:,:,33:60);
feb_tt=mean(feb_t,4);
feb_ss=mean(feb_s,4);
feb_vv=mean(feb_v,4);

%Mayo
may_t=temp2(:,:,:,122:152);
may_s=sal2(:,:,:,122:152);
may_v=vo2(:,:,:,122:152);
may_tt=mean(may_t,4);
may_ss=mean(may_s,4);
may_vv=mean(may_v,4);

%Julio
jul_t=temp2(:,:,:,183:213);
jul_s=sal2(:,:,:,183:213);
jul_v=vo2(:,:,:,183:213);
jul_tt=mean(jul_t,4);
jul_ss=mean(jul_s,4);
jul_vv=mean(jul_v,4);

%Noviembre
nov_t=temp2(:,:,:,306:335);
nov_s=sal2(:,:,:,306:335);
nov_v=vo2(:,:,:,306:335);
nov_tt=mean(nov_t,4);
nov_ss=mean(nov_s,4);
nov_vv=mean(nov_v,4);

%Seccion Febrero a -40.5 Sur

t_f=squeeze(feb_tt(:,55,:));
s_f=squeeze(feb_ss(:,55,:));
v_f=squeeze(feb_vv(:,55,:));

%Seccion Mayo a -40.5 Sur
t_m=squeeze(may_tt(:,55,:));
s_m=squeeze(may_ss(:,55,:));
v_m=squeeze(may_vv(:,55,:));

% a -40.5 Sur Julio

t_j=squeeze(jul_tt(:,55,:));
s_j=squeeze(jul_ss(:,55,:));
v_j=squeeze(jul_vv(:,55,:));


% a -40.5 Sur Noviembre

t_n=squeeze(nov_tt(:,55,:));
s_n=squeeze(nov_ss(:,55,:));
v_n=squeeze(nov_vv(:,55,:));


%Transformar a Distancia las longitudes.

%Convertir de grados a km seccion 1

lon1=double(lon(1:31));
lat1=-40.5;
%lon1=flipud(lon1);
    
for i=1:length(lon1)-1
        DISTANCIA(i)=deg2km(distance(lat1,lon(i),lat1,lon(i+1)));
       %DISTANCIA(i)=deg2km(distance(lon1(i),lat,lon1(i+1),lat));
end

DISTANCIA_ACUMULADA=cumsum(DISTANCIA);    
Dis=[0;DISTANCIA_ACUMULADA'];
Dis=flipud(Dis)


%% Modelo CROCO Seccion 40°S

clear all
close all

dir1='/home/valentina/Escritorio/Tesis1/';

file3 = [dir1 'mosa_RIO_avg_Y8S1.nc'];
file4 = [dir1 'mosa_RIO_avg_Y8S2.nc'];

ncdisp(file3);
ncdisp(file4);

lon_c=ncread([file3],'lon_rho');
lat_c=ncread([file3],'lat_rho');
lon_c=lon_c(161:end,1);
lat_c=lat_c(1,240:end);

%Secciones verticales a 40.5 Sur

C= repmat(lat_c,[1 length(-40.5)]);
 [valor_min,idx_cercano3] = min(abs(C-(-40.5)'));
 lat_cercana = lat_c(idx_cercano3);
 
 
 A= repmat(lon_c,[1 length(-73.5)]);
 [valor_min,idx_cercano2] =min(abs(A-(-73.5)'));
 lon_cercana2 = lon_c(idx_cercano2);


 %Secciones Horizontales para los 12 meses del modelo a -40.5°S
 for i=1:6
 [x1,y1,temp1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon_c(idx_cercano2) -76.0],[lat_c(idx_cercano3) lat_c(idx_cercano3)],'temp',i);
 [~,~,sal1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon_c(idx_cercano2) -76.0],[lat_c(idx_cercano3) lat_c(idx_cercano3)],'salt',i);
 [~,~,v1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon_c(idx_cercano2) -76.0],[lat_c(idx_cercano3) lat_c(idx_cercano3)],'v',i);
 
 [x2,y2,temp2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon_c(idx_cercano2) -76.0],[lat_c(idx_cercano3) lat_c(idx_cercano3)],'temp',i);
 [~,~,sal2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon_c(idx_cercano2) -76.0],[lat_c(idx_cercano3) lat_c(idx_cercano3)],'salt',i);
 [~,~,v2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon_c(idx_cercano2) -76.0],[lat_c(idx_cercano3) lat_c(idx_cercano3)],'v',i);
 end
 

%Guardar archivos en formato .m  
save('temp2.mat','temp2')
save('sal2.mat','sal2')
save('v2.mat','v2')
save('x2.mat','x2')
save('y2.mat','y2')

%Graficos de Prueba

y1=-1*y1;

figure()
pcolor(x1(19:end,:),y1(19:end,:),temp1(19:end,:,2))
shading interp
colorbar
set(gca,'ydir','reverse') 


%% Comparacion CROCO-MERCATOR Seccion 40°S

addpath '/home/valentina/Escritorio/Tesis1/Mercator/dat_secc_croco'


load('temp1.mat'); load('sal1.mat');load('v1.mat');load('x1.mat');load('y1.mat');
load('temp2.mat');load('sal2.mat');load('v2.mat');load('x2.mat');load('y2.mat');


y1=-1*y1;

%Grafico comparacion mes de febrero 2020

figure(1)
subplot(221)
pcolor(Dis,depth(1:31),t_f(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S Feb/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp1(19:end,:,2))
shading interp 
title('Temperatura a 40.5°S Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_f(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),s_f(1:31,1:31)',[34.4:0.1:34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
title('Salinidad a 40.5°S Feb/Mercator')
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.5])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal1(19:end,:,2))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal1(19:end,:,2),[34.4:0.1:34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([33.0 34.5])
set(gca,'Fontsize',14)
axis tight


%Figura de la componente V de la velocidad febrero 2020
cmap= colormap_cpt('Balance.cpt');

figure(2)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_f(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_f(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad V a 40.5°S Feb/Mercator')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-0.2 0.2])
set(gca,'Fontsize',14)
axis tight

subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v1(19:end,:,2))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v1(19:end,:,2),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Feb/CROCO')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([-0.2 0.2])
set(gca,'Fontsize',14)
axis tight


%Grafico comparacion mes de mayo 2020

figure(3)
subplot(221)
pcolor(Dis,depth(1:31),t_m(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S May/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp1(19:end,:,5))
shading interp 
title('Temperatura a 40.5°S May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_m(1:31,1:31)')
shading interp
title('Salinidad a 40.5°S May/Mercator')
C = contour(Dis,depth(1:31),s_m(1:31,1:31)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal1(19:end,:,5))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal1(19:end,:,5),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight

%Grafico de la Velocidad V mes de may 2020

figure(4)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_m(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_m(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
title('Velocidad V a 40.5°S May/Mercator')
colormap(cmap)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v1(19:end,:,5))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v1(19:end,:,5),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight


%Grafico comparacion mes de julio 2020

figure(5)
subplot(221)
pcolor(Dis,depth(1:31),t_j(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S Jul/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp2(19:end,:,1))
shading interp 
title('Temperatura a 40.5°S Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_j(1:31,1:31)')
shading interp
title('Salinidad a 40.5°S Jul/Mercator')
C = contour(Dis,depth(1:31),s_j(1:31,1:31)',[34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal2(19:end,:,1))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal2(19:end,:,1),[34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight

%Velocidad Julio 2020

figure(6)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_j(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_j(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad V a 40.5°S Jul/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-0.2 0.2])
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v2(19:end,:,1))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v2(19:end,:,1),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight

%Grafico comparacion mes de noviembre 2020

figure(7)
subplot(221)
pcolor(Dis,depth(1:31),t_n(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S Nov/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp2(19:end,:,4))
shading interp 
title('Temperatura a 40.5°S Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_n(1:31,1:31)')
shading interp
title('Salinidad a 40.5°S Nov/Mercator')
C = contour(Dis,depth(1:31),s_n(1:31,1:31)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal2(19:end,:,4))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal2(19:end,:,4),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight


%Velocidad nov 2020

figure(8)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_n(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_n(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Nov/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v2(19:end,:,4))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v2(19:end,:,4),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Grafico comparacion Mes de febrero 2021

figure(1)
subplot(221)
pcolor(Dis,depth(1:31),t_f(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S Feb/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp1(19:end,:,2))
shading interp 
title('Temperatura a 40.5°S Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_f(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),s_f(1:31,1:31)',[34.4:0.1:34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
title('Salinidad a 40.5°S Feb/Mercator')
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.5])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal1(19:end,:,2))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal1(19:end,:,2),[34.4:0.1:34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([33.0 34.5])
set(gca,'Fontsize',14)
axis tight


%Figura de la componente V de la velocidad febrero 2021
cmap= colormap_cpt('Balance.cpt');

figure(2)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_f(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_f(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad V a 40.5°S Feb/Mercator')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-0.2 0.2])
set(gca,'Fontsize',14)
axis tight

subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v1(19:end,:,2))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v1(19:end,:,2),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Feb/CROCO')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([-0.2 0.2])
set(gca,'Fontsize',14)
axis tight


%Grafico comparacion mes de mayo 2021
figure(3)
subplot(221)
pcolor(Dis,depth(1:31),t_m(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S May/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp1(19:end,:,5))
shading interp 
title('Temperatura a 40.5°S May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_m(1:31,1:31)')
shading interp
title('Salinidad a 40.5°S May/Mercator')
C = contour(Dis,depth(1:31),s_m(1:31,1:31)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal1(19:end,:,5))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal1(19:end,:,5),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight

%Grafico de la Velocidad V mes de may 2021

figure(4)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_m(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_m(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
title('Velocidad V a 40.5°S May/Mercator')
colormap(cmap)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v1(19:end,:,5))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v1(19:end,:,5),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5 May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight



%Grafico comparacion mes de julio 2021

figure(5)
subplot(221)
pcolor(Dis,depth(1:31),t_j(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S Jul/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp2(19:end,:,1))
shading interp 
title('Temperatura a 40.5°S Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
box off
caxis([6 16])
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_j(1:31,1:31)')
shading interp
title('Salinidad a 40.5°S Jul/Mercator')
C = contour(Dis,depth(1:31),s_j(1:31,1:31)',[34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal2(19:end,:,1))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal2(19:end,:,1),[34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight

%Velocidad Julio 2021

figure(6)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_j(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_j(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad V a 40.5°S Jul/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-0.2 0.2])
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v2(19:end,:,1))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v2(19:end,:,1),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight


%Grafico comparacion mes de noviembre 2021

figure(7)
subplot(221)
pcolor(Dis,depth(1:31),t_n(1:31,1:31)')
shading interp 
title('Temperatura a 40.5°S Nov/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(222)
pcolor(x1(19:end,:),y1(19:end,:),temp2(19:end,:,4))
shading interp 
title('Temperatura a 40.5°S Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([6 16])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:31),s_n(1:31,1:31)')
shading interp
title('Salinidad a 40.5°S Nov/Mercator')
C = contour(Dis,depth(1:31),s_n(1:31,1:31)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
axis tight
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x1(19:end,:),y1(19:end,:),sal2(19:end,:,4))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),sal2(19:end,:,4),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad a 40.5°S Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight


%Velocidad nov 2020

figure(8)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_n(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_n(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Nov/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v2(19:end,:,4))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v2(19:end,:,4),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight


%Velocidad nov 2021

figure(9)
subplot(121)
hold on
pcolor(Dis,depth(1:31),v_n(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),v_n(1:31,1:31)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Nov/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x1(19:end,:),y1(19:end,:),v2(19:end,:,4))
shading interp 
C = contour(x1(19:end,:),y1(19:end,:),v2(19:end,:,1),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad V a 40.5°S Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
caxis([-0.2 0.2])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
axis tight


%% Comparacion seccion de la Boca del Guafo 2020

clear all
close all
addpath= '/home/valentina/Escritorio/Tesis1/Avance_Tesis/';

%Cargar datos modelo Mercator

dir='/home/valentina/Escritorio/Tesis1/Mercator/';
file1 = [dir 'PCUC_2019_01.nc'];
ncdisp(file1);

%Cargar los datos 2020
lon=ncread([file1],'longitude');
lat=ncread([file1],'latitude');
time1=ncread([file1],'time');
sal1=ncread([file1],'so');
temp1=ncread([file1],'thetao');
depth=ncread([file1],'depth');
vo1=ncread([file1],'vo');
uo1=ncread([file1],'uo');

%Promedio Mensual de febrero, mayo, julio, junio del 2020

%Febrero
feb_t=temp1(:,:,:,32:60);
feb_s=sal1(:,:,:,32:60);
feb_u=uo1(:,:,:,32:60);
feb_tt=mean(feb_t,4);
feb_ss=mean(feb_s,4);
feb_uu=mean(feb_u,4);

%Mayo
may_t=temp1(:,:,:,122:152);
may_s=sal1(:,:,:,122:152);
may_u=uo1(:,:,:,122:152);
may_tt=mean(may_t,4);
may_ss=mean(may_s,4);
may_uu=mean(may_u,4);

%Julio
jul_t=temp1(:,:,:,183:213);
jul_s=sal1(:,:,:,183:213);
jul_u=uo1(:,:,:,183:213);
jul_tt=mean(jul_t,4);
jul_ss=mean(jul_s,4);
jul_uu=mean(jul_u,4);

%Noviembre
nov_t=temp1(:,:,:,306:335);
nov_s=sal1(:,:,:,306:335);
nov_u=uo1(:,:,:,306:335);
nov_tt=mean(nov_t,4);
nov_ss=mean(nov_s,4);
nov_uu=mean(nov_u,4);


%Seccion Febrero 2020

t_f=squeeze(feb_tt(23,:,:));
s_f=squeeze(feb_ss(23,:,:));
u_f=squeeze(feb_uu(23,:,:));

%Seccion Mayo 2020
t_m=squeeze(may_tt(23,:,:));
s_m=squeeze(may_ss(23,:,:));
u_m=squeeze(may_uu(23,:,:));

%Seccion Julio 2020

t_j=squeeze(jul_tt(23,:,:));
s_j=squeeze(jul_ss(23,:,:));
u_j=squeeze(jul_uu(23,:,:));

%Seccion Noviembre 2020

t_n=squeeze(nov_tt(23,:,:));
s_n=squeeze(nov_ss(23,:,:));
u_n=squeeze(nov_uu(23,:,:));


%Transformar a Distancia las longitudes.

%Convertir de grados a km seccion 1
lat1=double(lat(15:21));
lon1=lon(23);
    
for i=1:length(lat1)-1
        DISTANCIA(i)=deg2km(distance(lat1(i),lon1,lat1(i+1),lon1));
       %DISTANCIA(i)=deg2km(distance(lon1(i),lat,lon1(i+1),lat));
end

DISTANCIA_ACUMULADA=cumsum(DISTANCIA);    
Dis=[0;DISTANCIA_ACUMULADA'];
Dis=flipud(Dis)


figure()
subplot(121)
pcolor(lat1,depth(1:27),t_f(15:21,1:27)')
shading interp
set(gca,'Ydir','reverse')
title('Sección de temperatura -43.5')
colorbar
subplot(122)
pcolor(Dis,depth(1:27),t_f(15:21,1:27)')
shading interp
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
title('Sección de temperatura -43.5')
colorbar


%% Comparacion seccion de la Boca del Guafo 2021

clear all
close all
addpath= '/home/valentina/Escritorio/Tesis1/';

%Cargar datos modelo Mercator
dir='/home/valentina/Escritorio/Tesis1/Mercator/';
file2 = [dir 'PCUC_2021_01.nc'];
ncdisp(file2);

%Cargar los datos 2021
lon=ncread([file2],'longitude');
lat=ncread([file2],'latitude');
time2=ncread([file2],'time');
sal2=ncread([file2],'so');
temp2=ncread([file2],'thetao');
depth=ncread([file2],'depth');
vo2=ncread([file2],'vo');
uo2=ncread([file2],'uo');

%Tiempo de los datos
T2 = datetime(1950,1,1) + hours(time2);
T2.Format = 'yyyy-MM-dd';

%Febrero
feb_t=temp2(:,:,:,33:60);
feb_s=sal2(:,:,:,33:60);
feb_u=uo2(:,:,:,33:60);
feb_tt=mean(feb_t,4);
feb_ss=mean(feb_s,4);
feb_uu=mean(feb_u,4);

%Mayo
may_t=temp2(:,:,:,122:152);
may_s=sal2(:,:,:,122:152);
may_u=uo2(:,:,:,122:152);
may_tt=mean(may_t,4);
may_ss=mean(may_s,4);
may_uu=mean(may_u,4);

%Julio
jul_t=temp2(:,:,:,183:213);
jul_s=sal2(:,:,:,183:213);
jul_u=uo2(:,:,:,183:213);
jul_tt=mean(jul_t,4);
jul_ss=mean(jul_s,4);
jul_uu=mean(jul_u,4);

%Noviembre
nov_t=temp2(:,:,:,306:335);
nov_s=sal2(:,:,:,306:335);
nov_u=uo2(:,:,:,306:335);
nov_tt=mean(nov_t,4);
nov_ss=mean(nov_s,4);
nov_uu=mean(nov_u,4);

%Seccion Febrero 2021
t_f=squeeze(feb_tt(23,:,:));
s_f=squeeze(feb_ss(23,:,:));
u_f=squeeze(feb_uu(23,:,:));

%Seccion Mayo 2021
t_m=squeeze(may_tt(23,:,:));
s_m=squeeze(may_ss(23,:,:));
u_m=squeeze(may_uu(23,:,:));

%Seccion Julio 2021
t_j=squeeze(jul_tt(23,:,:));
s_j=squeeze(jul_ss(23,:,:));
u_j=squeeze(jul_uu(23,:,:));

%Seccion Noviembre 2021
t_n=squeeze(nov_tt(23,:,:));
s_n=squeeze(nov_ss(23,:,:));
u_n=squeeze(nov_uu(23,:,:));

%Transformar a Distancia las longitudes.

%Convertir de grados a km seccion 1
lat1=double(lat(15:21));
lon1=lon(23);
    
for i=1:length(lat1)-1
        DISTANCIA(i)=deg2km(distance(lat1(i),lon1,lat1(i+1),lon1));
       %DISTANCIA(i)=deg2km(distance(lon1(i),lat,lon1(i+1),lat));
end

DISTANCIA_ACUMULADA=cumsum(DISTANCIA);    
Dis=[0;DISTANCIA_ACUMULADA'];
Dis=flipud(Dis)


%% Modelo CROCO Sección Boca del Guafo 2020

clear all
close all

dir1='/home/valentina/Escritorio/Tesis1/Avance_Tesis/';

file3 = [dir1 'mosa_RIO_avg_Y8S1.nc'];
file4 = [dir1 'mosa_RIO_avg_Y8S2.nc'];

ncdisp(file3);
ncdisp(file4);

lon_c=ncread([file3],'lon_rho');
lat_c=ncread([file3],'lat_rho');
lon_c=lon_c(161:end,1);
lat_c=lat_c(1,240:end);

%Secciones verticales a 40.5 Sur

A= repmat(lat_c,[1 length(-43.376)]);
 [valor_min,idx_cercano1] = min(abs(A-(-43.376)'));
 lat_cercana1 = lat_c(idx_cercano1);

B= repmat(lat_c,[1 length(-43.810)]);
 [valor_min,idx_cercano2] = min(abs(B-(-43.810)'));
 lat_cercana2 = lat_c(idx_cercano2);
  

%Secciones Horizontales para los 12 meses del modelo CROCO
 for i=1:6
 [x3,y3,temp3(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[-74.1045 -74.1045],[lat_c(idx_cercano1) lat_c(idx_cercano2)],'temp',i);
 [~,~,sal3(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[-74.1045 -74.1045],[lat_c(idx_cercano1) lat_c(idx_cercano2)],'salt',i);
 [~,~,v3(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[-74.1045 -74.1045],[lat_c(idx_cercano1) lat_c(idx_cercano2)],'u',i);
 
 [x4,y4,temp4(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[-74.1045 -74.1045],[lat_c(idx_cercano1) lat_c(idx_cercano2)],'temp',i);
 [~,~,sal4(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[-74.1045 -74.1045],[lat_c(idx_cercano1) lat_c(idx_cercano2)],'salt',i);
 [~,~,v4(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[-74.1045 -74.1045],[lat_c(idx_cercano1) lat_c(idx_cercano2)],'u',i);
 end

%Graficos de Prueba

y3=-1*y3;

figure()
pcolor(x3,y3,v3(:,:,2))
shading interp
colorbar
set(gca,'ydir','reverse') 

%Guardar archivos en formato .m  
 save('temp3.mat','temp3')
 save('sal3.mat','sal3')
 save('v3.mat','v3')
 save('x3.mat','x3')
 save('y3.mat','y3')

%% Comparacion CROCO-MERCATOR Boca del Guafo.

addpath '/home/valentina/Escritorio/Tesis1/Mercator/dat_secc_croco'

load('temp3.mat'); load('sal3.mat');load('v3.mat');load('x3.mat');load('y3.mat');
load('temp4.mat');load('sal4.mat');load('v4.mat');load('x4.mat');load('y4.mat');


y3=-1*y3;

%Seccion Febrero 2020

figure(1)
subplot(221)
pcolor(Dis,depth(1:27),t_f(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo Feb/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
xlim([0 58])
ylim([0 230])
box off
caxis([9 14])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x3,y3,temp3(:,:,2))
shading interp 
title('Temperatura Boca del Guafo Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([9 14])
xlim([0 58])
ylim([0 230])
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_f(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_f(15:21,1:27)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
title('Salinidad Boca del Guafo Feb/Mercator')
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
xlim([0 58])
ylim([0 230])
caxis([33.0 34.5])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x3,y3,sal3(:,:,2))
shading interp 
C = contour(x3,y3,sal3(:,:,2),[34.3,34.4,34,5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([33.0 34.5])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Figura de la componente V de la velocidad febrero 2020
cmap= colormap_cpt('Balance.cpt');

figure(2)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_f(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_f(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad U Boca del Guafo Feb/Mercator')
set(gca,'Ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-.1 0.1])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(122)
hold on
pcolor(x3,y3,v3(:,:,2))
shading interp 
C = contour(x3,y3,v3(:,:,2),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Feb/CROCO')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([-0.1 0.1])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Seccion Mayo 2020

figure(3)
subplot(221)
pcolor(Dis,depth(1:27),t_m(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo May/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 14])
set(gca,'TickDir','out')
box off
xlim([0 58])
ylim([0 230])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x3,y3,temp3(:,:,5))
shading interp 
title('Temperatura Boca del Guafo May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 14])
xlim([0 58])
ylim([0 230])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_m(15:21,1:27)')
shading interp
title('Salinidad Boca del Guafo May/Mercator')
C = contour(Dis,depth(1:27),s_m(15:21,1:27)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
xlim([0 58])
ylim([0 230])
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x3,y3,sal3(:,:,5))
shading interp 
C = contour(x3,y3,sal3(:,:,5),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])



%Grafico de la Velocidad V mes de may 2020

figure(4)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_m(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_m(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
title('Velocidad U Boca del Guafo May/Mercator')
colormap(cmap)
set(gca,'Ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
xlim([0 58])
ylim([0 230])
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x3,y3,v3(:,:,5))
shading interp 
C = contour(x3,y3,v3(:,:,5),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Seccion Julio 2020

y4=-1*y4;

figure(5)
subplot(221)
pcolor(Dis,depth(1:27),t_j(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo Jul/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([9 11])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(222)
pcolor(x4,y4,temp4(:,:,1))
shading interp 
title('Temperatura Boca del Guafo Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([9 11])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_j(15:21,1:27)')
shading interp
title('Salinidad Boca del Guafo Jul/Mercator')
C = contour(Dis,depth(1:27),s_j(15:21,1:27)',[34.0,34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
xlim([0 58])
ylim([0 230])
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x4,y4,sal4(:,:,1))
shading interp 
C = contour(x4,y4,sal4(:,:,1),[34.0,34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Velocidad Julio 2020

figure(6)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_j(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_j(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad U Boca del Guafo Jul/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-0.1 0.1])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(122)
hold on
pcolor(x4,y4,v4(:,:,1))
shading interp 
C = contour(x4,y4,v4(:,:,1),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Seccion Noviembre 2020

figure(7)
subplot(221)
pcolor(Dis,depth(1:27),t_n(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo Nov/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 11])
set(gca,'TickDir','out')
xlim([0 58])
ylim([0 230])
box off
set(gca,'Fontsize',14)
subplot(222)
pcolor(x4,y4,temp4(:,:,4))
shading interp 
title('Temperatura Boca del Guafo Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 11])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_n(15:21,1:27)')
shading interp
title('Salinidad Boca del Guafo Nov/Mercator')
C = contour(Dis,depth(1:27),s_n(15:21,1:27)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'Ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(224)
hold on
pcolor(x4,y4,sal4(:,:,4))
shading interp 
C = contour(x4,y4,sal4(:,:,1),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])


%Velocidad nov 2020

figure(8)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_n(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_n(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Nov/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(122)
hold on
pcolor(x4,y4,v4(:,:,4))
shading interp 
C = contour(x4,y4,v4(:,:,4),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Boca del Guafo Seccion 2021

y3=-1*y3;

%Seccion Febrero 2021

figure(1)
subplot(221)
pcolor(Dis,depth(1:27),t_f(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo Feb/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
xlim([0 58])
ylim([0 230])
box off
caxis([9 14])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x3,y3,temp3(:,:,2))
shading interp 
title('Temperatura Boca del Guafo Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([9 14])
xlim([0 58])
ylim([0 230])
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_f(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_f(15:21,1:27)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
title('Salinidad Boca del Guafo Feb/Mercator')
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
xlim([0 58])
ylim([0 230])
caxis([33.0 34.5])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x3,y3,sal3(:,:,2))
shading interp 
C = contour(x3,y3,sal3(:,:,2),[34.3,34.4,34,5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo Feb/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([33.0 34.5])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Figura de la componente V de la velocidad febrero 2021
cmap= colormap_cpt('Balance.cpt');

figure(2)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_f(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_f(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad U Boca del Guafo Feb/Mercator')
set(gca,'Ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-.1 0.1])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(122)
hold on
pcolor(x3,y3,v3(:,:,2))
shading interp 
C = contour(x3,y3,v3(:,:,2),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Feb/CROCO')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([-0.1 0.1])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Seccion Mayo 2021

figure(3)
subplot(221)
pcolor(Dis,depth(1:27),t_m(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo May/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 14])
set(gca,'TickDir','out')
box off
xlim([0 58])
ylim([0 230])
set(gca,'Fontsize',14)
subplot(222)
pcolor(x3,y3,temp3(:,:,5))
shading interp 
title('Temperatura Boca del Guafo May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 14])
xlim([0 58])
ylim([0 230])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_m(15:21,1:27)')
shading interp
title('Salinidad Boca del Guafo May/Mercator')
C = contour(Dis,depth(1:27),s_m(15:21,1:27)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
xlim([0 58])
ylim([0 230])
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x3,y3,sal3(:,:,5))
shading interp 
C = contour(x3,y3,sal3(:,:,5),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])



%Grafico de la Velocidad V mes de may 2021

figure(4)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_m(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_m(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
title('Velocidad U Boca del Guafo May/Mercator')
colormap(cmap)
set(gca,'Ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
xlim([0 58])
ylim([0 230])
set(gca,'Fontsize',14)
subplot(122)
hold on
pcolor(x3,y3,v3(:,:,5))
shading interp 
C = contour(x3,y3,v3(:,:,5),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo May/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
colormap(cmap)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Seccion Julio 2021

y4=-1*y4;

figure(5)
subplot(221)
pcolor(Dis,depth(1:27),t_j(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo Jul/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([9 11])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(222)
pcolor(x4,y4,temp4(:,:,1))
shading interp 
title('Temperatura Boca del Guafo Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
box off
caxis([9 11])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_j(15:21,1:27)')
shading interp
title('Salinidad Boca del Guafo Jul/Mercator')
C = contour(Dis,depth(1:27),s_j(15:21,1:27)',[34.0,34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)        
h=colorbar;
h.Title.String = "[PSU]";
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
xlim([0 58])
ylim([0 230])
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
subplot(224)
hold on
pcolor(x4,y4,sal4(:,:,1))
shading interp 
C = contour(x4,y4,sal4(:,:,1),[34.0,34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Velocidad Julio 2021

figure(6)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_j(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_j(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Velocidad U Boca del Guafo Jul/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'TickDir','out')
box off
caxis([-0.1 0.1])
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(122)
hold on
pcolor(x4,y4,v4(:,:,1))
shading interp 
C = contour(x4,y4,v4(:,:,1),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Jul/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])

%Seccion Noviembre 2021

figure(7)
subplot(221)
pcolor(Dis,depth(1:27),t_n(15:21,1:27)')
shading interp 
title('Temperatura Boca del Guafo Nov/Mercator')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 11])
set(gca,'TickDir','out')
xlim([0 58])
ylim([0 230])
box off
set(gca,'Fontsize',14)
subplot(222)
pcolor(x4,y4,temp4(:,:,4))
shading interp 
title('Temperatura Boca del Guafo Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[°C]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([9 11])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(223)
hold on
pcolor(Dis,depth(1:27),s_n(15:21,1:27)')
shading interp
title('Salinidad Boca del Guafo Nov/Mercator')
C = contour(Dis,depth(1:27),s_n(15:21,1:27)',[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'Ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(224)
hold on
pcolor(x4,y4,sal4(:,:,4))
shading interp 
C = contour(x4,y4,sal4(:,:,1),[34.3,34.4,34.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Salinidad Boca del Guafo Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[PSU]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([33.0 34.6])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])


%Velocidad nov 2021

figure(8)
subplot(121)
hold on
pcolor(Dis,depth(1:27),u_n(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_n(15:21,1:27)',[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Nov/Mercator')
colormap(cmap)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
set(gca,'Ydir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])
subplot(122)
hold on
pcolor(x4,y4,v4(:,:,4))
shading interp 
C = contour(x4,y4,v4(:,:,4),[-0.5,0,0.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
title('Velocidad U Boca del Guafo Nov/CROCO')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
caxis([-0.1 0.1])
set(gca,'TickDir','out')
box off
set(gca,'Fontsize',14)
xlim([0 58])
ylim([0 230])




















%% Promedio estacional en la seccion de -40.0

clear all
close all
addpath= '/home/valentina/Escritorio/Tesis1/';

% Cargar datos modelo Mercator

dir='/home/valentina/Escritorio/Tesis1/Mercator/';

% reading NCEP2 files
file1 = [dir 'PCUC_2019_01.nc'];
file2 = [dir 'PCUC_2021_01.nc'];

ncdisp(file1);
ncdisp(file2);

%Cargar los datos 2020-2021
lon=ncread([file1],'longitude');
lat=ncread([file1],'latitude');
time1=ncread([file1],'time');
time2=ncread([file2],'time');
sal1=ncread([file1],'so');
sal2=ncread([file2],'so');
temp1=ncread([file1],'thetao');
temp2=ncread([file2],'thetao');
depth=ncread([file1],'depth');
vo1=ncread([file1],'vo');
vo2=ncread([file2],'vo');
uo1=ncread([file1],'uo');
uo2=ncread([file2],'uo');

%Tiempo de datos
T1 = datetime(1950,1,1) + hours(time1);
T1.Format = 'yyyy-MM-dd';






%Promedio mensual del primer mes del 2020
ene=temp1(:,:,:,1:31);
ene_t=mean(ene,4);

feb=temp1(:,:,:,32:60);
feb_t=mean(feb,4);

mar=temp1(:,:,:,61:91);
mar_t=mean(mar,4);

abr=temp1(:,:,:,92:121);
abr_t=mean(abr,4);

may=temp1(:,:,:,122:152);
may_t=mean(may,4);

% jun=temp1(:,:,:,153:182);
% jun_t=mean(jun,4);

jul=temp1(:,:,:,183:213);
jul_t=mean(jul,4);

% ago=temp1(:,:,:,214:244);
% ago_t=mean(ago,4);

% sep=temp1(:,:,:,245:274);
% sep_t=mean(sep,4);

% oct=temp1(:,:,:,275:305);
% oct_t=mean(oct,4);

nov=temp1(:,:,:,306:335);
nov_t=mean(nov,4);

% dic=temp1(:,:,:,336:365);
% dic_t=mean(dic,4);

% 
% 
% ver(:,:,3)=secv2(:,:,6);
%   prom_ver=nanmean(ver,3)


