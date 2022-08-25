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

cmap = colormap_cpt('OXY.cpt');

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_oxy_ver)
colormap(cmap)
shading interp
C = contour(x1,y1,prom_oxy_ver,[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
text(-11.92,198.017,'N','Fontsize',16,...
        'FontName','Courier','Color','k')  
text(-11.92,198.017,'S','Fontsize',16,...
        'FontName','Courier','Color','k')      
set(gca,'ydir','reverse') 
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
caxis([2 6])      
axis tight
set(gca,'Fontsize',14)
box on


subplot(142)
hold on
pcolor(x1,y1,prom_oxy_oto)
colormap(cmap)
shading interp
C = contour(x1,y1,prom_oxy_oto,[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Otoño')
xlabel('Distancia [km]')  
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on

subplot(143)
hold on
pcolor(x1,y1,prom_oxy_inv)
colormap(cmap)
shading interp
C = contour(x1,y1,prom_oxy_inv,[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')    
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on

subplot(144)
hold on
pcolor(x1,y1,prom_oxy_pri)
colormap(cmap)
shading interp
C = contour(x1,y1,prom_oxy_pri,[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[ml/L]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold','Position',[10.368 600.914 0]);   
title('Primavera')
ylabel(h, 'Oxígeno','fontsize',16) 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on


%% Secciones verticales de Velocidad U

for i=1:6;   
[x2,y2,u1(:,:,i)]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'u',i);
[x2,y2,u2(:,:,i)]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(pos_lonE1) lon(pos_lonE1)],[-43.3763 -43.8108],'u',i);   
end

figure()
pcolor(x2,y2,u1(:,:,))
shading interp
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
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

vel = colormap_cpt('Velocidad.cpt');

figure()
subplot(141)
hold on
pcolor(x2,y2,prom_u_ver)
colormap(vel)
shading interp
C = contour(x2,y2,prom_u_ver,[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')    
text(-11.92,198.017,'N','Fontsize',16,...
        'FontName','Courier','Color','k')  
text(-11.92,198.017,'S','Fontsize',16,...
        'FontName','Courier','Color','k') 
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')       
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on


subplot(142)
hold on
pcolor(x2,y2,prom_u_oto)
colormap(vel)
shading interp
C = contour(x2,y2,prom_u_oto,[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
xlabel('Distancia [km]')
set(gca,'ydir','reverse')    
title('Otoño')      
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on

subplot(143)
hold on
pcolor(x2,y2,prom_u_inv)
colormap(vel)
shading interp
C = contour(x2,y2,prom_u_inv,[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on

subplot(144)
hold on
pcolor(x2,y2,prom_u_pri)
colormap(vel)
shading interp
C = contour(x2,y2,prom_u_pri,[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[m/s]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Velocidad (U)','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
%suptitle('Two Subplots')

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
C = contour(x3,y3,prom_t_ver,[6:2:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
text(-11.92,198.017,'N','Fontsize',16,...
        'FontName','Courier','Color','k')  
text(-11.92,198.017,'S','Fontsize',16,...
        'FontName','Courier','Color','k') 
set(gca,'ydir','reverse')  
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')      
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on

subplot(142)
hold on
pcolor(x3,y3,prom_t_oto)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_oto,[6:2:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
xlabel('Distancia [km]')
set(gca,'ydir','reverse') 
title('Otoño')       
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on

subplot(143)
hold on
pcolor(x3,y3,prom_t_inv)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_inv,[6:2:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
xlabel('Distancia [km]')
title('Invierno')        
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on

subplot(144)
hold on
pcolor(x3,y3,prom_t_pri)
colormap(jet)
shading interp
C = contour(x3,y3,prom_t_pri,[6:2:12],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',14)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, 'Temperatura','fontsize',16) 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on



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
C = contour(x,y,prom_sal_ver,[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
text(-11.92,198.017,'N','Fontsize',16,...
        'FontName','Courier','Color','k')  
text(-11.92,198.017,'S','Fontsize',16,...
        'FontName','Courier','Color','k') 
set(gca,'ydir','reverse')   
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')      
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
box on

subplot(142)
hold on
pcolor(x,y,prom_sal_oto)
colormap(jet)
shading interp
C = contour(x,y,prom_sal_oto,[33.0:0.2:34,4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
xlabel('Distancia [km]')
set(gca,'ydir','reverse')
title('Otoño')       
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
box on

subplot(143)
hold on
pcolor(x,y,prom_sal_inv)
colormap(jet)
shading interp
C = contour(x,y,prom_sal_inv,[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
box on

subplot(144)
hold on
pcolor(x,y,prom_sal_pri)
colormap(jet)
shading interp
C = contour(x,y,prom_sal_pri,[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
set(h,'Position', [0.920  0.104  0.016  0.812]);
caxis([33.2 34.4])
box on

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
C = contour(x,y,prom_no3_ver,[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
text(-11.92,198.017,'N','Fontsize',16,...
        'FontName','Courier','Color','k')  
text(-11.92,198.017,'S','Fontsize',16,...
        'FontName','Courier','Color','k')
set(gca,'ydir','reverse')   
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')     
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on

subplot(142)
hold on
pcolor(x,y,prom_no3_oto)
colormap(jet)
shading interp
C = contour(x,y,prom_no3_oto,[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')    
title('Otoño')    
xlabel('Distancia [km]') 
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on

subplot(143)
hold on
pcolor(x,y,prom_no3_inv)
colormap(jet)
shading interp
C = contour(x,y,prom_no3_inv,[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')   
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on

subplot(144)
hold on
pcolor(x,y,prom_no3_pri)
colormap(jet)
shading interp
C = contour(x,y,prom_no3_pri,[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold','Position',[10.368 600.914 0]);   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
set(h,'Position', [0.920  0.104  0.016  0.812]);
caxis([6 33])
box on
set(h,'XTick',[6:3:33])


