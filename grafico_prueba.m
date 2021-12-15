%% Vectores de Velocidad
clear all
close all
clc
addpath '/home/valentina/Escritorio/Tesis1'
addpath '/home/valentina/Escritorio/CROCO/croco_tools/Preprocessing_tools'
addpath '/home/valentina/Escritorio/CROCO/croco_tools/Diagnostic_tools'


mosa1='mosa_RIO_avg_Y8S1.nc'
mosa2='mosa_RIO_avg_Y8S2.nc'
load('prom_esta_u.mat')
load('prom_esta_v.mat')

lat=ncread(mosa1,'lat_rho');
lon=ncread(mosa1,'lon_rho');

% transfert a field at u points to a field at rho points

v_ver=v2rho_2d(prom_esta_v(:,:,1));
v_oto=v2rho_2d(prom_esta_v(:,:,2));
v_inv=v2rho_2d(prom_esta_v(:,:,3));
v_pri=v2rho_2d(prom_esta_v(:,:,4));

u_ver=u2rho_2d(prom_esta_u(:,:,1));
u_oto=u2rho_2d(prom_esta_u(:,:,2));
u_inv=u2rho_2d(prom_esta_u(:,:,3));
u_pri=u2rho_2d(prom_esta_u(:,:,4));




%% Grafico

xx=linspace(lon(1),lon(end),321)';
yy=linspace(lat(1),lat(end),620)';
levels=[min(min(prom_esta_v(:,:,3))):0.1:max(max(prom_esta_v(:,:,3)))];

figure()
subplot(141)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,prom_esta_v(:,:,1),levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
m_quiver(lon',lat',u_ver,v_ver);
caxis([-0.7202 0.5646])
title('Verano 100-300m')
set(gca,'Fontsize',18)


subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,prom_esta_v(:,:,2),levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
caxis([-0.6792 0.5646])
title('Otoño 100-300m')
set(gca,'Fontsize',18)


subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,prom_esta_v(:,:,4),levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
caxis([-0.6793 0.5646])
title('Invierno 100-300m')
set(gca,'Fontsize',18)

subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,prom_esta_v(:,:,5),levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
h=colorbar
h.Title.String = "[m/s]";
caxis([-0.6793 0.5646])
title('Primavera 100-300m')
set(gca,'Fontsize',18)