clear all
close all
clc
addpath '/home/valentina/Escritorio/Tesis1'
addpath '/home/valentina/Escritorio/CROCO/croco_tools/Preprocessing_tools'

mosa1='mosa_RIO_avg_Y8S1.nc'
mosa2='mosa_RIO_avg_Y8S2.nc'


lat=ncread(mosa1,'lat_rho');
% lat=lat(161:end,240:end);
lon=ncread(mosa1,'lon_rho');
% lon=lon(161:end,240:end);

%% Promedios Estacionales Velocidad V

%100 metros de profundidad

velo_100_1_v=[];
for i=1:6
velo_100_1_v(:,:,i)=get_hslice('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc','v',i,-100,'v');
end

velo_100_2_v=[];
for i=1:6
velo_100_2_v(:,:,i)=get_hslice('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v',i,-100,'v');
end

%200 metros de profundidad

velo_200_1_v=[];
for i=1:6
velo_200_1_v(:,:,i)=get_hslice('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc','v',i,-200,'v');
end

velo_200_2_v=[];
for i=1:6
velo_200_2_v(:,:,i)=get_hslice('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v',i,-200,'v');
end

%300 metros de profundida

velo_300_1_v=[];
for i=1:6
velo_300_1_v(:,:,i)=get_hslice('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc','v',i,-300,'v');
end

velo_300_2_v=[];
for i=1:6
velo_300_2_v(:,:,i)=get_hslice('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v',i,-300,'v');
end

%Promedio Verano

for k=1:2
    ver_100_v(:,:,k)=velo_100_1_v(:,:,k);
    ver_200_v(:,:,k)=velo_200_1_v(:,:,k);
    ver_300_v(:,:,k)=velo_300_1_v(:,:,k);
end

ver_100_v(:,:,3)=velo_100_2_v(:,:,6);
ver_200_v(:,:,3)=velo_200_2_v(:,:,6);
ver_300_v(:,:,3)=velo_300_2_v(:,:,6);

prom_ver_100_v=nanmean(ver_100_v,3);
prom_ver_200_v=nanmean(ver_200_v,3);
prom_ver_300_v=nanmean(ver_300_v,3);

prom_ver_v=prom_ver_100_v;
prom_ver_v(:,:,2)=prom_ver_200_v;
prom_ver_v(:,:,3)=prom_ver_300_v;
prom_ver_v=nanmean(prom_ver_v,3);


%Promedio Otoño

for k=1:3
    oton_100_v(:,:,k)=velo_100_1_v(:,:,k+2);
    oton_200_v(:,:,k)=velo_200_1_v(:,:,k+2);
    oton_300_v(:,:,k)=velo_300_1_v(:,:,k+2);
end

prom_oton_100_v=nanmean(oton_100_v,3);
prom_oton_200_v=nanmean(oton_200_v,3);
prom_oton_300_v=nanmean(oton_300_v,3);

prom_oton_v=prom_oton_100_v;
prom_oton_v(:,:,2)=prom_oton_200_v;
prom_oton_v(:,:,3)=prom_oton_300_v;
prom_oton_v=nanmean(prom_oton_v,3);


%Promedio Invierno

for k=1:2
    inv_100_v(:,:,k)=velo_100_2_v(:,:,k);
    inv_200_v(:,:,k)=velo_200_2_v(:,:,k);
    inv_300_v(:,:,k)=velo_300_2_v(:,:,k);
end    

inv_100_v(:,:,3)=velo_100_1_v(:,:,6);
inv_200_v(:,:,3)=velo_200_1_v(:,:,6);
inv_300_v(:,:,3)=velo_300_1_v(:,:,6);

prom_inv_100_v=nanmean(inv_100_v,3);
prom_inv_200_v=nanmean(inv_200_v,3);
prom_inv_300_v=nanmean(inv_300_v,3);

prom_inv_v=prom_inv_100_v;
prom_inv_v(:,:,2)=prom_inv_200_v;
prom_inv_v(:,:,3)=prom_inv_300_v;
prom_inv_v=nanmean(prom_inv_v,3);


%Promedio Primavera

for k=1:3
    pri_100_v(:,:,k)=velo_100_2_v(:,:,k+2);
    pri_200_v(:,:,k)=velo_200_2_v(:,:,k+2);
    pri_300_v(:,:,k)=velo_300_2_v(:,:,k+2);  
end

prom_pri_100_v=nanmean(pri_100_v,3);
prom_pri_200_v=nanmean(pri_200_v,3);
prom_pri_300_v=nanmean(pri_300_v,3);


prom_pri_v=prom_pri_100_v;
prom_pri_v(:,:,2)=prom_pri_200_v;
prom_pri_v(:,:,3)=prom_pri_300_v;
prom_pri_v=nanmean(prom_pri_v,3);

prom_esta_v=prom_ver_v;
prom_esta_v(:,:,2)=prom_oton_v;
prom_esta_v(:,:,3)=prom_inv_v;
prom_esta_v(:,:,4)=prom_pri_v;

save('prom_esta_v.mat','prom_esta_v')

%% Promedio Estacional Velocidad U


%100 metros de profundidad

velo_100_1_u=[];
for i=1:6
velo_100_1_u(:,:,i)=get_hslice('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc','u',i,-100,'u');
end

velo_100_2_u=[];
for i=1:6
velo_100_2_u(:,:,i)=get_hslice('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','u',i,-100,'u');
end

%200 metros de profundidad

velo_200_1_u=[];
for i=1:6
velo_200_1_u(:,:,i)=get_hslice('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc','u',i,-200,'u');
end

velo_200_2_u=[];
for i=1:6
velo_200_2_u(:,:,i)=get_hslice('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','u',i,-200,'u');
end

%300 metros de profundida

velo_300_1_u=[];
for i=1:6
velo_300_1_u(:,:,i)=get_hslice('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc','u',i,-300,'u');
end

velo_300_2_u=[];
for i=1:6
velo_300_2_u(:,:,i)=get_hslice('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','u',i,-300,'u');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedio Verano

for k=1:2
    ver_100_u(:,:,k)=velo_100_1_u(:,:,k);
    ver_200_u(:,:,k)=velo_200_1_u(:,:,k);
    ver_300_u(:,:,k)=velo_300_1_u(:,:,k);
end

ver_100_u(:,:,3)=velo_100_2_u(:,:,6);
ver_200_u(:,:,3)=velo_200_2_u(:,:,6);
ver_300_u(:,:,3)=velo_300_2_u(:,:,6);

prom_ver_100_u=nanmean(ver_100_u,3);
prom_ver_200_u=nanmean(ver_200_u,3);
prom_ver_300_u=nanmean(ver_300_u,3);

prom_ver_u=prom_ver_100_u;
prom_ver_u(:,:,2)=prom_ver_200_u;
prom_ver_u(:,:,3)=prom_ver_300_u;
prom_ver_u=nanmean(prom_ver_u,3);


%Promedio Otoño

for k=1:3
    oton_100_u(:,:,k)=velo_100_1_u(:,:,k+2);
    oton_200_u(:,:,k)=velo_200_1_u(:,:,k+2);
    oton_300_u(:,:,k)=velo_300_1_u(:,:,k+2);
end

prom_oton_100_u=nanmean(oton_100_u,3);
prom_oton_200_u=nanmean(oton_200_u,3);
prom_oton_300_u=nanmean(oton_300_u,3);

prom_oton_u=prom_oton_100_u;
prom_oton_u(:,:,2)=prom_oton_200_u;
prom_oton_u(:,:,3)=prom_oton_300_u;
prom_oton_u=nanmean(prom_oton_u,3);


%Promedio Invierno

for k=1:2
    inv_100_u(:,:,k)=velo_100_2_u(:,:,k);
    inv_200_u(:,:,k)=velo_200_2_u(:,:,k);
    inv_300_u(:,:,k)=velo_300_2_u(:,:,k);
end    

inv_100_u(:,:,3)=velo_100_1_u(:,:,6);
inv_200_u(:,:,3)=velo_200_1_u(:,:,6);
inv_300_u(:,:,3)=velo_300_1_u(:,:,6);

prom_inv_100_u=nanmean(inv_100_u,3);
prom_inv_200_u=nanmean(inv_200_u,3);
prom_inv_300_u=nanmean(inv_300_u,3);

prom_inv_u=prom_inv_100_u;
prom_inv_u(:,:,2)=prom_inv_200_u;
prom_inv_u(:,:,3)=prom_inv_300_u;
prom_inv_u=nanmean(prom_inv_u,3);


%Promedio Primavera

for k=1:3
    pri_100_u(:,:,k)=velo_100_2_u(:,:,k+2);
    pri_200_u(:,:,k)=velo_200_2_u(:,:,k+2);
    pri_300_u(:,:,k)=velo_300_2_u(:,:,k+2);  
end

prom_pri_100_u=nanmean(pri_100_u,3);
prom_pri_200_u=nanmean(pri_200_u,3);
prom_pri_300_u=nanmean(pri_300_u,3);


prom_pri_u=prom_pri_100_u;
prom_pri_u(:,:,2)=prom_pri_200_u;
prom_pri_u(:,:,3)=prom_pri_300_u;
prom_pri_u=nanmean(prom_pri_u,3);

prom_esta_u=prom_ver_u;
prom_esta_u(:,:,2)=prom_oton_u;
prom_esta_u(:,:,3)=prom_inv_u;
prom_esta_u(:,:,4)=prom_pri_u;

save('prom_esta_u.mat','prom_esta_u')

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

% transfert a field at v points to a field at rho points

v_ver=v2rho_2d(prom_esta_v(:,:,1));
v_oto=v2rho_2d(prom_esta_v(:,:,2));
v_inv=v2rho_2d(prom_esta_v(:,:,3));
v_pri=v2rho_2d(prom_esta_v(:,:,4));

u_ver=u2rho_2d(prom_esta_u(:,:,1));
u_oto=u2rho_2d(prom_esta_u(:,:,2));
u_inv=u2rho_2d(prom_esta_u(:,:,3));
u_pri=u2rho_2d(prom_esta_u(:,:,4));


%% Grafico 1

xx=linspace(lon(1),lon(end),321)';
yy=linspace(lat(1),lat(end),621)';
levels=[-0.2:0.1:0.2];


%Normalizar los vectores de velocidad u y v

for i=1:621
for j=1:321
    
    un_ver(i,j)=u_ver(i,j)/sqrt(u_ver(i,j)^2+v_ver(i,j)^2);
    un_oto(i,j)=u_oto(i,j)/sqrt(u_oto(i,j)^2+v_oto(i,j)^2);
    un_inv(i,j)=u_inv(i,j)/sqrt(u_inv(i,j)^2+v_inv(i,j)^2);
    un_pri(i,j)=u_pri(i,j)/sqrt(u_pri(i,j)^2+v_pri(i,j)^2);
    
    vn_ver(i,j)=v_ver(i,j)/sqrt(u_ver(i,j)^2+v_ver(i,j)^2);
    vn_oto(i,j)=v_oto(i,j)/sqrt(u_oto(i,j)^2+v_oto(i,j)^2);
    vn_inv(i,j)=v_inv(i,j)/sqrt(u_inv(i,j)^2+v_inv(i,j)^2);
    vn_pri(i,j)=v_pri(i,j)/sqrt(u_pri(i,j)^2+v_pri(i,j)^2);    
end
    
end


%Grafico

xx=linspace(lon(1),lon(end),321)';
yy=linspace(lat(1),lat(end),621)';
levels=[-0.2:0.05:0.2];

cmap = colormap_cpt('Velocidad.cpt');


figure()
subplot(141)
set(gcf,'position',[10,10,1500,800])
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    
m_gshhs_f('speckle','color','k');
hold on;
m_contourf(xx,yy,v_ver,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(121:20:end,1:20:end)',lat(121:20:end,1:20:end)',un_ver(1:20:end,121:20:end),vn_ver(1:20:end,121:20:end),'k','linewidth',1.5);
caxis([-0.2 0.2])
title('Verano')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,v_oto,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_oto(1:20:end,1:20:end),vn_oto(1:20:end,1:20:end),'k','linewidth',1.5);
caxis([-0.2 0.2])
title('Otoño')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,v_inv,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_inv(1:20:end,1:20:end),vn_inv(1:20:end,1:20:end),'k','linewidth',1.5);
caxis([-0.2 0.2])
title('Invierno')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,v_pri,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_pri(1:20:end,1:20:end),vn_pri(1:20:end,1:20:end),'k','linewidth',1.5);
h=colorbar
h.Title.String = "[m/s]";
caxis([-0.2 0.2])
title('Primavera')
set(gca,'Fontsize',18)
set(h,'Position', [0.923  0.121 0.018  0.769]);
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


%Grafico velocidad u


figure()
subplot(141)
set(gcf,'position',[10,10,1500,800])
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    
m_gshhs_f('speckle','color','k');
hold on;
m_contourf(xx,yy,u_ver,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(121:20:end,1:20:end)',lat(121:20:end,1:20:end)',un_ver(1:20:end,121:20:end),vn_ver(1:20:end,121:20:end),'k','linewidth',1.5);
caxis([-0.2 0.2])
title('Verano')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,u_oto,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_oto(1:20:end,1:20:end),vn_oto(1:20:end,1:20:end),'k','linewidth',1.5);
caxis([-0.2 0.2])
title('Otoño')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,u_inv,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_inv(1:20:end,1:20:end),vn_inv(1:20:end,1:20:end),'k','linewidth',1.5);
caxis([-0.2 0.2])
title('Invierno')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,u_pri,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_pri(1:20:end,1:20:end),vn_pri(1:20:end,1:20:end),'k','linewidth',1.5);
h=colorbar
h.Title.String = "[m/s]";
caxis([-0.2 0.2])
title('Primavera')
set(gca,'Fontsize',18)
set(h,'Position', [0.923  0.121 0.018  0.769]);
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


%% Magnitud velocidad 


for i=1:621
for j=1:321
    
    mg_ver(i,j)=sqrt(u_ver(i,j)^2+v_ver(i,j)^2);
    mg_oto(i,j)=sqrt(u_oto(i,j)^2+v_oto(i,j)^2);
    mg_inv(i,j)=sqrt(u_inv(i,j)^2+v_inv(i,j)^2);
    mg_pri(i,j)=sqrt(u_pri(i,j)^2+v_pri(i,j)^2);
     
end
    
end


figure()
subplot(141)
set(gcf,'position',[10,10,1500,800])
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    
m_gshhs_f('speckle','color','k');
hold on;
m_contourf(xx,yy,mg_ver,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(121:20:end,1:20:end)',lat(121:20:end,1:20:end)',un_ver(1:20:end,121:20:end),vn_ver(1:20:end,121:20:end),'k','linewidth',1.5);
title('Verano')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,mg_oto,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_oto(1:20:end,1:20:end),vn_oto(1:20:end,1:20:end),'k','linewidth',1.5);
%caxis([-0.2 0.2])
title('Otoño')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,mg_inv,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_inv(1:20:end,1:20:end),vn_inv(1:20:end,1:20:end),'k','linewidth',1.5);
%caxis([-0.2 0.2])
title('Invierno')
set(gca,'Fontsize',18)
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)


subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(121,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(xx,yy,mg_pri,levels,'linecolor','none');
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
colormap(cmap)
q=m_quiver(lon(1:20:end,1:20:end)',lat(1:20:end,1:20:end)',un_pri(1:20:end,1:20:end),vn_pri(1:20:end,1:20:end),'k','linewidth',1.5);
h=colorbar
h.Title.String = "[m/s]";
%caxis([-0.2 0.2])
title('Primavera')
set(gca,'Fontsize',18)
set(h,'Position', [0.923  0.121 0.018  0.769]);
set(q,'AutoScale','on', 'AutoScaleFactor', 0.5)




