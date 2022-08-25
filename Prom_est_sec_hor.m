clear all
close all 
clc

%Seccion Horizontal boca del guafo norte
%Lon:[-73.0406 -74.5614]
%Lat:-43.5056
%Seccion 1 lon[] lat:-435056

%Temepratura, Salinidad, Oxígeno y Velocidad V

[x1,y1,prom_est_sec_hor_temp,lon1,lon2,lat] =secp(-73.0406,-74.5778,-43.5056,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,~,prom_est_sec_hor_sal,~,~,~] =secp(-73.0406,-74.5778,-43.5056,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,~,prom_est_sec_hor_oxy,~,~,~] =secp(-73.0406,-74.5778,-43.5056,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');
[~,~,prom_est_sec_hor_v,~,~,~] =secp(-73.0406,-74.5778,-43.5056,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v');
[~,~,prom_est_sec_hor_no3,~,~,~] =secp(-73.0406,-74.5778,-43.5056,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','NO3');


%Grafico 

y1=-1*y1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Temperatura

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,1))
colormap(jet)
shading interp
C = contour(x1(15:end,:),y1(15:end,:),prom_est_sec_hor_temp(15:end,:,1),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')  
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')      
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,2))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_temp(:,:,2),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,3))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_temp(:,:,3),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on
set(gca,'XDir','reverse')

subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,4))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_temp(:,:,4),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
caxis([6 14])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on 
set(gca,'XDir','reverse')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Salinidad

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,1))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,1),[33.2:0.2:34,4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')  
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')     
axis tight
set(gca,'Fontsize',13)
caxis([33.2 34.4])
box on
set(gca,'XDir','reverse')


subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,2))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,2),[33.2:0.2:34.4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',13)
caxis([33.2 34.4])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,3))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,3),[33.2:0.2:33.4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
axis tight
set(gca,'Fontsize',13)
xlabel('Distancia [km]')
caxis([33.2 34.4])
box on
set(gca,'XDir','reverse')


subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,4))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,4),[33.2:0.2:33.4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([33.2 34.4])
xlabel('Distancia [km]')
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca,'XDir','reverse')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Oxígeno

cmap = colormap_cpt('OXY.cpt');

prom_est_sec_hor_oxy(:,:,1)=prom_est_sec_hor_oxy(:,:,1)/44.661;
prom_est_sec_hor_oxy(:,:,2)=prom_est_sec_hor_oxy(:,:,2)/44.661;
prom_est_sec_hor_oxy(:,:,3)=prom_est_sec_hor_oxy(:,:,3)/44.661;
prom_est_sec_hor_oxy(:,:,4)=prom_est_sec_hor_oxy(:,:,4)/44.661;

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,1))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,1),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')     
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,2))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,2),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,3))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,3),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on 
set(gca,'XDir','reverse')

subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,4))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,4),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[ml/L]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Oxígeno','fontsize',16)    
axis tight
caxis([2 6])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca,'XDir','reverse')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad v

vel = colormap_cpt('Velocidad.cpt');


figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,1))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,1),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano') 
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')      
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,2))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,2),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(gca,'XDir','reverse')
box on


subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,3))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,3),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on 
set(gca,'XDir','reverse')


subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,4))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,4),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[m/s]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Velocidad','fontsize',16)    
axis tight
caxis([-0.2 0.2])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca,'XDir','reverse')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NO3

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,1))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,1),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano') 
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')    
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,2))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,2),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,3))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,3),[6:3:20],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca,'XDir','reverse')

subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,4))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,4),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
caxis([6 33])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca,'XDir','reverse')

%% Seccion horizontal Boca del guafo Sur

clear all
close all
clc


[x1,y1,prom_est_sec_hor_temp,lon1,lon2,lat] =secp(-72.950,-74.5778,-43.7397,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,~,prom_est_sec_hor_sal,~,~,~] =secp(-72.950,-74.5778,-43.7397,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,~,prom_est_sec_hor_oxy,~,~,~] =secp(-72.950,-74.5778,-43.7397,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');
[~,~,prom_est_sec_hor_v,~,~,~] =secp(-72.950,-74.5778,-43.7397,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v');
[~,~,prom_est_sec_hor_no3,~,~,~] =secp(-72.950,-74.5778,-43.7397,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','NO3');



%Grafico 

y1=-1*y1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Temperatura

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,1))
colormap(jet)
shading interp
C = contour(x1(15:end,:),y1(15:end,:),prom_est_sec_hor_temp(15:end,:,1),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')  
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')      
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,2))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_temp(:,:,2),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,3))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_temp(:,:,3),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on
set(gca,'XDir','reverse')

subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_temp(:,:,4))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_temp(:,:,4),[6:1:14],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
caxis([6 14])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on 
set(gca,'XDir','reverse')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Salinidad

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,1))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,1),[33.2:0.2:34,4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')  
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')     
axis tight
set(gca,'Fontsize',13)
caxis([33.2 34.4])
box on
set(gca,'XDir','reverse')


subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,2))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,2),[33.2:0.2:34.4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',13)
caxis([33.2 34.4])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,3))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,3),[33.2:0.2:33.4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
axis tight
set(gca,'Fontsize',13)
xlabel('Distancia [km]')
caxis([33.2 34.4])
box on
set(gca,'XDir','reverse')


subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_sal(:,:,4))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_sal(:,:,4),[33.2:0.2:33.4],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([33.2 34.4])
xlabel('Distancia [km]')
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca,'XDir','reverse')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Oxígeno

cmap = colormap_cpt('OXY.cpt');

prom_est_sec_hor_oxy(:,:,1)=prom_est_sec_hor_oxy(:,:,1)/44.661;
prom_est_sec_hor_oxy(:,:,2)=prom_est_sec_hor_oxy(:,:,2)/44.661;
prom_est_sec_hor_oxy(:,:,3)=prom_est_sec_hor_oxy(:,:,3)/44.661;
prom_est_sec_hor_oxy(:,:,4)=prom_est_sec_hor_oxy(:,:,4)/44.661;

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,1))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,1),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')     
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,2))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,2),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,3))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,3),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on 
set(gca,'XDir','reverse')

subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_oxy(:,:,4))
colormap(cmap)
shading interp
C = contour(x1,y1,prom_est_sec_hor_oxy(:,:,4),[2:0.5:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[ml/L]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Oxígeno','fontsize',16)    
axis tight
caxis([2 6])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca,'XDir','reverse')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad v

vel = colormap_cpt('Velocidad.cpt');


figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,1))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,1),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano') 
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')      
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,2))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,2),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(gca,'XDir','reverse')
box on


subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,3))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,3),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on 
set(gca,'XDir','reverse')


subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_v(:,:,4))
colormap(vel)
shading interp
C = contour(x1,y1,prom_est_sec_hor_v(:,:,4),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[m/s]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Velocidad','fontsize',16)    
axis tight
caxis([-0.2 0.2])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca,'XDir','reverse')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NO3

figure()
subplot(141)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,1))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,1),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano') 
text(-11.92,198.017,'Costa','Fontsize',15,...
        'FontName','Arial','Color','k')    
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca,'XDir','reverse')

subplot(142)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,2))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,2),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca,'XDir','reverse')

subplot(143)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,3))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,3),[6:3:20],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca,'XDir','reverse')

subplot(144)
hold on
pcolor(x1,y1,prom_est_sec_hor_no3(:,:,4))
colormap(jet)
shading interp
C = contour(x1,y1,prom_est_sec_hor_no3(:,:,4),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
caxis([6 33])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca,'XDir','reverse')


 %% Seccion 1 horizontal PCU (40°S)
 
 clear all
 close all
 clc

 
[x1,y1,prom_pcu1_temp,lon1,lon2,lat] =secp(-73.6000,-76.5000 ,-40.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,~,prom_pcu1_sal,~,~,~] =secp(-73.6000,-76.5000,-40.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,~,prom_pcu1_oxy,~,~,~] =secp(-73.6000,-76.5000,-40.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');
[~,~,prom_pcu1_v,~,~,~] =secp(-73.6000,-76.5000,-40.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v');
[~,~,prom_pcu1_no3,~,~,~] =secp(-73.6000,-76.5000,-40.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','NO3');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grafico

y1=-1*y1;

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,1),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(27.982,617.804,'Costa','Fontsize',14,...
         'FontName','Arial','Color','k')     
caxis([6 14])
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
axis tight
box on

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,2),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
%set(gca,'yticklabel',[])
caxis([6 14])
box on

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,3),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
caxis([6 14])
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_temp(18:end,:,4),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
caxis([6 14])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Salinidad

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,1),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-19.924,613.518,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')   
caxis([33.2 34.4])
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
axis tight
box on

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,2),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
caxis([33.2 34.4])
box on

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,3),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
caxis([33.2 34.4])
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_sal(18:end,:,4),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
caxis([33.2 34.4])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Oxígeno

cmap = colormap_cpt('OXY.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,1)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,1)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-19.924,613.518,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
caxis([2 6])
set(gca,'Fontsize',14)
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,2)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,2)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(gca, 'XDir', 'reverse');
box on

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,3)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,3)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,4)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_oxy(18:end,:,4)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[ml/L]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Oxígeno','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca, 'XDir', 'reverse');
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad V
 
vel = colormap_cpt('Velocidad.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,1))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,1),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-19.924,613.518,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')   
set(gca,'Fontsize',13)
caxis([-0.2 0.2])
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,2))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,2),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',13)
caxis([-0.2 0.2])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,3))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,3),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',13)
caxis([-0.2 0.2])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,4))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_v(18:end,:,4),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[m/s]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Velocidad','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([-0.2 0.2])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NO3

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,1),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-19.924,613.518,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')
set(gca,'Fontsize',13)
caxis([6 33])
axis tight
box on
set(gca, 'XDir', 'reverse');
box on


subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,2),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',13)
caxis([6 33])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,3),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',13)
caxis([6 33])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu1_no3(18:end,:,4),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
set(gca,'Fontsize',13)
caxis([6 33])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');
set(h,'XTick',[6:3:33])

%% Seccion 2 (41°S)

clear all
close all
clc


[x1,y1,prom_pcu2_temp,lon1,lon2,lat] =secp(-73.8087,-76.5000 ,-41.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,~,prom_pcu2_sal,~,~,~] =secp(-73.8087,-76.5000 ,-41.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,~,prom_pcu2_oxy,~,~,~] =secp(-73.8087,-76.5000 ,-41.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');
[~,~,prom_pcu2_v,~,~,~] =secp(-73.8087,-76.5000 ,-41.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v');
[~,~,prom_pcu2_no3,~,~,~] =secp(-73.8087,-76.5000 ,-41.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','NO3');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Graficos


y1=-1*y1;

%Temperatura

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,1),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')     
caxis([6 14])
set(gca,'Fontsize',14)
axis tight
box on 
set(gca, 'XDir', 'reverse');


subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,2),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
box on
caxis([6 14])
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,3),[6:2:16],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_temp(18:end,:,4),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca, 'XDir', 'reverse');
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Salinidad

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,1),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
caxis([33.2 34.4])
set(gca,'Fontsize',14)
axis tight
set(gca, 'XDir', 'reverse');
box on

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,2),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
set(gca, 'XDir', 'reverse');
box on


subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,3),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_sal(18:end,:,4),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
caxis([33.2 34.4])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Oxígeno

cmap = colormap_cpt('OXY.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,1)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,1)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
caxis([2 6])
set(gca,'Fontsize',14)
axis tight
set(gca, 'XDir', 'reverse');
box on

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,2)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,2)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(gca, 'XDir', 'reverse');
box on

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,3)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,3)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,4)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_oxy(18:end,:,4)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[ml/L]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Oxígeno','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca, 'XDir', 'reverse');
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad V
 
vel = colormap_cpt('Velocidad.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,1))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,1),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
axis tight
set(gca, 'XDir', 'reverse');
box on

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,2))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,2),[-0,4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(gca, 'XDir', 'reverse');
box on


subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,3))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,3),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(gca, 'XDir', 'reverse');
box on


subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,4))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_v(18:end,:,4),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[m/s]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Velocidad','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on 
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NO3

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,1),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')
set(gca,'Fontsize',14)
caxis([6 33])
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,2),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca, 'XDir', 'reverse');



subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,3),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu2_no3(18:end,:,4),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca, 'XDir', 'reverse');
box on

%% Seccion 3 (42°S)

clear all
close all
clc

[x1,y1,prom_pcu3_temp,lon1,lon2,lat] =secp(-74.0,-76.5000 ,-42.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,~,prom_pcu3_sal,~,~,~] =secp(-74.0,-76.5000 ,-42.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,~,prom_pcu3_oxy,~,~,~] =secp(-74.0,-76.5000 ,-42.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');
[~,~,prom_pcu3_v,~,~,~] =secp(-74.0,-76.5000 ,-42.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v');
[~,~,prom_pcu3_no3,~,~,~] =secp(-74.0,-76.5000 ,-42.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','NO3');

%Grafico

y1=-1*y1;

%Temperatura

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,1),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')     
caxis([6 14])
set(gca,'Fontsize',14)
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,2),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
set(gca, 'XDir', 'reverse');
box on

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,3),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_temp(18:end,:,4),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Salinidad

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,1),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
caxis([33.2 34.4])
set(gca,'Fontsize',14)
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,2),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
box on 
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,3),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_sal(18:end,:,4),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
caxis([33.2 34.4])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
set(gca, 'XDir', 'reverse');
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Oxígeno

cmap = colormap_cpt('OXY.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,1)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,1)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
caxis([2 6])
set(gca,'Fontsize',14)
axis tight
box on
set(gca, 'XDir', 'reverse');


subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,2)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,2)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca, 'XDir', 'reverse');


subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,3)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,3)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,4)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_oxy(18:end,:,4)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[ml/L]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Oxígeno','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad V
 
vel = colormap_cpt('Velocidad.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,1))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,1),[-0.6,0,0.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,2))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,2),[-0.6,0,0.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,3))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,3),[-0.6,0,0.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,4))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_v(18:end,:,4),[-0.6,0,0.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[m/s]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Velocidad','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NO3

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,1),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-21.051,562.546,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')
set(gca,'Fontsize',14)
caxis([6 33])
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,2),[6:4:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,3),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu3_no3(18:end,:,4),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');


%% Seccion 4 (43°S)

clear all
close all
clc

[x1,y1,prom_pcu4_temp,lon1,lon2,lat] =secp(-74.200,-76.5000 ,-43.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','temp');
[~,~,prom_pcu4_sal,~,~,~] =secp(-74.200,-76.5000 ,-43.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','salt');
[~,~,prom_pcu4_oxy,~,~,~] =secp(-74.200,-76.5000 ,-43.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','O2');
[~,~,prom_pcu4_v,~,~,~] =secp(-74.200,-76.5000 ,-43.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','v');
[~,~,prom_pcu4_no3,~,~,~] =secp(-74.200,-76.5000 ,-43.0,'mosa_RIO_avg_Y8S1.nc','mosa_RIO_avg_Y8S2.nc','mosa_BGQ_grd.nc','NO3');

%Graficos

y1=-1*y1;

%Temperatura

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,1),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-16.538,548.497,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')     
caxis([6 14])
set(gca,'Fontsize',14)
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,2),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on 
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,3),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_temp(18:end,:,4),[6:2:14],...
             '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[°C]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Temperatura','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([6 14])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Salinidad

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,1),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-16.538,548.497,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k') 
caxis([33.2 34.4])
set(gca,'Fontsize',14)
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,2),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,3),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')  
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([33.2 34.4])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_sal(18:end,:,4),[33.2:0.2:34.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[PSU]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Salinidad','fontsize',16)    
axis tight
caxis([33.2 34.4])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca,'Fontsize',14)
box on
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Oxigeno

cmap = colormap_cpt('OXY.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,1)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,1)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-16.538,548.497,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')   
caxis([2 6])
set(gca,'Fontsize',14)
axis tight
box on
set(gca, 'XDir', 'reverse');


subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,2)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,2)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño') 
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,3)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,3)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,4)/44.661)
colormap(cmap)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_oxy(18:end,:,4)/44.661,[2:1:6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
h = colorbar;
set(gca,'ydir','reverse')
set(get(h,'title'),'string',{'[ml/L]'},'FontName','Helvetica',...
        'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Oxígeno','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([2 6])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad V
 
vel = colormap_cpt('Velocidad.cpt');

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,1))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,1),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-16.538,548.497,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k')  
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
axis tight
box on
set(gca, 'XDir', 'reverse');

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,2))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,2),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,3))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,3),[-0.4,0,0,4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
box on
set(gca, 'XDir', 'reverse');

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,4))
colormap(vel)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_v(18:end,:,4),[-0.4,0,0.4],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[m/s]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, 'Velocidad','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([-0.2 0.2])
set(h,'Position', [0.920  0.104  0.016  0.812]);
set(gca, 'XDir', 'reverse');
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NO3

figure()
subplot(141)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,1))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,1),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
title('Verano')
text(-16.538,548.497,'Costa','Fontsize',15,...
         'FontName','Arial','Color','k') 
set(gca,'Fontsize',14)
caxis([6 33])
axis tight
set(gca, 'XDir', 'reverse');
box on

subplot(142)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,2))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,2),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse') 
title('Otoño')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
box on
set(gca, 'XDir', 'reverse');

subplot(143)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,3))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,3),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
set(gca,'ydir','reverse')  
title('Invierno')
xlabel('Distancia [km]')
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
set(gca, 'XDir', 'reverse');
box on

subplot(144)
hold on
pcolor(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,4))
colormap(jet)
shading interp
C = contour(x1(18:end,:),y1(18:end,:),prom_pcu4_no3(18:end,:,4),[6:3:33],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)
 h = colorbar;
set(gca,'ydir','reverse')
 set(get(h,'title'),'string',{'[NO3]'},'FontName','Helvetica',...
       'FontSize',14,'FontWeight','bold');   
title('Primavera')
xlabel('Distancia [km]')
ylabel(h, '[\mumol/L]','fontsize',16)    
axis tight
set(gca,'Fontsize',14)
caxis([6 33])
set(h,'Position', [0.920  0.104  0.016  0.812]);
box on
set(gca, 'XDir', 'reverse');
 