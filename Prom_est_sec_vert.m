clear all
close all
clc
addpath '/home/valentina/Escritorio/Tesis1'
addpath '/home/valentina/Escritorio/CROCO'
addpath '/home/valentina/Documentos/seawater'

mosa1='mosa_RIO_avg_Y8S1.nc'
mosa2='mosa_RIO_avg_Y8S2.nc'

lat=ncread(mosa1,'lat_rho');
lat=lat(1,240:end);
lon=ncread(mosa1,'lon_rho');
lon=lon(161:end,1);


%% Secciones Verticales Oxy

%Encontrar el punto mas cercano a las posiciones  lon: -74.1045
%lat:-43.3788, -43.8117

C= repmat(lon,[1 length(-74.1045)]);
[valor_min,idx_cercano] =min(abs(C-(-74.1045)'));
lon_cercana = lon(idx_cercano);
C= repmat(lat,[1 length(-43.8117)]);
[valor_min,idx_cercano2] = min(abs(C-(-43.8117)'));
lat_cercana = lat(idx_cercano2);

%encontar las posiciones de la longitud y latitud cercana al anclaje.
pos_lonE1=find(lon==lon_cercana)  
pos_latE2=find(lat==lat_cercana)


for i=1:6;   
[x1,y1,oxy1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'O2',i);
[x1,y1,oxy2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'O2',i);   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Promedios Estacionales Oxy

%Promedio Verano

for k=1:2
    oxy_ver(:,:,k)=oxy1(:,:,k);
end
oxy_ver(:,:,3)=oxy2(:,:,6);
prom_oxy_ver=nanmean(oxy_ver,3);

%Promedio Otoño

for k=1:3
    oxy_oto(:,:,k)=oxy1(:,:,k+2);
end
prom_oxy_oto=nanmean(oxy_oto,3);

%Promedio Invierno

for k=1:2
    oxy_inv(:,:,k)=oxy2(:,:,k);
end
oxy_inv(:,:,3)=oxy1(:,:,6);

prom_oxy_inv=nanmean(oxy_inv,3);

%Promedio Primavera
for k=1:3
    oxy_pri(:,:,k)=oxy2(:,:,k+2);
end
prom_oxy_pri=nanmean(oxy_pri,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Grafico

y1=-1*y1;

prom_oxy_ver=prom_oxy_ver/44.661;
prom_oxy_oto=prom_oxy_oto/44.661;
prom_oxy_pri=prom_oxy_pri/44.661;
prom_oxy_inv=prom_oxy_inv/44.661;

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_oxy_ver)
colormap(jet)
shading interp
C = contour(x1,y1,prom_oxy_ver,[5.0 5.3 5.8 6 6.3],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold'); 
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(1,220,'Lat= [-43.3763 -43.8108] ','Fontsize',13,...
        'FontName','Arial','Color','k')
text(1,215,'Lon=  -74.1000 ','Fontsize',13,...
        'FontName','Arial','Color','k')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_oxy_oto)) max(max(prom_oxy_ver))])
%set(h, 'YTick',5:0.2:6.5);

subplot(142)
hold on
pcolor(x1,y1,prom_oxy_oto)
colormap(jet)
shading interp
C = contour(x1,y1,prom_oxy_oto,[4.5 5.0 5.4 5.8 6 ],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');   
title('Otoño')
%text(3,180,'Lon= -73.9250 ','Fontsize',13,...
        %'FontName','Arial','Color','k')
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_oxy_oto)) max(max(prom_oxy_ver))])
%set(h, 'YTick',5:0.2:6.5);

subplot(143)
hold on
pcolor(x1,y1,prom_oxy_inv)
colormap(jet)
shading interp
C = contour(x1,y1,prom_oxy_inv,[5.3 5.5 5.8 5.9 6 ],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');   
title('Invierno')
%text(3,180,'Lon= -73.9250 ','Fontsize',13,...
        %'FontName','Arial','Color','k')
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_oxy_oto)) max(max(prom_oxy_ver))])
%set(h, 'YTick',5:0.2:6.5);

subplot(144)
hold on
pcolor(x1,y1,prom_oxy_pri)
colormap(jet)
shading interp
C = contour(x1,y1,prom_oxy_pri,[5.5  5.8 6 6.2 6.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
%text(3,180,'Lon= -73.9250 ','Fontsize',13,...
        %'FontName','Arial','Color','k')
ylabel(h, '[ml/L]','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_oxy_oto)) max(max(prom_oxy_ver))])
set(h,'Position', [0.920  0.104  0.016  0.812]);

%% Secciones verticales de Velocidad U

for i=1:6;   
[x2,y2,u1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'u',i);
[x2,y2,u2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'u',i);   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedio Verano

for j=1:2
    u_ver(:,:,j)=u1(:,:,j);
end
u_ver(:,:,3)=u2(:,:,6);
prom_u_ver=nanmean(u_ver,3);

%Promedio Otoño

for j=1:3
    u_oto(:,:,j)=u1(:,:,j+2);
end
prom_u_oto=nanmean(u_oto,3);

%Promedio Invierno

for j=1:2
    u_inv(:,:,j)=u2(:,:,j);
end
u_inv(:,:,3)=u1(:,:,6);

prom_u_inv=nanmean(u_inv,3);

%Promedio Primavera
for j=1:3
    u_pri(:,:,j)=u2(:,:,j+2);
end
prom_u_pri=nanmean(u_pri,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y2=-1*y2;

figure()
subplot(141)
hold on
pcolor(x2,y2,prom_u_ver)
colormap(jet)
shading interp
C = contour(x2,y2,prom_u_ver,[-1 0.0 1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(1,220,'Lat= [-43.4490 -43.6844] ','Fontsize',13,...
        'FontName','Arial','Color','k')
text(1,215,'Lon=  -73.9250 ','Fontsize',13,...
        'FontName','Arial','Color','k')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_u_ver)) max(max(prom_u_inv))])

subplot(142)
hold on
pcolor(x2,y2,prom_u_oto)
colormap(jet)
shading interp
C = contour(x2,y2,prom_u_oto,[-1 0.0 1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
title('Otoño')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_u_ver)) max(max(prom_u_inv))])

subplot(143)
hold on
pcolor(x2,y2,prom_u_inv)
colormap(jet)
shading interp
C = contour(x2,y2,prom_u_inv,[-1 0.0 1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno')        
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_u_ver)) max(max(prom_u_inv))])


subplot(144)
hold on
pcolor(x2,y2,prom_u_pri)
colormap(jet)
shading interp
C = contour(x2,y2,prom_u_pri,[-1 0.0 1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[u]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, '[m/s]','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_u_ver)) max(max(prom_u_inv))])
set(h,'Position', [0.920  0.104  0.016  0.812]);

%% Seeciones Verticales Temperatura 

for i=1:6;   
[x3,y3,temp1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'temp',i);
[x3,y3,temp2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'temp',i);   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedio Verano

for j=1:2
    t_ver(:,:,j)=temp1(:,:,j);
end
t_ver(:,:,3)=temp2(:,:,6);
prom_t_ver=nanmean(t_ver,3);

%Promedio Otoño

for j=1:3
    t_oto(:,:,j)=temp1(:,:,j+2);
end
prom_t_oto=nanmean(t_oto,3);

%Promedio Invierno

for j=1:2
    t_inv(:,:,j)=temp2(:,:,j);
end
t_inv(:,:,3)=temp1(:,:,6);

prom_t_inv=nanmean(t_inv,3);

%Promedio Primavera
for j=1:3
    t_pri(:,:,j)=temp2(:,:,j+2);
end
prom_t_pri=nanmean(t_pri,3);


y3=-1*y3;

figure()
subplot(141)
hold on
pcolor(x3,y3,prom_t_ver)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_ver,[9 10 11 12],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(1,220,'Lat= [-43.4490 -43.6844] ','Fontsize',13,...
        'FontName','Arial','Color','k')
text(1,215,'Lon=  -73.9250 ','Fontsize',13,...
        'FontName','Arial','Color','k')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_t_ver)) max(max(prom_t_ver))])


subplot(142)
hold on
pcolor(x3,y3,prom_t_oto)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_oto,[10 10.8 11.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
title('Otoño')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_t_ver)) max(max(prom_t_ver))])

subplot(143)
hold on
pcolor(x3,y3,prom_t_inv)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_inv,[10 10.3 10.5],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno')        
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_t_ver)) max(max(prom_t_ver))])


subplot(144)
hold on
pcolor(x3,y3,prom_t_pri)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_pri,[9.2 10 10.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_t_ver)) max(max(prom_t_ver))])
set(h,'Position', [0.920  0.104  0.016  0.812]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure()
subplot(141)
hold on
pcolor(x3,y3,prom_t_ver)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_ver,[-0.05 0 0.05],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(1,180,'Lat= [-43.4490 -43.6844] ','Fontsize',13,...
        'FontName','Arial','Color','k')
text(1,185,'Lon=  -73.9250 ','Fontsize',13,...
        'FontName','Arial','Color','k')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
colorbar

subplot(142)
hold on
pcolor(x3,y3,prom_t_oto)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_oto,[-0.05 0 0.05],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
title('Otoño')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
colorbar 

subplot(143)
hold on
pcolor(x3,y3,prom_t_inv)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_inv,[-0.03 0 0.03],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno')        
axis tight
set(gca,'Fontsize',13)
colorbar

subplot(144)
hold on
pcolor(x3,y3,prom_t_pri)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_pri,[-0.05 0 0.05],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
set(h,'Position', [0.920  0.104  0.016  0.812]);


%% Secciones Verticales Salinidad

for i=1:6;   
[x,y,sal1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'salt',i);
[x,y,sal2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'salt',i);   
end


%Promedio Verano

for j=1:2
    sal_ver(:,:,j)=sal1(:,:,j);
end
sal_ver(:,:,3)=sal2(:,:,6);
prom_sal_ver=nanmean(sal_ver,3);

%Promedio Otoño

for j=1:3
    sal_oto(:,:,j)=sal1(:,:,j+2);
end
prom_sal_oto=nanmean(sal_oto,3);

%Promedio Invierno

for j=1:2
    sal_inv(:,:,j)=sal2(:,:,j);
end
sal_inv(:,:,3)=sal1(:,:,6);

prom_sal_inv=nanmean(sal_inv,3);

%Promedio Primavera
for j=1:3
    sal_pri(:,:,j)=sal2(:,:,j+2);
end
prom_sal_pri=nanmean(sal_pri,3);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               
y=-1*y;

figure()
subplot(141)
hold on
pcolor(x,y,prom_sal_ver)
colormap(jet)
shading interp
C = contour(x,y,prom_sal_ver,[33.3 33.5 33.6 33.9],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(1,220,'Lat= [-43.4490 -43.6844] ','Fontsize',13,...
        'FontName','Arial','Color','k')
text(1,215,'Lon=  -73.9250 ','Fontsize',13,...
        'FontName','Arial','Color','k')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_sal_ver)) max(max(prom_sal_oto))])

subplot(142)
hold on
pcolor(x,y,prom_sal_oto)
colormap(jet)
shading interp
C = contour(x,y,prom_sal_oto,[33.3 33.5 33.6 33.9],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
title('Otoño')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_sal_ver)) max(max(prom_sal_oto))])

subplot(143)
hold on
pcolor(x,y,prom_sal_inv)
colormap(jet)
shading interp
C = contour(x,y,prom_sal_inv,[33.5 33.6 33.7 33.8],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno')        
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_sal_ver)) max(max(prom_sal_oto))])

subplot(144)
hold on
pcolor(x,y,prom_sal_pri)
colormap(jet)
shading interp
C = contour(x,y,prom_sal_pri,[33.5 33.6 33.7 33.8],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
set(h,'Position', [0.920  0.104  0.016  0.812]);
caxis([min(min(prom_sal_ver)) max(max(prom_sal_oto))])

%% Secciones Verticales Nitrato NO3

for i=1:6;   
[x,y,no31(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'NO3',i);
[x,y,no32(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'NO3',i);   
end


%Promedio Verano

for j=1:2
    no3_ver(:,:,j)=no31(:,:,j);
end
no3_ver(:,:,3)=no32(:,:,6);
prom_no3_ver=nanmean(no3_ver,3);

%Promedio Otoño

for j=1:3
    no3_oto(:,:,j)=no31(:,:,j+2);
end
prom_no3_oto=nanmean(no3_oto,3);

%Promedio Invierno

for j=1:2
    no3_inv(:,:,j)=no32(:,:,j);
end
no3_inv(:,:,3)=no31(:,:,6);

prom_no3_inv=nanmean(no3_inv,3);

%Promedio Primavera
for j=1:3
    no3_pri(:,:,j)=no32(:,:,j+2);
end
prom_no3_pri=nanmean(no3_pri,3);

%Grafico
y=-1*y;

figure()
subplot(141)
hold on
pcolor(x,y,prom_no3_ver)
colormap(jet)
shading interp
C = contour(x,y,prom_no3_ver,[8 12 16 18],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(1,220,'Lat= [-43.4490 -43.6844] ','Fontsize',13,...
        'FontName','Arial','Color','k')
text(1,215,'Lon=  -73.9250 ','Fontsize',13,...
        'FontName','Arial','Color','k')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_no3_ver)) max(max(prom_no3_oto))])

subplot(142)
hold on
pcolor(x,y,prom_no3_oto)
colormap(jet)
shading interp
C = contour(x,y,prom_no3_oto,[10 14 16 19],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
% h = colorbar;
set(gca,'ydir','reverse')
% set(get(h,'title'),'string',{'[oxy]'},'FontName','Helvetica',...
%        'FontSize',14,'FontWeight','bold');    
title('Otoño')    
% ylabel(h, 'ml/L','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_no3_ver)) max(max(prom_no3_oto))])

subplot(143)
hold on
pcolor(x,y,prom_no3_inv)
colormap(jet)
shading interp
C = contour(x,y,prom_no3_inv,[13.5 15 16 17],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno')        
axis tight
set(gca,'Fontsize',13)
caxis([min(min(prom_no3_ver)) max(max(prom_no3_oto))])

subplot(144)
hold on
pcolor(x,y,prom_no3_pri)
colormap(jet)
shading interp
C = contour(x,y,prom_no3_pri,[12 15 16 18],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
set(h,'Position', [0.920  0.104  0.016  0.812]);
caxis([min(min(prom_no3_ver)) max(max(prom_no3_oto))])




