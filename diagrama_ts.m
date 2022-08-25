clear all
close all
addpath '/home/valentina/Escritorio/Tesis1'
addpath '/home/valentina/Escritorio/CROCO'
addpath '/home/valentina/Documentos/seawater'

mosa1='mosa_RIO_avg_Y8S1.nc'
mosa2='mosa_RIO_avg_Y8S2.nc'

lat=ncread(mosa1,'lat_rho');
lat=lat(1,240:end);
lon=ncread(mosa1,'lon_rho');
lon=lon(161:end,1);

%Posiciones de las estaciones

lon_pos=[56 66 82 97 111 110 103]
lat_pos=[152 139 137 136 135 153 123]


%% Estacion 1-2-3 Diagramas T-S-O y T-S-P


[prof_temp_final1,prom_temp_final1,lon_cercana1,lon_cercana2,lat_cercana] =ts(-74.6250,-72,-43.3218,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,prom_sal_final1,~,~,~] =ts(-74.6250,-72,-43.3218,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final1,~,~,~] =ts(-74.6250,-72,-43.3218,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');

[prof_temp_final2,prom_temp_final2,lon_cercana1,lon_cercana2,lat_cercana] =ts(-74.7000,-72,-43.3582,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,prom_sal_final2,~,~,~] =ts(-74.7000,-72,-43.3582,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final2,~,~,~] =ts(-74.7000,-72,-43.3582,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');

[prof_temp_final3,prom_temp_final3,lon_cercana1,lon_cercana2,lat_cercana] =ts(-74.6000,-72,-43.3582,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,prom_sal_final3,~,~,~] =ts(-74.6000,-72,-43.3582,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final3,~,~,~] =ts(-74.6000,-72,-43.3582,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2')

[prof_temp_final4,prom_temp_final4,lon_cercana1,lon_cercana2,lat_cercana] =ts(-74.6250,-72,-43.4127,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,prom_sal_final4,~,~,~] =ts(-74.6250,-72,-43.4127,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final4,~,~,~] =ts(-74.6250,-72,-43.4127,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2')



%Grafico de T-S
 
ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]'; 

essw_t = 11; essw_s = 34.4;  

xmin1 =min(prom_sal_final2(:,1)) ; xmax1 = max(prom_sal_final2(:,1)); 
ymin1 = min(prom_temp_final2(:,1)); ymax1 = max(prom_temp_final2(:,1));  
[SAL1, THETA1] = meshgrid(xmin1:0.01:xmax1,ymin1:0.1:ymax1);
DENS1= sw_dens(SAL1,THETA1,0) - 1000;

xmin2 =min(prom_sal_final2(:,2)) ; xmax2 = max(prom_sal_final2(:,2)); 
ymin2 = min(prom_temp_final2(:,2)); ymax2 = max(prom_temp_final2(:,2));  
[SAL2, THETA2] = meshgrid(xmin2:0.001:xmax2,ymin2:0.001:ymax2);
DENS2= sw_dens(SAL2,THETA2,0) - 1000;

xmin3 =min(prom_sal_final4(:,3)) ; xmax3 = 34.0; 
ymin3 = 9.7; ymax3 =10.7;  
[SAL3, THETA3] = meshgrid(xmin3:0.01:xmax3,ymin3:0.1:ymax3);
DENS3 = sw_dens(SAL3,THETA3,0) - 1000;

xmin4 =min(prom_sal_final2(:,4)) ; xmax4 = max(prom_sal_final2(:,4)); 
ymin4 = min(prom_temp_final2(:,4)); ymax4 =10.5;  
[SAL4, THETA4] = meshgrid(xmin4:0.01:xmax4,ymin4:0.1:ymax4);
DENS4= sw_dens(SAL4,THETA4,0) - 1000;



    figure ()
    set(gcf,'position',[10,10,1500,800])
    subplot(141)
    hold on
    scatter(prom_sal_final1(:,1),prom_temp_final1(:,1),30.0,prof_temp_final1(:,1),'fill')
    scatter(prom_sal_final2(:,1),prom_temp_final2(:,1),30.0,prof_temp_final2(:,1),'fill')
    scatter(prom_sal_final3(:,1),prom_temp_final3(:,1),30.0,prof_temp_final3(:,1),'fill')
    scatter(prom_sal_final4(:,1),prom_temp_final4(:,1),30.0,prof_temp_final4(:,1),'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    caxis([-160 0])
    title('Verano')
    C = contour(SAL1,THETA1,DENS1,[25:0.2:30],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
%   rectangle('Position',[34.2 10 0.2 3])
%   plot(essw_s, essw_t ,'--ok',...
%             'LineWidth',2,...
%             'MarkerEdgeColor','k',...
%             'MarkerFaceColor','r',...
%             'MarkerSize',10)
        
    subplot(142)
    hold on
    scatter(prom_sal_final1(:,2),prom_temp_final1(:,2),30.0,prof_temp_final1(:,2),'fill')
    scatter(prom_sal_final2(:,2),prom_temp_final2(:,2),30.0,prof_temp_final2(:,2),'fill')
    scatter(prom_sal_final3(:,2),prom_temp_final3(:,2),30.0,prof_temp_final3(:,2),'fill')
    scatter(prom_sal_final4(:,2),prom_temp_final4(:,2),30.0,prof_temp_final4(:,2),'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    %axis([xmin2 xmax2 ymin2 ymax2])
    caxis([-160 0])
    title('Otoño')
    C = contour(SAL2,THETA2,DENS2,[20:0.2:29],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
%     rectangle('Position',[34.2 10 0.2 3])
%     plot(essw_s, essw_t ,'--ok',...
%             'LineWidth',2,...
%             'MarkerEdgeColor','k',...
%             'MarkerFaceColor','r',...
%             'MarkerSize',10) 
        
    subplot(143)
    hold on
    scatter(prom_sal_final1(:,3),prom_temp_final1(:,3),30.0,prof_temp_final1(:,3),'fill')
    scatter(prom_sal_final2(:,3),prom_temp_final2(:,3),30.0,prof_temp_final2(:,3),'fill')
    scatter(prom_sal_final3(:,3),prom_temp_final3(:,3),30.0,prof_temp_final3(:,3),'fill')
    scatter(prom_sal_final4(:,3),prom_temp_final4(:,3),30.0,prof_temp_final4(:,3),'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    %axis([xmin3 xmax3 ymin3 ymax3])
    caxis([-160 0])
    title('Invierno')
    C = contour(SAL3,THETA3,DENS3,[25:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
%     rectangle('Position',[34.2 10 0.2 3])
%     plot(essw_s, essw_t ,'--ok',...
%             'LineWidth',2,...
%             'MarkerEdgeColor','k',...
%             'MarkerFaceColor','r',...
%             'MarkerSize',10)
    
    subplot(144)
    hold on
    scatter(prom_sal_final1(:,4),prom_temp_final1(:,4),30.0,prof_temp_final1(:,4),'fill')
    scatter(prom_sal_final2(:,4),prom_temp_final2(:,4),30.0,prof_temp_final2(:,4),'fill')
    scatter(prom_sal_final3(:,4),prom_temp_final3(:,4),30.0,prof_temp_final3(:,4),'fill')
    scatter(prom_sal_final4(:,4),prom_temp_final4(:,4),30.0,prof_temp_final4(:,4),'fill')
    h=colorbar
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    caxis([-160 0])
    title('Primavera')
    C = contour(SAL4,THETA4,DENS4,[20:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    %rectangle('Position',[34.2 34.4  7 13])
    h.Title.String = "[m]";
%     rectangle('Position',[34.2 10 0.2 3])
%     plot(essw_s, essw_t ,'--ok',...
%             'LineWidth',2,...
%             'MarkerEdgeColor','k',...
%             'MarkerFaceColor','r',...
%             'MarkerSize',10)     
        

  %% Graficos de los perfiles verticales
  
 %Calculo de la temperatura conservativa
 %Calculo de la salinidad absoluta 
 
% figure()
% gsw_SA_CT_plot(prom_sal_final1(:,3),prom_temp_final1(:,3),0,(20:0.1:25.2));hold on
% for i=1:length(prom_temp_final1)
%     scatter(prom_sal_final1(i,3),prom_temp_final1(i,3),13,prof_sal1_final(i,3),'filled')
%     caxis([-100 0])
%     colorbar
% end
%  
 
%Perfiles Verticales Estacion 1
    
xmin1 =min(prom_sal_final1(:,1)) ; xmax1 = max(prom_sal_final1(:,1)); 
ymin1 = min(prom_temp_final1(:,1)); ymax1 = max(prom_temp_final1(:,1));  
[SAL1, THETA1] = meshgrid(xmin1:0.01:xmax1,ymin1:0.1:ymax1);
DENS1= sw_dens(SAL1,THETA1,0) - 1000;

xmin2 =min(prom_sal_final1(:,2)) ; xmax2 = max(prom_sal_final1(:,2)); 
ymin2 = min(prom_temp_final1(:,2)); ymax2 = max(prom_temp_final1(:,2));  
[SAL2, THETA2] = meshgrid(xmin2:0.001:xmax2,ymin2:0.01:ymax2);
DENS2= sw_dens(SAL2,THETA2,0) - 1000;
              
xmin3 =min(prom_sal_final1(:,3)) ; xmax3 = max(prom_sal_final1(:,3)); 
ymin3 = min(prom_temp_final1(:,3)); ymax3 = max(prom_temp_final1(:,3));  
[SAL3, THETA3] = meshgrid(xmin3:0.001:xmax3,ymin3:0.001:ymax3);
DENS3 = sw_dens(SAL3,THETA3,0) - 1000;


xmin4 =min(prom_sal_final1(:,4)) ; xmax4 = max(prom_sal_final1(:,4)); 
ymin4 = min(prom_temp_final1(:,4)); ymax4 = max(prom_temp_final1(:,4));  
[SAL4, THETA4] = meshgrid(xmin4:0.001:xmax4,ymin4:0.01:ymax4);
DENS4= sw_dens(SAL4,THETA4,0) - 1000;


ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]'; 


%Rectangulo de la masa de agua AESS
%temperatura varía entre 7ºc y 13ºc
%salinidad entre 34.4o/oo y 34.8o/oo. 
%oxígeno disuelto es entre 0.10 ml/L y 2 ml/L.

essw_t = 11; essw_s = 34.4;   


hh=1;
    figure ()
    set(gcf,'position',[10,10,1500,800])
    subplot(141)
    scatter(prom_sal_final1(:,1),prom_temp_final1(:,1),30.0,prof_sal1_final(:,1),'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin1 xmax1 ymin1 ymax1])
    caxis([-100 0])
    title('Verano')
    hold on
    C = contour(SAL1,THETA1,DENS1,[25:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    yticks([10:0.5:12])
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10)
   
    
    subplot(142)
    scatter(prom_sal_final1(:,2),prom_temp_final1(:,2),30.0,prof_sal1_final(:,2),'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin2 xmax2 ymin2 ymax2])
    caxis([-100 0])
    title('Otoño')
    hold on
    C = contour(SAL2,THETA2,DENS2,[20:0.2:29],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
    

    subplot(143)
    scatter(prom_sal_final1(:,3),prom_temp_final1(:,3),30.0,prof_sal1_final(:,3),'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin3 xmax3 ymin3 ymax3])
    caxis([-100 0])
    hold on
    title('Invierno')
    C = contour(SAL3,THETA3,DENS3,[25:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    yticks([10:0.02:11])
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    

    subplot(144)
    scatter(prom_sal_final1(:,4),prom_temp_final1(:,4),30.0,prof_sal1_final(:,4),'fill')
    h=colorbar
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin4 xmax4 ymin4 ymax4])
    caxis([-100 0])
    title('Primavera')
    hold on
    C = contour(SAL4,THETA4,DENS4,[20:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 34.4  7 13])
    h.Title.String = "[m]";
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    saveas(gcf,sprintf('/home/valentina/Escritorio/Tesis1/graficos/ts_estacion_%0.0f',hh),'png')
    
   
    %Digrama t-s-o
    
    figure ()
    set(gcf,'position',[10,10,1500,800])
    subplot(141)
    scatter(prom_sal_final1(:,1),prom_temp_final1(:,1),30.0,prom_oxy_final1(:,1)/44.661,'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin1 xmax1 ymin1 ymax1])
    caxis([2 6])
    title('Verano')
    hold on
    C = contour(SAL1,THETA1,DENS1,[25:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10)
    %yticks([10:0.5:12])
    
    
    subplot(142)
    scatter(prom_sal_final1(:,2),prom_temp_final1(:,2),30.0,prom_oxy_final1(:,1)/44.661,'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin2 xmax2 ymin2 ymax2])
    caxis([2 6])
    hold on
    title('Otoño')
    C = contour(SAL2,THETA2,DENS2,[20:0.2:29],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
     plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10)
    

    subplot(143)
    scatter(prom_sal_final1(:,3),prom_temp_final1(:,3),30.0,prom_oxy_final1(:,3)/44.661,'fill')
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin3 xmax3 ymin3 ymax3])
    caxis([2 6])
    hold on
    title('Invierno')
    C = contour(SAL3,THETA3,DENS3,[25:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    
    

    subplot(144)
    scatter(prom_sal_final1(:,4),prom_temp_final1(:,4),30.0,prom_oxy_final1(:,4)/44.661,'fill')
    h=colorbar
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin4 xmax4 ymin4 ymax4])
    caxis([2 6])
    title('Primavera')
    hold on
    C = contour(SAL4,THETA4,DENS4,[20:0.2:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    h.Title.String = "[m]";
    saveas(gcf,sprintf('/home/valentina/Escritorio/Tesis1/graficos/tso_estacion_%0.0f',hh),'png')
    
    
    
%% Estacion 2 Diagramas T-S-O y T-S-P

clear all
close all
clc


        
ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]';  

for k=1:4
    
xmin =min(prom_sal_final2(:,k)) ; xmax = max(prom_sal_final2(:,k)); 
ymin = min(prom_temp_final2(:,k)); ymax = max(prom_temp_final2(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final2(:,k),prom_temp_final2(:,k),30.0,prof_sal_final2(:,k),'fill')
    h=colorbar
    h.Title.String = "[m]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([-100 0])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
     rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   

for k=1:4
    
xmin =min(prom_sal_final2(:,k)) ; xmax = max(prom_sal_final2(:,k)); 
ymin = min(prom_temp_final2(:,k)); ymax = max(prom_temp_final2(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final2(:,k),prom_temp_final2(:,k),30.0,prom_oxy_final2(:,k)/44.661,'fill')
    h=colorbar
    h.Title.String = "[ml/L]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([2 6])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   

%% Estacion 3
clear all
close all
clc


ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]';  

for k=1:4
    
xmin =min(prom_sal_final3(:,k)) ; xmax = max(prom_sal_final3(:,k)); 
ymin = min(prom_temp_final3(:,k)); ymax = max(prom_temp_final3(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final3(:,k),prom_temp_final3(:,k),30.0,prof_sal_final3(:,k),'fill')
    h=colorbar
    h.Title.String = "[m]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([-100 0])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
     rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end  


for k=1:4
    
xmin =min(prom_sal_final3(:,k)) ; xmax = max(prom_sal_final3(:,k)); 
ymin = min(prom_temp_final3(:,k)); ymax = max(prom_temp_final3(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final3(:,k),prom_temp_final3(:,k),30.0,prom_oxy_final3(:,k)/44.661,'fill')
    h=colorbar
    h.Title.String = "[ml/L]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([2 6])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   

%% Estacion 4
clear all
close all
clc


[prof_temp_final4,prom_temp_final4,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.6000,-72, -43.6121,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[prof_sal_final4,prom_sal_final4,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.6000,-72,-43.6121,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final4,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.6000,-72,-43.6121,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');

   
ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]';  

for k=1:4
    
xmin =min(prom_sal_final4(:,k)) ; xmax = max(prom_sal_final4(:,k)); 
ymin = min(prom_temp_final4(:,k)); ymax = max(prom_temp_final4(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final4(:,k),prom_temp_final4(:,k),30.0,prof_sal_final4(:,k),'fill')
    h=colorbar
    h.Title.String = "[m]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([-100 0])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
     rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end  

for k=1:4
    
xmin =min(prom_sal_final4(:,k)) ; xmax = max(prom_sal_final4(:,k)); 
ymin = min(prom_temp_final4(:,k)); ymax = max(prom_temp_final4(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final4(:,k),prom_temp_final4(:,k),30.0,prom_oxy_final4(:,k)/44.661,'fill')
    h=colorbar
    h.Title.String = "[ml/L]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([2 6])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end  

%% Estacion 5
clear all
close all
clc


[prof_temp_final5,prom_temp_final5,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.2500,-72, -43.6302,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[prof_sal_final5,prom_sal_final5,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.2500,-72,-43.6302,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final5,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.2500,-72,-43.6302,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');

  essw_t = 11; essw_s = 34.4;   
  
   
ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]';  

for k=1:4
    
xmin =min(prom_sal_final5(:,k)) ; xmax = max(prom_sal_final5(:,k)); 
ymin = min(prom_temp_final5(:,k)); ymax = max(prom_temp_final5(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final5(:,k),prom_temp_final5(:,k),30.0,prof_sal_final5(:,k),'fill')
    h=colorbar
    h.Title.String = "[m]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([-100 0])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
     rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   
  

for k=1:4
    
xmin =min(prom_sal_final5(:,k)) ; xmax = max(prom_sal_final5(:,k)); 
ymin = min(prom_temp_final5(:,k)); ymax = max(prom_temp_final5(:,k));  

[SAL, THETA] = meshgrid(xmin:0.01:xmax,ymin:0.1:ymax);
DENS = sw_dens(SAL,THETA,0) - 1000;

    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final5(:,k),prom_temp_final5(:,k),30.0,prom_oxy_final5(:,k)/44.661,'fill')
    h=colorbar
    h.Title.String = "[ml/L]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([3 7])
    hold on
    C = contour(SAL,THETA,DENS,[25:0.1:28],'--k');
    clabel(C,'FontSize',10,'FontWeight','bold')
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end    
  

%% Estacion 6
clear all
close all
clc


[prof_temp_final6,prom_temp_final6,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.2750,-72, -43.3036,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[prof_sal_final6,prom_sal_final6,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.2750,-72,-43.3036,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final6,lon_cercana1,lon_cercana2,lat_cercana] =ts(-73.2750,-72,-43.3036,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');

  essw_t = 11; essw_s = 34.4;   
  
   
ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]';


for k=1:4
    
xmin =min(prom_sal_final6(:,k)) ; xmax = max(prom_sal_final6(:,k)); 
ymin = min(prom_temp_final6(:,k)); ymax = max(prom_temp_final6(:,k));  


    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final6(:,k),prom_temp_final6(:,k),30.0,prof_sal_final6(:,k),'fill')
    h=colorbar
    h.Title.String = "[m]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([-160 0])
    hold on
    set(gca,'Fontsize',18)
     rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   
  


for k=1:4
    
xmin =min(prom_sal_final6(:,k)) ; xmax = max(prom_sal_final6(:,k)); 
ymin = min(prom_temp_final6(:,k)); ymax = max(prom_temp_final6(:,k));  



    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final6(:,k),prom_temp_final6(:,k),30.0,prom_oxy_final6(:,k)/44.661,'fill')
    h=colorbar
    h.Title.String = "[ml/L]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([3 7])
    hold on
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   

%% Estacion 7
clear all
close all
clc


[prof_temp_final7,prom_temp_final7,lon_cercana1,lon_cercana2,lat_cercana] =ts( -73.4500,-72, -43.8469,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[prof_sal_final7,prom_sal_final7,lon_cercana1,lon_cercana2,lat_cercana] =ts( -73.4500,-72,-43.8469,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,prom_oxy_final7,lon_cercana1,lon_cercana2,lat_cercana] =ts( -73.4500,-72,-43.8469,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');

  essw_t = 11; essw_s = 34.4;   
  
   
ylabel_1 = 'Temperatura [°C]';               
xlabel_1 = 'Salinidad [PSU]';



for k=1:4
    
xmin =min(prom_sal_final7(:,k)) ; xmax = max(prom_sal_final7(:,k)); 
ymin = min(prom_temp_final7(:,k)); ymax = max(prom_temp_final7(:,k));  


    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final7(:,k),prom_temp_final7(:,k),30.0,prof_sal_final7(:,k),'fill')
    h=colorbar
    h.Title.String = "[m]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([-160 0])
    hold on
    set(gca,'Fontsize',18)
     rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   
  


for k=1:4
    
xmin =min(prom_sal_final7(:,k)) ; xmax = max(prom_sal_final7(:,k)); 
ymin = min(prom_temp_final7(:,k)); ymax = max(prom_temp_final7(:,k));  



    figure (k)
    set(gcf,'position',[10,10,500,900])
    scatter(prom_sal_final7(:,k),prom_temp_final7(:,k),30.0,prom_oxy_final7(:,k)/44.661,'fill')
    h=colorbar
    h.Title.String = "[ml/L]";
    xlabel(xlabel_1,'Fontsize',18,'FontName','Helvetica')
    ylabel(ylabel_1,'Fontsize',18,'FontName','Helvetica')
    axis([xmin xmax ymin ymax])
    caxis([3 7])
    hold on
    set(gca,'Fontsize',18)
    rectangle('Position',[34.2 10 0.2 3])
    plot(essw_s, essw_t ,'--ok',...
            'LineWidth',2,...
            'MarkerEdgeColor','k',...
            'MarkerFaceColor','r',...
            'MarkerSize',10) 
    
     
end   


