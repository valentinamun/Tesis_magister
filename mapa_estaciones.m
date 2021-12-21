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
PO4_1=ncread(mosa1,'PO4');%fosfato promedio primer semestre
PO4_2=ncread(mosa2,'PO4');% fosfato promedio segundo semestre
Si_1=ncread(mosa1,'Si'); %silicato primer semestre
Si_2=ncread(mosa2,'Si');%silicato segundo semestre
NO3_1=ncread(mosa1,'NO3'); %nitrato primer semestre
NO3_2=ncread(mosa2,'NO3');%nitrato segundo semestre
NH4_1=ncread(mosa1,'NH4'); %amonio primer semestre
NH4_2=ncread(mosa2,'NH4');%amonio segundo semestre
O2_1=ncread(mosa1,'O2');%oxigeno primer semestre
O2_2=ncread(mosa2,'O2');%oxigenos segundo semestre
mask=ncread(mosa1,'mask_rho'); %mascara del modelo

%% Mapa superficial con estaciones

%Posicion de las estaciones

estacion1=[-43.3218 -74.6250];
estacion2=[-43.5578 -74.3750];
estacion3=[-43.5940 -73.9750];
estacion4=[-43.6121 -73.6000];
estacion5=[-43.6302 -73.2500];
estacion6=[-43.3036 -73.2750];
estacion7=[-43.8469 -73.4500];


figure('Position',[969,93,579,807])
 m_proj('miller','lon',[-76 -72],'lat',[-46 -38.9])
 m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Mapa de Estaciones')
 hold on
 l= colorbar 
 colormap(m_colmap('blues')); 
 ylabel(l,'Profundidad [m]','fontsize',15)
 set(gca, 'FontSize', 17)
  h1=m_line(estacion1(2),estacion1(1),'marker','o','color','k','markerfacecolor','r','markersize',10);
  h2=m_line(estacion2(2),estacion2(1),'marker','o','color','k','markerfacecolor','r','markersize',10);
  h3=m_line(estacion3(2),estacion3(1),'marker','o','color','k','markerfacecolor','r','markersize',10);
  h4=m_line(estacion4(2),estacion4(1),'marker','o','color','k','markerfacecolor','r','markersize',10);
  h5=m_line(estacion5(2),estacion5(1),'marker','o','color','k','markerfacecolor','r','markersize',10);
  h6=m_line(estacion6(2),estacion6(1),'marker','o','color','k','markerfacecolor','r','markersize',10);
  h7=m_line(estacion7(2),estacion7(1),'marker','o','color','k','markerfacecolor','r','markersize',10);   
  h=[h1 h2 h3 h4 h5 h6 h7]
  legend(h,'Estaciones','location','northwest')
  
  %% Mapa secciones Verticales 
   
 lon1=[-74.1000 -74.1000];
 lat1=[-43.3763 -43.8108];
 lon2=[-73.0500 -74.5500];
 lat2=[-43.5034 -43.5034];
 
 figure('Position',[969,93,579,807])
 m_proj('miller','lon',[-76 -72],'lat',[-46 -38.9])
 m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Mapa de Estaciones')
 hold on
 l= colorbar 
 colormap(m_colmap('blues')); 
 ylabel(l,'Profundidad [m]','fontsize',15)
 set(gca, 'FontSize', 17)
 m_line(lon1,lat1,'linewi',3,'color','r');
 m_line(lon2,lat2,'linewi',3,'color','g');
%  m_text(lon1(2),lat1(2),'1','Fontsize',10);

 