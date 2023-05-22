clear all
close all
clc

addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'
file1= [dir 'mosa_VM_1mes_horario_back_AS_27-31Enero.nc']
%file2= [dir 'mosa_VM_1mes_horario_back_AS_22-26Enero.nc']
%file3=[dir 'mosa_VM_1mes_horario_back_AS_17-21Enero.nc']
%file4=[dir 'mosa_VM_1mes_horario_back_AS_12-16Enero.nc']
%file5=[dir 'mosa_VM_1mes_horario_back_AS_07-11Enero.nc']
%file6=[dir 'mosa_VM_1mes_horario_back_AS_01-06Enero.nc']


lon=ncread([file1],'lon');
lat=ncread([file1],'lat');
z=ncread([file1],'z');
status=ncread([file1],'status');

% lon=ncread([file2],'lon');
% lat=ncread([file2],'lat');
% z=ncread([file2],'z');
% status=ncread([file2],'status');

% lon=ncread([file3],'lon');
% lat=ncread([file3],'lat');
% z=ncread([file3],'z');
% status=ncread([file3],'status');

% lon=ncread([file4],'lon');
% lat=ncread([file4],'lat');
% z=ncread([file4],'z');
% status=ncread([file4],'status');

% lon=ncread([file5],'lon');
% lat=ncread([file5],'lat');
% z=ncread([file5],'z');
% status=ncread([file5],'status');

% lon=ncread([file6],'lon');
% lat=ncread([file6],'lat');
% z=ncread([file6],'z');
% status=ncread([file6],'status');

%Calculo de indice entre 27-31

lat(find(lat>0))=NaN;
lon(find(lon>0))=NaN;
  
%  ind_nor01=find((lat(841,:)>-43.5) & (lon(841,:)<-74.0)); %Norte
%  ind_sur01=find((lat(841,:)<-43.5) & (lon(841,:)<-74.0));%Sur
%  ind_in_mic01=find((lat(841,:)>-43.5) & (lon(841,:)>-74.0));%MIC
%  ind_in_fior01=find((lat(841,:)<-43.5) & (lon(841,:)>-74.0));%Fiordos
  aux_ind_nor01=find((lat(841,:)>-43.5))
  ind_nor01=find(lon(841,aux_ind_nor01)<-74.0); %Norte


  ind_sur01=find((lat(841,:)<-43.5) & (lon(841,:)<-74.0));%Sur
  ind_in_mic01=find((lat(841,:)>-43.5) & (lon(841,:)>-74.0));%MIC
  ind_in_fior01=find((lat(841,:)<-43.5) & (lon(841,:)>-74.0));%Fiordos

  
  figure()
  plot(lon(end,ind_nor01),lat(end,ind_nor01),'o')
  plot(lon(end,ind_sur01),lat(end,ind_sur01),'o')
  
  
  a=lon(ind_nor01);
  b=lat(ind_nor01);
  
  
%   final=length(ind_nor01)+length(ind_sur01)+length(ind_in_mic01)+length(ind_in_fior01)
%   inicial=length(z)
%   perdidas=final-inicial
%   
%   save('ind_nor01.mat','ind_nor01');
%   save('ind_sur01.mat','ind_sur01');
%   save('ind_in_mic01.mat','ind_in_mic01');
%   save('ind_in_fior01.mat','ind_in_fior01');
  
%Calculo de indice entre 22-26  
  
%   ind_nor02=find((lat(841,:)>-43.5) & (lon(841,:)<-74)); %Norte
%   ind_sur02=find((lat(841,:)<-43.5) & (lon(841,:)<-74));%Sur
%   ind_in_mic02=find((lat(841,:)>-43.5) & (lon(841,:)>-74));%MIC
%   ind_in_fior02=find((lat(841,:)<-43.5) & (lon(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor02)+length(ind_sur02)+length(ind_in_mic02)+length(ind_in_fior02)
%   inicial=length(z)
%   perdidas=final-inicial
%   
%   save('ind_nor02.mat','ind_nor02');
%   save('ind_sur02.mat','ind_sur02');
%   save('ind_in_mic02.mat','ind_in_mic02');
%   save('ind_in_fior02.mat','ind_in_fior02');
  

%Calculo de indice entre 17-21 
  
%   ind_nor03=find((lat(841,:)>-43.5) & (lon(841,:)<-74)); %Norte
%   ind_sur03=find((lat(841,:)<-43.5) & (lon(841,:)<-74));%Sur
%   ind_in_mic03=find((lat(841,:)>-43.5) & (lon(841,:)>-74));%MIC
%   ind_in_fior03=find((lat(841,:)<-43.5) & (lon(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor03)+length(ind_sur03)+length(ind_in_mic03)+length(ind_in_fior03)
%   inicial=length(z)
%   perdidas=final-inicial
%   
%   save('ind_nor03.mat','ind_nor03');
%   save('ind_sur03.mat','ind_sur03');
%   save('ind_in_mic03.mat','ind_in_mic03');
%   save('ind_in_fior03.mat','ind_in_fior03');  
  
  
%Calculo de indice entre 12-16
  
%   ind_nor04=find((lat(841,:)>-43.5) & (lon(841,:)<-74)); %Norte
%   ind_sur04=find((lat(841,:)<-43.5) & (lon(841,:)<-74));%Sur
%   ind_in_mic04=find((lat(841,:)>-43.5) & (lon(841,:)>-74));%MIC
%   ind_in_fior04=find((lat(841,:)<-43.5) & (lon(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor04)+length(ind_sur04)+length(ind_in_mic04)+length(ind_in_fior04)
%   inicial=length(z)
%   perdidas=final-inicial
%   
%   save('ind_nor04.mat','ind_nor04');
%   save('ind_sur04.mat','ind_sur04');
%   save('ind_in_mic04.mat','ind_in_mic04');
%   save('ind_in_fior04.mat','ind_in_fior04');    
  
  
%Calculo de indice entre 07-11
  
%   ind_nor05=find((lat(841,:)>-43.5) & (lon(841,:)<-74)); %Norte
%   ind_sur05=find((lat(841,:)<-43.5) & (lon(841,:)<-74));%Sur
%   ind_in_mic05=find((lat(841,:)>-43.5) & (lon(841,:)>-74));%MIC
%   ind_in_fior05=find((lat(841,:)<-43.5) & (lon(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor05)+length(ind_sur05)+length(ind_in_mic05)+length(ind_in_fior05)
%   inicial=length(z)
%   perdidas=final-inicial
%   
%   save('ind_nor05.mat','ind_nor05');
%   save('ind_sur05.mat','ind_sur05');
%   save('ind_in_mic05.mat','ind_in_mic05');
%   save('ind_in_fior05.mat','ind_in_fior05');    
   
  
%Calculo de indice entre 01-06
  
%   ind_nor06=find((lat(841,:)>-43.5) & (lon(841,:)<-74)); %Norte
%   ind_sur06=find((lat(841,:)<-43.5) & (lon(841,:)<-74));%Sur
%   ind_in_mic06=find((lat(841,:)>-43.5) & (lon(841,:)>-74));%MIC
%   ind_in_fior06=find((lat(841,:)<-43.5) & (lon(841,:)>-74));%Fiordos
%   
%   final=length(ind_nor06)+length(ind_sur06)+length(ind_in_mic06)+length(ind_in_fior06)
%   inicial=length(z)
%   perdidas=final-inicial
%   
%   save('ind_nor06.mat','ind_nor06');
%   save('ind_sur06.mat','ind_sur06');
%   save('ind_in_mic06.mat','ind_in_mic06');
%   save('ind_in_fior06.mat','ind_in_fior06');   
   
%%
clear all
close all
clc

addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
addpath('/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/Indices/')
dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'
file1= [dir 'mosa_VM_1mes_horario_back_AS_07-11Enero.nc']
file6= [dir 'mosa_VM_1mes_horario_back_AS_01-06Enero.nc']

lon=ncread('mosa_VM_1mes_horario_back_AS_27-31Enero.nc','lon');
lat=ncread('mosa_VM_1mes_horario_back_AS_27-31Enero.nc','lat');
z=ncread('mosa_VM_1mes_horario_back_AS_27-31Enero.nc','z');

lon6=ncread([file6],'lon');
lat6=ncread([file6],'lat');
z6=ncread([file6],'z');


load('ind_nor01.mat'); load('ind_sur01.mat'); load('ind_in_mic01.mat'); load('ind_in_fior01.mat');
load('ind_nor02.mat'); load('ind_sur02.mat'); load('ind_in_mic02.mat'); load('ind_in_fior02.mat');
load('ind_nor03.mat'); load('ind_sur03.mat'); load('ind_in_mic03.mat'); load('ind_in_fior03.mat');
load('ind_nor04.mat'); load('ind_sur04.mat'); load('ind_in_mic04.mat'); load('ind_in_fior04.mat');
load('ind_nor05.mat'); load('ind_sur05.mat'); load('ind_in_mic05.mat'); load('ind_in_fior05.mat');
load('ind_nor06.mat'); load('ind_sur06.mat'); load('ind_in_mic06.mat'); load('ind_in_fior06.mat');


%Campo de particulas en el tiempo 2

lat_ini=lat(1,:);
lon_ini=lon(1,:);
z_ini=z(1,:);
indx=find(lat_ini>0);
lat_ini(indx)=NaN;
lon_ini(indx)=NaN;
z_ini(indx)=NaN;

lat_ini6=lat6(1,:);
lon_ini6=lon6(1,:);
z_ini6=z6(1,:);
indx6=find(lat_ini6>0);
lat_ini6(indx6)=NaN;
lon_ini6(indx6)=NaN;
z_ini6(indx6)=NaN;


%% Graficos de seccion en la Boca del Guafo

figure(1)
subplot(141)
hold on
plot(lat_ini(1,:),z_ini(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini(1,ind_nor01),z_ini(1,ind_nor01),'bx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_nor02),z_ini(1,ind_nor02),'bx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_nor03),z_ini(1,ind_nor03),'bx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_nor04),z_ini(1,ind_nor04),'bx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_nor05),z_ini(1,ind_nor05),'bx','MarkerSize',10,'LineWidth',5)
%plot(lat_ini6(1,ind_nor06),z_ini6(1,ind_nor06),'bx','MarkerSize',10,'LineWidth',5)
title('Norte')
text(-43.38,-190,'a)','FontSize',25,'FontWeight','bold')
text(-43.38,-218,'N','FontName','Tlwg typist','FontSize',28,'FontWeight','bold')
text(-43.78,-218,'S','FontName','Tlwg typist','FontSize',28,'FontWeight','bold')
xlabel('Latitud')
ylabel('[m]')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
subplot(142)
hold on
plot(lat_ini(1,:),z_ini(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini(1,ind_sur01),z_ini(1,ind_sur01),'gx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_sur02),z_ini(1,ind_sur02),'gx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_sur03),z_ini(1,ind_sur03),'gx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_sur04),z_ini(1,ind_sur04),'gx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_sur05),z_ini(1,ind_sur05),'gx','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_sur06),z_ini6(1,ind_sur06),'gx','MarkerSize',10,'LineWidth',5)
title('Sur')
set(gca,'yticklabel',' ')
xlabel('Latitud')
text(-43.38,-190,'b)','FontSize',25,'FontWeight','bold')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
subplot(143)
hold on
plot(lat_ini(1,:),z_ini(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini(1,ind_in_mic01),z_ini(1,ind_in_mic01),'yx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_mic02),z_ini(1,ind_in_mic02),'yx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_mic03),z_ini(1,ind_in_mic03),'yx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_mic04),z_ini(1,ind_in_mic04),'yx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_mic05),z_ini(1,ind_in_mic05),'yx','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_in_mic06),z_ini6(1,ind_in_mic06),'yx','MarkerSize',10,'LineWidth',5)
title('Mar Interior')
set(gca,'yticklabel',' ')
set(gca,'Xdir','reverse')
text(-43.38,-190,'c)','FontSize',25,'FontWeight','bold')
xlabel('Latitud')
xlim([-43.82 -43.35])
box on
set(gca, 'FontSize', 25)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);
subplot(144)
hold on
plot(lat_ini(1,:),z_ini(1,:),'.','MarkerSize',20,'Marker','.','LineStyle','none',...
    'Color',[0.65 0.65 0.65])
plot(lat_ini(1,ind_in_fior01),z_ini(1,ind_in_fior01),'rx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_fior02),z_ini(1,ind_in_fior02),'rx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_fior03),z_ini(1,ind_in_fior03),'rx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_fior04),z_ini(1,ind_in_fior04),'rx','MarkerSize',10,'LineWidth',5)
plot(lat_ini(1,ind_in_fior05),z_ini(1,ind_in_fior05),'rx','MarkerSize',10,'LineWidth',5)
plot(lat_ini6(1,ind_in_fior06),z_ini6(1,ind_in_fior06),'rx','MarkerSize',10,'LineWidth',5)
title('Fiordos')
text(-43.38,-190,'d)','FontSize',25,'FontWeight','bold')
xlabel('Latitud')
title('Fiordos')
set(gca,'yticklabel',' ')
xlim([-43.82 -43.35])
set(gca,'Xdir','reverse')
box on
set(gca, 'FontSize', 25)
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 2);


%% Grafico de particulas horizontal

clear all
close all
clc

addpath(genpath('/home/valentina/Descargas/m_map1.4/m_map/'))
addpath('/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/Indices/')
dir= '/media/valentina/TOSHIBA/OPENDRIFT/Simualacion_final/Mareas/'
file1= [dir 'mosa_VM_1mes_horario_back_AS_07-11Enero.nc']

lon=ncread([file1],'lon');
lat=ncread([file1],'lat');
z=ncread([file1],'z');

load('ind_nor01.mat'); load('ind_sur01.mat'); load('ind_in_mic01.mat'); load('ind_in_fior01.mat');
load('ind_nor02.mat'); load('ind_sur02.mat'); load('ind_in_mic02.mat'); load('ind_in_fior02.mat');
load('ind_nor03.mat'); load('ind_sur03.mat'); load('ind_in_mic03.mat'); load('ind_in_fior03.mat');
load('ind_nor04.mat'); load('ind_sur04.mat'); load('ind_in_mic04.mat'); load('ind_in_fior04.mat');
load('ind_nor05.mat'); load('ind_sur05.mat'); load('ind_in_mic05.mat'); load('ind_in_fior05.mat');
load('ind_nor06.mat'); load('ind_sur06.mat'); load('ind_in_mic06.mat'); load('ind_in_fior06.mat');



 figure()
 subplot(131)
 hold on
 m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Particulas del Norte')
 decimar=100;
 m_plot(lon(:,ind_sur01(1:decimar:end)),lat(:,ind_sur01(1:decimar:end)),'marker','o','color','b','markerfacecolor','r','markersize',4); 
 caxis([-340 0])
 set(gca, 'FontSize', 17)
 
 
 
 
 
%  for i=1:100
%  hold on
%  %m_plot(lon(:,ind_up(i)),lat(:,ind_up(i)),'marker','o','color','k','markerfacecolor','r','markersize',4); 
%  m_scatter(lon(:,ind_up(i)),lat(:,ind_up(i)),30.0,z(:,ind_up(i)),'filled'); 
%  caxis([-340 0])
%  hold off 
%  end
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
   total_ini=length(z); 
   in_up=length(ind_in_up); % cantidad de particulas provenientes del mar interior que no se pegan en la costa
   in_down=length(ind_in_down) % cantidad de particulas provenientes del los fiordos
   up=length(ind_up); % cantidad de provenientes del norte que no se pegan en la costa
   down=length(ind_down); % cantidad de provenientes del sur que no se pegan en la costa
   
   
   total_np=in_up+in_down+up+down
   
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
   
   disp(['in_up ' ' in_down '   'up ' 'down ' 'total_np'])
   cantidad=[length(ind_in_up) length(ind_in_down) length(ind_up) length(ind_down) total_np ]
 
