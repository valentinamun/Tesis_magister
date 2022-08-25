%Perfiles Verticales

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

%Encontrar las el punto mas cercano a las posiciones


% C= repmat(lon,[1 length(-73.9267)]);
% [valor_min,idx_cercano] =min(abs(C-(-73.9267)'));
% lon_cercana = lon(idx_cercano);
% C= repmat(lat,[1 length(-43.3218)]);
% [valor_min,idx_cercano2] = min(abs(C-(-43.3218)'));
% lat_cercana = lat(idx_cercano2);
% 
% %encontar las posiciones de la longitud y latitud cercana al anclaje.
% pos_lonE1=find(lon==lon_cercana)  
% pos_latE2=find(lat==lat_cercana) 

lon_pos=[56 66 82 97 111 110 103]
lat_pos=[152 139 137 136 135 153 123]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Perfiles verticales Fosfato estacion 1

[x1,prof1,po4_ver1_1]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',1);
[x1,prof1,po4_ver2_1]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',2);
[x1,prof1,po4_ver6_2]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',6);

[x2,prof2,po4_ver3_1]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',3);
[x2,prof2,po4_ver4_1]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',4);
[x2,prof2,po4_ver5_1]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',5);

[x3,prof3,po4_ver6_1]=get_section('mosa_RIO_avg_Y8S1.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',6);
[x3,prof3,po4_ver1_2]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',1);
[x3,prof3,po4_ver2_2]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',2);

[x4,prof4,po4_ver3_2]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',3);
[x4,prof4,po4_ver4_2]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',4);
[x4,prof4,po4_ver5_2]=get_section('mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc',[lon(lon_pos(1)) -72],lat(lat_pos(1)),'PO4',5);


ylabel_1 = 'Profundidad [m]';              
xlabel_1 = ('PO4 [umol P/L]');  
xmin = 0.8; xmax = 1.6; 
ymin = 0.0; ymax = 95;  

    figure ()
    subplot(141)
    hold on
    plot(po4_ver6_2(:,1),-1*prof1(:,1),'g','LineWidth',2)
    plot(po4_ver1_1(:,1),-1*prof1(:,1),'k','LineWidth',2)
    plot(po4_ver2_1(:,1),-1*prof1(:,1),'r','LineWidth',2)
    hold off
    axis([xmin xmax ymin ymax])
    xlabel(xlabel_1,'Fontsize',13)
    ylabel(ylabel_1,'Fontsize',13)
    text(1,5+0.5,'Lon= -74.6250','Fontsize',15,...
        'FontName','Helvetica','Color','k')
    text(1,9,'Lat= -43.3218 ','Fontsize',15,...
        'FontName','Helvetica','Color','k')
    legend('Diciembre','Enero','Febrero','Location','southwest')
    set(gca,'TickDir','out')
    set(gca,'Ydir','reverse')
    set(gca,'XMinorTick','on','YMinorTick','on')
    set(gca,'Fontsize',13,'FontName','Helvetica')
    title('Perfiles verticales Verano','FontWeight','bold','Fontsize',15,'FontName','Helvetica','Color','k')
    grid minor
    
    subplot(142)
    hold on
    plot(po4_ver3_1(:,1),-1*prof2(:,1),'g','LineWidth',2)
    plot(po4_ver4_1(:,1),-1*prof2(:,1),'k','LineWidth',2)
    plot(po4_ver5_1(:,1),-1*prof2(:,1),'r','LineWidth',2)
    hold off
    axis([xmin xmax ymin ymax])
    xlabel(xlabel_1,'Fontsize',13)
    ylabel(ylabel_1,'Fontsize',13)
    legend('Marzo','Abril','Mayo','Location','southwest')
    set(gca,'TickDir','out')
    set(gca,'Ydir','reverse')
    set(gca,'XMinorTick','on','YMinorTick','on')
    set(gca,'Fontsize',13,'FontName','Helvetica')
    title('Perfiles Verticales Otoño','FontWeight','bold','Fontsize',15,'FontName','Helvetica','Color','k')
    grid minor

        
    subplot(143)
    hold on
    plot(po4_ver6_1(:,1),-1*prof3(:,1),'g','LineWidth',2)
    plot(po4_ver1_2(:,1),-1*prof3(:,1),'k','LineWidth',2)
    plot(po4_ver2_2(:,1),-1*prof3(:,1),'r','LineWidth',2)
    hold off
    axis([xmin xmax ymin ymax])
    xlabel(xlabel_1,'Fontsize',13)
    ylabel(ylabel_1,'Fontsize',13)
    legend('Junio','Julio','Agosto','Location','southwest')
    set(gca,'TickDir','out')
    set(gca,'Ydir','reverse')
    set(gca,'XMinorTick','on','YMinorTick','on')
    set(gca,'Fontsize',13,'FontName','Helvetica')
    title('Perfiles Verticales  Invierno','FontWeight','bold','Fontsize',15,'FontName','Helvetica','Color','k')
    grid minor

    subplot(144)
    hold on
    plot(po4_ver3_2(:,1),-1*prof4(:,1),'g','LineWidth',2)
    plot(po4_ver4_2(:,1),-1*prof4(:,1),'k','LineWidth',2)
    plot(po4_ver5_2(:,1),-1*prof4(:,1),'r','LineWidth',2)
    hold off
    axis([xmin xmax ymin ymax])
    xlabel(xlabel_1,'Fontsize',13)
    ylabel(ylabel_1,'Fontsize',13)
    legend('Septiembre','Octubre','Noviembre','Location','southwest')
    set(gca,'TickDir','out')
    set(gca,'Ydir','reverse')
    set(gca,'XMinorTick','on','YMinorTick','on')
    set(gca,'Fontsize',13,'FontName','Helvetica')
    title('Perfiles Verticales Primavera','FontWeight','bold','Fontsize',15,'FontName','Helvetica','Color','k')
    grid minor
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Estacion 2 


%% Hovmuller

%Hovmuller Fosfato Latitud 

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


PO4H_1=squeeze(PO4_sup1(:,145,:));
PO4H_2=squeeze(PO4_sup2(:,145,:));
time=(1:12)';

po4h=[PO4H_1 PO4H_2];

t1=datetime(2019,12,1)+calmonths(1:12)

figure()
contourf(lon,month(t1),po4h')
datetick('y','mmm','keeplimits')
h = colorbar;
ylabel(h, '[\mumol P/L]','fontsize',15)
title('Fosfato Superficial a 43.4°S','FontSize',15)
ylabel('Meses','fontsize',15)
xlabel('Longitud','fontsize',15)
set(gca,'FontSize',16)











