clear all
close all
clc
addpath '/home/valentina/Escritorio/Tesis1'


mosa1='mosa_RIO_avg_Y8S1.nc'
mosa2='mosa_RIO_avg_Y8S2.nc'


lat=ncread(mosa1,'lat_rho');
lat=lat(161:end,240:end);
lon=ncread(mosa1,'lon_rho');
lon=lon(161:end,240:end);
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


 
%% Promedio Estacional Superficial Fosfato 

PO4_sup1=squeeze(PO4_1(:,:,42,:));
PO4_sup2=squeeze(PO4_2(:,:,42,:));
tierra=(find(mask==0));

%hacer NaN los valores de la tierra 

%Primer semestre
for i=1:6
    po4=PO4_sup1(:,:,i);
    po4(tierra)=NaN;
    PO4_sup1(:,:,i)=po4;
end

clear po4
%Segundo semestre
for i=1:6
    po4=PO4_sup2(:,:,i);
    po4(tierra)=NaN;
    PO4_sup2(:,:,i)=po4;
end

clear po4; close all

PO4_sup1=PO4_sup1(161:end,240:end,:);
PO4_sup2=PO4_sup2(161:end,240:end,:);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedios estacionales


%Promedio Verano
ver_po4(:,:,1)=PO4_sup1(:,:,1);
ver_po4(:,:,2)=PO4_sup1(:,:,2);
ver_po4(:,:,3)=PO4_sup2(:,:,6);
m_ver_po4=nanmean(ver_po4,3);

%Promedio Otoño

oto_po4(:,:,1)=PO4_sup1(:,:,3);
oto_po4(:,:,2)=PO4_sup1(:,:,4);
oto_po4(:,:,3)=PO4_sup1(:,:,5);
m_oto_po4=nanmean(oto_po4,3);

%Promedio Invierno

inv_po4(:,:,1)=PO4_sup1(:,:,6);
inv_po4(:,:,2)=PO4_sup2(:,:,1);
inv_po4(:,:,3)=PO4_sup2(:,:,2);
m_inv_po4=nanmean(inv_po4,3);

%Promedio Primavera
pri_po4(:,:,1)=PO4_sup2(:,:,3);
pri_po4(:,:,2)=PO4_sup2(:,:,4);
pri_po4(:,:,3)=PO4_sup2(:,:,5);
m_pri_po4=nanmean(pri_po4,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Figura de los promedios estacionales

% defino los niveles en los que quiero que varíe la paleta de colores

levels=[min(min(m_ver_po4)):0.1:max(max(m_oto_po4))];


figure()
subplot(141)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_ver_po4'),levels,'linecolor','none');
colormap jet
title('Verano')
set(gca,'Fontsize',18)


subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_oto_po4'),levels,'linecolor','none');
colormap jet
% h=colorbar
% h.Title.String = "PO4";
% caxis([0.3221  1.4960])
title('Otoño')
set(gca,'Fontsize',18)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_inv_po4'),levels,'linecolor','none');
% h=colorbar
% h.Title.String = "PO4";
% caxis([0.3221  1.4960])
colormap jet
title('Invierno')
set(gca,'Fontsize',18)

subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_pri_po4'),levels,'linecolor','none');
h=colorbar
h.Title.String = "PO4";
caxis([0.3221 1.4960])
colormap jet
title('Primavera')
set(gca,'Fontsize',18)
%set(H,'Position', [0.9  0.07  0.02  0.85]);
ylabel(h, '\mumol P/L','fontsize',16)

%% Mapa Mensual superficial Fosfato 


levels=[0.3:0.1:1.5];


figure()
ax1=subplot(341)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup1(:,:,1))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[]);
colormap(jet)
caxis([0.3  1.5])
title('Enero')
set(gca,'Fontsize',13)

ax2=subplot(342)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup1(:,:,2))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[]);
colormap jet
title('Febrero')
caxis([0.3  1.5])
set(gca,'Fontsize',13)

ax3=subplot(343)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on
m_contourf(lon(:,1),lat(1,:),(PO4_sup1(:,:,3))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[]);
colormap jet
caxis([0.3  1.5])
title('Marzo')
set(gca,'Fontsize',13)

ax4=subplot(344)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup1(:,:,4))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[]);
colormap jet
% h=colorbar
% h.Title.String = "PO4";
title('Abril')
set(gca,'Fontsize',13)
% set(h,'YTick',0.3:0.2:1.5)
% ylabel(h, '\mumol/L','fontsize',16)


ax5=subplot(345)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup1(:,:,5))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[])
colormap jet
title('Mayo')
caxis([0.3  1.5])
set(gca,'Fontsize',13)

ax6=subplot(346)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup1(:,:,6))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[]);
colormap jet
title('Junio')
caxis([0.3  1.5])
set(gca,'Fontsize',13)

ax7=subplot(347)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup2(:,:,1))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[]);
colormap jet
title('Julio')
caxis([0.3  1.5])
set(gca,'Fontsize',13)

ax8=subplot(348)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup2(:,:,2))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[]);
colormap jet
title('Agosto')
% h=colorbar
% caxis([0.3  1.5])
% set(h,'YTick',0.3:0.2:1.5)
set(gca,'Fontsize',13)
% ylabel(h, '\mumol/L','fontsize',16)

ax9=subplot(349)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup2(:,:,3))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[-76:2:-72]);
colormap jet
title('Septiembre')
set(gca,'Fontsize',13)

ax10=subplot(3,4,10)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup2(:,:,4))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[-76:2:-72]);
colormap jet
title('Octubre')
set(gca,'Fontsize',13)

ax11=subplot(3,4,11)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup2(:,:,5))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[-76:2:-72]);
colormap jet
title('Noviembre')
set(gca,'Fontsize',13)

ax12=subplot(3,4,12)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
hold on;
m_contourf(lon(:,1),lat(1,:),(PO4_sup2(:,:,6))',levels,'linecolor','none');
m_grid('box','fancy','tickdir','in','backgroundcolor',[.9 .9 .9],'xticklabels',[],'yticklabels',[-76:2:-72]);
colormap jet
h=colorbar
h.Title.String = "PO4";
caxis([0.3  1.5])
set(h,'YTick',0.3:0.2:1.5)
title('Diciembre')
set(gca,'Fontsize',13)
ylabel(h, '\mumol/L','fontsize',16)
set(h,'Position', [0.9  0.07  0.02  0.85]);

x1=0.07;
y1=0.07;
x2=0.266;
y2=0.2657;

set(ax1,'position',[ x1      y1+0.6 x2 y2]);
set(ax2,'position',[ x1+0.19 y1+0.6 x2 y2]);
set(ax3,'position',[ x1+0.38 y1+0.6 x2 y2]);
set(ax4,'position',[ x1+0.56 y1+0.6 x2 y2]);

set(ax5,'position',[ x1      y1+0.3 x2 y2]);
set(ax6,'position',[ x1+0.19 y1+0.3 x2 y2]);
set(ax7,'position',[ x1+0.38 y1+0.3 x2 y2]);
set(ax8,'position',[ x1+0.56 y1+0.3 x2 y2]);

set(ax9,'position', [x1       y1 x2 y2]);
set(ax10,'position',[ x1+0.19 y1 x2 y2]);
set(ax11,'position',[ x1+0.38 y1 x2 y2]);
set(ax12,'position',[ x1+0.56 y1 x2 y2]);


 %% Mapa superficial Silicio
 
Si=squeeze(Si_1(:,:,:,1));
tierra=(find(mask==0)); %encontrar las posiciones done los valores son tierra

%hacer NaN los valores de la tierra 

for i=1:42
    si=Si(:,:,i);
    si(tierra)=NaN;
    Si(:,:,i)=si;
end

title_1 = 'Silicio Superficial'; 
ylabel_1 = 'Latitud';             
xlabel_1 = 'Longitud';       

%'umol P L-1'

figure('Position',[969,93,579,807])
 pcolor(lon,lat,Si(161:end,240:end,42))
 shading interp
 colorbar
 h = colorbar;
 caxis([min(min(Si(161:end,240:end,42))) max(max(Si(161:end,240:end,42)))])
 xlabel(xlabel_1,'color','k','Fontsize',13,'FontName','Helvetica')
 ylabel(ylabel_1,'Fontsize',13,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k') 
 set(gca,'TickDir','out') 
 set(gca,'XMinorTick','on','YMinorTick','on')
 set(get(h,'title'),'string','Si','Fontsize',18,'FontName','Helvetica')
 set(gca,'Fontsize',18,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k')
 
 
 %% Promedio Estacional Superficial Silicio
 
Si_sup1=squeeze(Si_1(:,:,42,:));
Si_sup2=squeeze(Si_2(:,:,42,:));
tierra=(find(mask==0));


%hacer NaN los valores de la tierra 

%Primer semestre
for i=1:6
    si=Si_sup1(:,:,i);
    si(tierra)=NaN;
    Si_sup1(:,:,i)=si;
end

clear si
%Segundo semestre
for i=1:6
    si=Si_sup2(:,:,i);
    si(tierra)=NaN;
    Si_sup2(:,:,i)=si;
end

clear si; close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedios estacionales

Si_sup1=Si_sup1(161:end,240:end,:);
Si_sup2=Si_sup2(161:end,240:end,:);


%Promedio Verano
ver_si(:,:,1)=Si_sup1(:,:,1);
ver_si(:,:,2)=Si_sup1(:,:,2);
ver_si(:,:,3)=Si_sup2(:,:,6);
m_ver_si=nanmean(ver_si,3);

%Promedio Otoño

oto_si(:,:,1)=Si_sup1(:,:,3);
oto_si(:,:,2)=Si_sup1(:,:,4);
oto_si(:,:,3)=Si_sup1(:,:,5);
m_oto_si=nanmean(oto_si,3);

%Promedio Invierno

inv_si(:,:,1)=Si_sup1(:,:,6);
inv_si(:,:,2)=Si_sup2(:,:,1);
inv_si(:,:,3)=Si_sup2(:,:,2);
m_inv_si=nanmean(inv_si,3);

%Promedio Primavera

pri_si(:,:,1)=Si_sup2(:,:,3);
pri_si(:,:,2)=Si_sup2(:,:,4);
pri_si(:,:,3)=Si_sup2(:,:,5);
m_pri_si=nanmean(pri_si,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Figura de los promedios estacionales

% defino los niveles en los que quiero que varíe la paleta de colores

levels=[min(min(m_ver_si)):0.5:max(max(m_ver_si))];


figure()
subplot(141)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_ver_si'),levels,'linecolor','none');
colormap jet
h=colorbar
h.Title.String = "Si";
%caxis([30 90.8145])
title('Verano')
set(gca,'Fontsize',18)

subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_oto_si'),levels,'linecolor','none');
colormap jet
h=colorbar
h.Title.String = "Si";
caxis([ 0.3904  90.8145])
title('Otoño')
set(gca,'Fontsize',18)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_inv_si'),levels,'linecolor','none');
 h=colorbar
 h.Title.String = "Si";
% caxis([ 0.3904 90.8145])
colormap jet
title('Invierno')
set(gca,'Fontsize',18)

subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_pri_si'),levels,'linecolor','none');
h=colorbar
h.Title.String = "Si";
caxis([0.3904 90.8145])
colormap jet
title('Primavera')
set(gca,'Fontsize',18)
%set(H,'Position', [0.9  0.07  0.02  0.85]);
ylabel(h, '[\mu mol S/L]','fontsize',16)

 
 %%  Mapa superficial Nitrato
 
NO3=squeeze(NO3(:,:,:,1));
tierra=(find(mask==0)); %encontrar las posiciones done los valores son tierra

%hacer NaN los valores de la tierra 

for i=1:42
    no3=NO3(:,:,i);
    no3(tierra)=NaN;
    NO3(:,:,i)=no3;
end

title_1 = 'Nitrato Superficial'; 
ylabel_1 = 'Latitud';             
xlabel_1 = 'Longitud';       

%'umol P L-1'

figure('Position',[969,93,579,807])
 pcolor(lon,lat,NO3(161:end,240:end,42))
 shading interp
 colorbar
 h = colorbar;
 caxis([min(min(NO3(161:end,240:end,42))) max(max(NO3(161:end,240:end,42)))])
 xlabel(xlabel_1,'color','k','Fontsize',13,'FontName','Helvetica')
 ylabel(ylabel_1,'Fontsize',13,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k') 
 set(gca,'TickDir','out') 
 set(gca,'XMinorTick','on','YMinorTick','on')
 set(get(h,'title'),'string','NO3','Fontsize',18,'FontName','Helvetica')
 set(gca,'Fontsize',18,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k')
 
 %% Promedio estacional superficial nitrato
  
NO3_sup1=squeeze(NO3_1(:,:,42,:));
NO3_sup2=squeeze(NO3_2(:,:,42,:));
tierra=(find(mask==0));


%hacer NaN los valores de la tierra 

%Primer semestre
for i=1:6
    no3=NO3_sup1(:,:,i);
    no3(tierra)=NaN;
    NO3_sup1(:,:,i)=no3;
end

clear no3
%Segundo semestre
for i=1:6
    no3=NO3_sup2(:,:,i);
    no3(tierra)=NaN;
    NO3_sup2(:,:,i)=no3;
end

clear no3; close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedios estacionales

NO3_sup1=NO3_sup1(161:end,240:end,:);
NO3_sup2=NO3_sup2(161:end,240:end,:);


%Promedio Verano
ver_no3(:,:,1)=NO3_sup1(:,:,1);
ver_no3(:,:,2)=NO3_sup1(:,:,2);
ver_no3(:,:,3)=NO3_sup2(:,:,6);
m_ver_no3=nanmean(ver_no3,3);

%Promedio Otoño

oto_no3(:,:,1)=NO3_sup1(:,:,3);
oto_no3(:,:,2)=NO3_sup1(:,:,4);
oto_no3(:,:,3)=NO3_sup1(:,:,5);
m_oto_no3=nanmean(oto_no3,3);

%Promedio Invierno

inv_no3(:,:,1)=NO3_sup1(:,:,6);
inv_no3(:,:,2)=NO3_sup2(:,:,1);
inv_no3(:,:,3)=NO3_sup2(:,:,2);
m_inv_no3=nanmean(inv_no3,3);

%Promedio Primavera

pri_no3(:,:,1)=NO3_sup2(:,:,3);
pri_no3(:,:,2)=NO3_sup2(:,:,4);
pri_no3(:,:,3)=NO3_sup2(:,:,5);
m_pri_no3=nanmean(pri_no3,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Figura de los promedios estacionales

% defino los niveles en los que quiero que varíe la paleta de colores

levels=[min(min(m_ver_no3)):1:max(max(m_oto_no3))];


figure()
subplot(141)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_ver_no3'),levels,'linecolor','none');
colormap jet
% h=colorbar
% h.Title.String = "Si";
% caxis([ 0.3904 90.8145])
title('Verano')
set(gca,'Fontsize',18)

subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_oto_no3'),levels,'linecolor','none');
colormap jet
% h=colorbar
% h.Title.String = "Si";
% caxis([ 0.3904  90.8145])
title('Otoño')
set(gca,'Fontsize',18)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_inv_no3'),levels,'linecolor','none');
% h=colorbar
% h.Title.String = "Si";
% caxis([ 0.3904 90.8145])
colormap jet
title('Invierno')
set(gca,'Fontsize',18)

subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_pri_no3'),levels,'linecolor','none');
h=colorbar
h.Title.String = "NO3";
caxis([min(min(m_ver_no3)) max(max(m_oto_no3))])
colormap jet
title('Primavera')
set(gca,'Fontsize',18)
ylabel(h, '[\mumol N/L]','fontsize',16)
 
 
 
 
 
 %% Mapa superficial Amonio
 
NH4=squeeze(NH4_1(:,:,:,1));
tierra=(find(mask==0)); %encontrar las posiciones done los valores son tierra

%hacer NaN los valores de la tierra 

for i=1:42
    nh4=NH4(:,:,i);
    nh4(tierra)=NaN;
    NH4(:,:,i)=nh4;
end

title_1 = 'Amonio Superficial'; 
ylabel_1 = 'Latitud';             
xlabel_1 = 'Longitud';       

%'umol P L-1'

figure('Position',[969,93,579,807])
 pcolor(lon,lat,NH4(161:end,240:end,42))
 shading interp
 colorbar
 h = colorbar;
 caxis([min(min(NH4(161:end,240:end,42))) max(max(NH4(161:end,240:end,42)))])
 xlabel(xlabel_1,'color','k','Fontsize',13,'FontName','Helvetica')
 ylabel(ylabel_1,'Fontsize',13,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k') 
 set(gca,'TickDir','out') 
 set(gca,'XMinorTick','on','YMinorTick','on')
 set(get(h,'title'),'string','NH4','Fontsize',18,'FontName','Helvetica')
 set(gca,'Fontsize',18,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k')
 
 
 %% Promedio estacional superficial Amonio
 
NH4_sup1=squeeze(NH4_1(:,:,42,:));
NH4_sup2=squeeze(NH4_2(:,:,42,:));
tierra=(find(mask==0));


%hacer NaN los valores de la tierra 

%Primer semestre
for i=1:6
    nh4=NH4_sup1(:,:,i);
    nh4(tierra)=NaN;
    NH4_sup1(:,:,i)=nh4;
end

clear nh4
%Segundo semestre
for i=1:6
    nh4=NH4_sup2(:,:,i);
    nh4(tierra)=NaN;
    NH4_sup2(:,:,i)=nh4;
end

clear nh4; close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedios estacionales

NH4_sup1=NH4_sup1(161:end,240:end,:);
NH4_sup2=NH4_sup2(161:end,240:end,:);

%Promedio Verano
ver_nh4(:,:,1)=NH4_sup1(:,:,1);
ver_nh4(:,:,2)=NH4_sup1(:,:,2);
ver_nh4(:,:,3)=NH4_sup2(:,:,6);
m_ver_nh4=nanmean(ver_nh4,3);

%Promedio Otoño

oto_nh4(:,:,1)=NH4_sup1(:,:,3);
oto_nh4(:,:,2)=NH4_sup1(:,:,4);
oto_nh4(:,:,3)=NH4_sup1(:,:,5);
m_oto_nh4=nanmean(oto_nh4,3);

%Promedio Invierno

inv_nh4(:,:,1)=NH4_sup1(:,:,6);
inv_nh4(:,:,2)=NH4_sup2(:,:,1);
inv_nh4(:,:,3)=NH4_sup2(:,:,2);
m_inv_nh4=nanmean(inv_nh4,3);

%Promedio Primavera

pri_nh4(:,:,1)=NH4_sup2(:,:,3);
pri_nh4(:,:,2)=NH4_sup2(:,:,4);
pri_nh4(:,:,3)=NH4_sup2(:,:,5);
m_pri_nh4=nanmean(pri_nh4,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Figura de los promedios estacionales

% defino los niveles en los que quiero que varíe la paleta de colores

levels=[min(min(m_ver_nh4)):0.1:max(max(m_oto_nh4))];


figure()
subplot(141)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_ver_nh4'),levels,'linecolor','none');
colormap jet
h=colorbar
h.Title.String = "NH4";
title('Verano')
set(gca,'Fontsize',18)

subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_oto_nh4'),levels,'linecolor','none');
colormap jet
h=colorbar
h.Title.String = "NH4";
title('Otoño')
set(gca,'Fontsize',18)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_inv_nh4'),levels,'linecolor','none');
h=colorbar
h.Title.String = "NH4";
% caxis([min(min(m_ver_nh4)) max(max(m_oto_nh4))])
colormap jet
title('Invierno')
set(gca,'Fontsize',18)

subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_pri_nh4'),levels,'linecolor','none');
h=colorbar
h.Title.String = "NH4";
%caxis([min(min(m_ver_nh4)) max(max(m_oto_nh4))])
colormap jet
title('Primavera')
set(gca,'Fontsize',18)
ylabel(h, '[\mumol N/L]','fontsize',16)
 
 


 %% Mapa superficial oxígeno
 
O2=squeeze(O2(:,:,:,1));
tierra=(find(mask==0)); %encontrar las posiciones done los valores son tierra

%hacer NaN los valores de la tierra 

for i=1:42
    o2=O2(:,:,i);
    o2(tierra)=NaN;
    O2(:,:,i)=o2;
end

title_1 = 'Oxigeno';  
ylabel_1 = 'Latitud';               
xlabel_1 = 'Longitud';         

%dividir por 44660

jj=(O2(161:end,240:end,42))

figure('Position',[969,93,573,801])
 pcolor(lon,lat,O2(161:end,240:end,42)/44660)
 shading interp
 colorbar
 h = colorbar;
 caxis([min(min(O2(161:end,240:end,42)/44660)) max(max(O2(161:end,240:end,42)/44660))])
 xlabel(xlabel_1,'color','k','Fontsize',13,'FontName','Helvetica')
 ylabel(ylabel_1,'Fontsize',13,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k') 
 set(gca,'TickDir','out') % forzar los tick mark por afuera
 set(gca,'XMinorTick','on','YMinorTick','on')
 h.Label.String = 'OXY [ml/L]';
 %set(get(h,'title'),'string','Oxy','Fontsize',18,'FontName','Helvetica')
 set(gca,'Fontsize',18,'FontName','Helvetica')
 title(title_1,'FontWeight','bold','Fontsize',20,'FontName','Helvetica','Color','k')

 %% Promedio estacional superficial oxigeno
 
O2_sup1=squeeze(O2_1(:,:,42,:));
O2_sup2=squeeze(O2_2(:,:,42,:));
tierra=(find(mask==0));


%hacer NaN los valores de la tierra 

%Primer semestre
for i=1:6
    o2=O2_sup1(:,:,i);
    o2(tierra)=NaN;
    O2_sup1(:,:,i)=o2;
end

clear o2
%Segundo semestre
for i=1:6
    o2=O2_sup2(:,:,i);
    o2(tierra)=NaN;
    O2_sup2(:,:,i)=o2;
end

clear o2; close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Promedios estacionales

O2_sup1=O2_sup1(161:end,240:end,:);
O2_sup2=O2_sup2(161:end,240:end,:);


%Promedio Verano
ver_o2(:,:,1)=O2_sup1(:,:,1);
ver_o2(:,:,2)=O2_sup1(:,:,2);
ver_o2(:,:,3)=O2_sup2(:,:,6);
m_ver_o2=nanmean(ver_o2,3)/44660;

%Promedio Otoño

oto_o2(:,:,1)=O2_sup1(:,:,3);
oto_o2(:,:,2)=O2_sup1(:,:,4);
oto_o2(:,:,3)=O2_sup1(:,:,5);
m_oto_o2=nanmean(oto_o2,3)/44660;

%Promedio Invierno

inv_o2(:,:,1)=O2_sup1(:,:,6);
inv_o2(:,:,2)=O2_sup2(:,:,1);
inv_o2(:,:,3)=O2_sup2(:,:,2);
m_inv_o2=nanmean(inv_o2,3)/44660;

%Promedio Primavera

pri_o2(:,:,1)=O2_sup2(:,:,3);
pri_o2(:,:,2)=O2_sup2(:,:,4);
pri_o2(:,:,3)=O2_sup2(:,:,5);
m_pri_o2=nanmean(pri_o2,3)/44660;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Figura de los promedios estacionales

% defino los niveles en los que quiero que varíe la paleta de colores

levels=[min(min(m_oto_o2)):0.0001:max(max(m_oto_o2))];


figure()
subplot(141)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_ver_o2'),levels,'linecolor','none');
colormap jet
% h=colorbar
% h.Title.String = "Si";
% caxis([ 0.3904 90.8145])
title('Verano')
set(gca,'Fontsize',18)

subplot(142)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_oto_o2'),levels,'linecolor','none');
colormap jet
% h=colorbar
% h.Title.String = "Si";
% caxis([ 0.3904  90.8145])
title('Otoño')
set(gca,'Fontsize',18)

subplot(143)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_inv_o2'),levels,'linecolor','none');
% h=colorbar
% h.Title.String = "Si";
% caxis([ 0.3904 90.8145])
colormap jet
title('Invierno')
set(gca,'Fontsize',18)

subplot(144)
set(gcf,'position',[10,10,700,800]) %establece el marco del grafico
m_proj('robinson','lon',[lon(1,1) lon(end,1)],'lat',[lat(1,1) lat(1,end)]);
m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
m_gshhs_f('speckle','color','k');    % with speckle added
m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
hold on;
m_contourf(lon(:,1),lat(1,:),(m_pri_o2'),levels,'linecolor','none');
h=colorbar
h.Title.String = "O2";
caxis([min(min(m_ver_o2)) max(max(m_oto_o2))])
colormap jet
title('Primavera')
set(gca,'Fontsize',18)
ylabel(h, '[ml/L]','fontsize',16)