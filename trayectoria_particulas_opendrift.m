%Trayectoria de las particulas que no se han pegado en un tiempo final

clear all
close all
clc
addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
dir= '/media/valentina/TOSHIBA EXT/OPENDRIFT/Opendrift_01/Mareas/'
%dir= '/media/valentina/TOSHIBA EXT/OPENDRIFT/Opendrift_02/'
file= [dir 'mosa_VM_back_tides_10000_0-200_abril.nc']
%file= [dir 'mosa_VM_back_tides_10000_0-200_feb.nc']
%file= [dir 'mosa_VM_back_tides_100000_0-200_exp01.nc']
ncdisp(file)

lon=ncread([file],'lon');
lat=ncread([file],'lat');
z=ncread([file],'z');

%Particulas que no se han pegado en la costa en el tiempo final 
 ind_up=find((z(721,:)<0) & (lat(721,:)>-43.5) & (lon(721,:)<-74));
 ind_down=find((z(721,:)<0) & (lat(721,:)<-43.5) & (lon(721,:)<-74));
 ind_in=find((z(721,:)<0) & (lon(721,:)>-74));

%Campo de particulas en el tiempo 2

lat_ini=lat(2,:);
lon_ini=lon(2,:);
z_ini=z(2,:);
indx=find(lat_ini>0);
lat_ini(indx)=NaN;
lon_ini(indx)=NaN;
z_ini(indx)=NaN;

%% Graficos 

figure(1)
subplot(141)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_up),z_ini(1,ind_up),'rx','MarkerSize',10,'LineWidth',4)
title('Norte')
xlabel('Latitud')
ylabel('Profundidad')
box on
set(gca, 'FontSize', 17)
subplot(142)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_down),z_ini(1,ind_down),'cx','MarkerSize',10,'LineWidth',4)
title('Sur')
xlabel('Latitud')
box on
set(gca, 'FontSize', 17)
subplot(143)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_in),z_ini(1,ind_in),'gx','MarkerSize',10,'LineWidth',4)
title('Mar Interior')
xlabel('Latitud')
set(gca, 'FontSize', 17)
box on
subplot(144)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_up),z_ini(1,ind_up),'rx','MarkerSize',10,'LineWidth',4)
plot(lat_ini(1,ind_down),z_ini(1,ind_down),'cx','MarkerSize',10,'LineWidth',4)
plot(lat_ini(1,ind_in),z_ini(1,ind_in),'gx','MarkerSize',10,'LineWidth',4)
xlabel('Latitud')
title('Total')
set(gca, 'FontSize', 17)
legend('Inicial','Norte','Sur','Interior')
box on
sgtitle('10.000 particulas, mosa-VM-back-tides-10000-0-200-abril.nc') 


%  figure(2)
%  subplot(131)
%  m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
%  %m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
%  m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
%  m_gshhs_f('speckle','color','k');    % with speckle added
%  m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
%  xlabel('Longitud','FontSize',16)
%  ylabel('Latitud','FontSize',16)
%  title('Particulas del Norte')
%  %l= colorbar 
%  %colormap(m_colmap('blues')); 
%  set(gca, 'FontSize', 17)
%  for i=1:length(ind_up)
%  hold on
%  %m_plot(lon(:,ind_up(i)),lat(:,ind_up(i)),'marker','o','color','k','markerfacecolor','r','markersize',4); 
%  m_scatter(lon(:,ind_up(i)),lat(:,ind_up(i)),30.0,z(:,ind_up(i)),'filled'); 
%  caxis([-340 0])
%  hold off 
%  end
% 
% 
%  subplot(132)
%  m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
%  %m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
%  m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
%  m_gshhs_f('speckle','color','k');    % with speckle added
%  m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
%  xlabel('Longitud','FontSize',16)
%  title('Particulas del Sur')
%  %l= colorbar 
%  %colormap(m_colmap('blues')); 
%  set(gca, 'FontSize', 17)
%  for i=50:57
%  hold on
%  %m_plot(lon(:,ind_up(i)),lat(:,ind_up(i)),'marker','o','color','k','markerfacecolor','r','markersize',4); 
%  m_scatter(lon(:,ind_down(i)),lat(:,ind_down(i)),30.0,z(:,ind_down(i)),'filled'); 
%  caxis([-340 0])
%  hold off 
%  end
%  
%  subplot(133)
%  m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
%  %m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
%  m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
%  m_gshhs_f('speckle','color','k');    % with speckle added
%  m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
%  xlabel('Longitud','FontSize',16)
%  title('Particulas del Mar Interior')
%  set(gca, 'FontSize', 17)
%  for i=30:37
%  hold on
%  %m_plot(lon(:,ind_up(i)),lat(:,ind_up(i)),'marker','o','color','k','markerfacecolor','r','markersize',4); 
%  m_scatter(lon(:,ind_in(i)),lat(:,ind_in(i)),30.0,z(:,ind_in(i)),'filled'); 
%  h=colorbar
%  set(h,'Position',[0.913 0.11 0.016 0.812])%
%  caxis([-340 0])
%  ylabel(h,'[m]')
%  set(gca,'Fontsize',14)
%  hold off 
%  end
 
% figure(3)
% hold on
% for i=1:length(ind_up)
% plot(lon(:,ind_up(i)),lat(:,ind_up(i)))
% end
% 
% figure(4)
% hold on
% for i=1:length(ind_down)
% plot(lon(:,ind_down(i)),lat(:,ind_down(i)))
% end
% 
% figure(5)
% hold on
% for i=1:length(ind_in)
% plot(lon(:,ind_in(i)),lat(:,ind_in(i)))
% end



%% Porcentajes
 
   ini=length(lat); %Total inical opendrift
   in=length(ind_in); %provenientes del mar interior que no se pegan en la costa
   up=length(ind_up); %provenientes del norte que no se pegan en la costa
   down=length(ind_down); %provenientes del sur que no se pegan en la costa
   
   
   total_np=in+up+down; %total de las particulas no pegadas a la costa
   
   %Porcentaje considerando el 100% como las particulas no pegadas a la
   %costa
   
   in_t=length(ind_in)/total_np*100;
   up_t=length(ind_up)/total_np*100;
   down_t=length(ind_down)/total_np*100;
   
   total=in_t+up_t+down_t
   
   %Porcentaje considerando el 100% como todas las particulas
   
%    in_tt=length(ind_in)*100/length(lat);
%    up_tt=length(ind_up)*100/length(lat);
%    down_tt=length(ind_down)*100/length(lat);
%    
%    total_tt=in_tt+up_tt+down_tt; 
   
   
   %Porcentaje considerando el total como solo las particulas no_pegadas a
   %la costa
   disp(['in_t ' 'up_t ' 'down_t ' ' total'])
   procentajes=[in_t up_t down_t  total]
   
%   disp(['in_tt ' 'up_tt ' 'down_tt ' ' total_tt'])
%   procentajes=[in_tt up_tt down_tt  total_tt]
   
   disp(['in ' 'up ' 'down ' 'total_np' ' ini'])
   cantidad=[length(ind_in) length(ind_up) length(ind_down) total_np ini]
 
   
 