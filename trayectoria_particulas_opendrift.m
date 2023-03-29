clear all
close all
clc

addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'
file= [dir 'mosa_VM_1mes_horario_back_AS_27-31Enero.nc']
ncdisp(file)

lon=ncread([file],'lon');
lat=ncread([file],'lat');
z=ncread([file],'z');
status=ncread([file],'status');


%Particulas que no se han pegado en la costa en el tiempo final 
%Se utilizo z<0,ya que habia valores positivos de 9.96 correspondiente a errores

%  ind_up=find((z(721,:)<0) & (lat(721,:)>-43.5) & (lon(721,:)<-74));
%  ind_down=find((z(721,:)<0) & (lat(721,:)<-43.5) & (lon(721,:)<-74));
%  ind_in_up=find((z(721,:)<0) & (lat(721,:)>-43.5) & (lon(721,:)>-74));
%  ind_in_down=find((z(721,:)<0) & (lat(721,:)<-43.5) & (lon(721,:)>-74));
 
  ind_up=find((lat(841,:)>-43.5) & (lon(841,:)<-74));
  ind_down=find((lat(841,:)<-43.5) & (lon(841,:)<-74));
  ind_in_up=find((lat(841,:)>-43.5) & (lon(841,:)>-74));
  ind_in_down=find((lat(841,:)<-43.5) & (lon(841,:)>-74));
 
 
%Campo de particulas en el tiempo 2

lat_ini=lat(1,:);
lon_ini=lon(1,:);
z_ini=z(1,:);
indx=find(lat_ini>0);
lat_ini(indx)=NaN;
lon_ini(indx)=NaN;
z_ini(indx)=NaN;

%% Graficos de seccion en la Boca del Guafo

figure(1)
subplot(151)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_up),z_ini(1,ind_up),'rx','MarkerSize',10,'LineWidth',4)
title('Norte')
xlabel('Latitud')
ylabel('Profundidad')
box on
set(gca, 'FontSize', 17)
subplot(152)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_down),z_ini(1,ind_down),'cx','MarkerSize',10,'LineWidth',4)
title('Sur')
xlabel('Latitud')
box on
set(gca, 'FontSize', 17)
subplot(153)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_in_up),z_ini(1,ind_in_up),'gx','MarkerSize',10,'LineWidth',4)
title('Mar Interior')
xlabel('Latitud')
set(gca, 'FontSize', 17)
box on

subplot(154)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_in_down),z_ini(1,ind_in_down),'yx','MarkerSize',10,'LineWidth',4)
title('Fiordos')
xlabel('Latitud')
set(gca, 'FontSize', 17)
box on
subplot(155)
hold on
scatter(lat_ini(1,:),z_ini(1,:),30.0,z_ini(1,:),'filled')
plot(lat_ini(1,ind_up),z_ini(1,ind_up),'rx','MarkerSize',10,'LineWidth',4)
plot(lat_ini(1,ind_down),z_ini(1,ind_down),'cx','MarkerSize',10,'LineWidth',4)
plot(lat_ini(1,ind_in_up),z_ini(1,ind_in_up),'gx','MarkerSize',10,'LineWidth',4)
plot(lat_ini(1,ind_in_down),z_ini(1,ind_in_down),'yx','MarkerSize',10,'LineWidth',4)
xlabel('Latitud')
title('Total')
set(gca, 'FontSize', 17)
legend('Inicial','Norte','Sur',' Mar Interior','Fiordos')
box on 

%% Grafico de particulas horizontal

 figure()
 %subplot(131)
 m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
 %m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particulas del Norte')
 %l= colorbar 
 %colormap(m_colmap('blues')); 
 set(gca, 'FontSize', 17)
 for i=1:100
 hold on
 %m_plot(lon(:,ind_up(i)),lat(:,ind_up(i)),'marker','o','color','k','markerfacecolor','r','markersize',4); 
 m_scatter(lon(:,ind_up(i)),lat(:,ind_up(i)),30.0,z(:,ind_up(i)),'filled'); 
 caxis([-340 0])
 hold off 
 end

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





%% Porcentajes
 
   ini=length(lat); %Total inical opendrift
   in_up=length(ind_in_up); %provenientes del mar interior que no se pegan en la costa
   in_down=length(ind_in_down) %provenientes del los fiordos
   up=length(ind_up); %provenientes del norte que no se pegan en la costa
   down=length(ind_down); %provenientes del sur que no se pegan en la costa
   
   
   total_np=in_up+in_down+up+down; %total de las particulas no pegadas a la costa
   
   %Porcentaje considerando el 100% como las particulas no pegadas a la
   %costa
   
   in_up=length(ind_in_up)/total_np*100;
   in_down=length(ind_in_down)/total_np*100;
   up_t=length(ind_up)/total_np*100;
   down_t=length(ind_down)/total_np*100;
   
   total=in_up+in_down+up_t+down_t
   
   
   %Porcentaje considerando el total como solo las particulas no_pegadas a
   %la costa
   disp(['in_up ' 'in_down' 'up_t ' 'down_t ' ' total'])
   procentajes=[in_up in_down up_t down_t  total]
   
%   disp(['in_tt ' 'up_tt ' 'down_tt ' ' total_tt'])
%   procentajes=[in_tt up_tt down_tt  total_tt]
   
   disp(['in_up ' ' in_down '   'up ' 'down ' 'total_np' ' ini'])
   cantidad=[length(ind_in_up) length(ind_in_down) length(ind_up) length(ind_down) total_np ini]
 
