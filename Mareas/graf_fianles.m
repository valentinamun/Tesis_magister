%Graficos de las secciones de todos los modelos
clear all
close all
clc

addpath('/media/valentina/TOSHIBA/Tesis1/mareas/Batimetria/')

load('residual.mat'); load('lat.mat') ; load('z.mat') %residual de la simualcion con mareas mosa 2.7
load('residual_mosa12.mat'); load('lat_mosa12.mat') ; load('z_mosa12.mat') %residual de la simulacion con mareas mosa 1.2
%load('u_mar_gua.mat')%simulacion con mareas mosa 2.7
%load('u_mar_gua_12.mat')%simualcion con mareas mosa 1.2
%load('u_sm_gua.mat')%simualcion mosa sin mareas 2.7
load('batimetria_guafo.mat')
load('lat_mer.mat'); load('u_mer.mat'); load('z_mer.mat');

cmap = colormap_cpt('Balance.cpt');

figure()
subplot(131)
hold on
pcolor(lat(:,7:30),z(:,7:30),residual(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),residual(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',3);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',3,'LineStyle','--') 
ylabel('[m]')
xlabel('Latitude')
title('MOSA 2.7 km','FontWeight','Normal')
text(-43.42,-200,'a)','FontSize',30,'FontWeight','bold')
text(-43.42,-235,'N','FontName','Tlwg Typist','FontSize',30,'FontWeight','bold')
text(-43.75,-235,'S','FontName','Tlwg Typist','FontSize',30,'FontWeight','bold')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 3);
set(gca,'Fontsize',25)
subplot(132)
hold on
pcolor(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53))
C = contour(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53),[-1600000 0 160000],...
            '--w','LineWidth',3);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',3,'LineStyle','--')     
title('MOSA 1.2 km','FontWeight','Normal')
text(-43.42,-200,'b)','FontSize',30,'FontWeight','bold')
set(gca,'Xdir','reverse')
xlabel('Latitude')
colormap(cmap)
shading interp 
caxis([-0.4 0.4])
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'yticklabel',' ')
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 3);
set(gca,'Fontsize',25)

subplot(133)
hold on
pcolor(lat_mer,z_mer,u_mer)
C = contour(lat_mer,z_mer,u_mer,[-1600000 0 160000],...
            '--w','LineWidth',3);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',3,'LineStyle','--') 
xlabel('Latitude')
title('MERCATOR','FontWeight','Normal')
text(-43.42,-200,'c)','FontSize',30,'FontWeight','bold')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
set(gca,'yticklabel',' ')
h=colorbar
h.Title.String = "[m/s]";
set(h,'Position',[0.9302 0.116 0.0109 0.810],'FontSize',25)% To change size
set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',25,'FontWeight','Normal', 'LineWidth', 3);
set(gca,'Fontsize',25)


%%
figure()
subplot(231)
hold on
pcolor(lat(:,7:30),z(:,7:30),residual(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),residual(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--') 
ylabel('[m]')
title('Residual 2.7km CM')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
subplot(232)
hold on
pcolor(lat(:,7:30),z(:,7:30),u_mar_gua(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),u_mar_gua(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--') 
title('U-vel 2.7km CM')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
set(gca,'yticklabel',' ')
%set(gca, 'ygrid','on')

subplot(233)
hold on
pcolor(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53))
C = contour(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53),[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--')     
title('Residual 1.2km CM')
set(gca,'Xdir','reverse')
colormap(cmap)
shading interp 
caxis([-0.4 0.4])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'yticklabel',' ')
subplot(234)
hold on
pcolor(lat_mosa12(:,12:53),z_mosa12(:,12:53),u_mar_gua_12(:,12:53))
C = contour(lat_mosa12(:,12:53),z_mosa12(:,12:53),u_mar_gua_12(:,12:53),[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--') 
xlabel('Latitud')
title('U-vel 1.2 km CM')
ylabel('[m]')
set(gca,'Xdir','reverse')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
subplot(235)
hold on
pcolor(lat(:,7:30),z(:,7:30),u_sm_gua(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),u_sm_gua(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--') 
xlabel('Latitud')
title('U-vel 2.7km SM')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
set(gca,'yticklabel',' ')
subplot(236)
hold on
pcolor(lat_mer,z_mer,u_mer)
C = contour(lat_mer,z_mer,u_mer,[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--') 
xlabel('Latitud')
title('U-vel Mercator')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
set(gca,'yticklabel',' ')
h=colorbar
h.Title.String = "[m/s]";
set(h,'Position',[0.9302 0.116 0.0109 0.810])% To change size
set(gca,'Fontsize',16)

%% Diferencia


figure()
subplot(121)
hold on
pcolor(lat(:,7:30),z(:,7:30),residual(:,7:30)-u_mar_gua(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),residual(:,7:30)-u_mar_gua(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--') 
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Residual-Original 2.7 km')
colormap(cmap)
shading interp
caxis([-0.03 0.03])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
colorbar
subplot(122)
hold on
pcolor(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53)-u_mar_gua_12(:,12:53))
C = contour(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53)-u_mar_gua_12(:,12:53),[-1600000 0 160000],...
            '--w','LineWidth',2);
plot(lat_guafo,batimetria_guafo,'k','LineWidth',2,'LineStyle','--') 
xlabel('Latitud')
title('Residual-Original 1.2 km')
colormap(cmap)
shading interp
caxis([-0.03 0.03])
set(gca,'Fontsize',15)
ylim([-210 0])
xlim([-43.8 -43.4])
set(gca,'Xdir','reverse')
set(gca,'yticklabel',' ')
%set(gca, 'ygrid','on')
colorbar
