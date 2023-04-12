%Calculo de los componenetes mareales y la marea residuales
clear all
close all
start

nc=netcdf('Mer_U_V_M1_2022_guafo.nc','r');

depth=ncread('Mer_U_V_M1_2022_guafo.nc','depth');
lat=ncread('Mer_U_V_M1_2022_guafo.nc','latitude');

uvel=nc{'uo'}(:,:,:,:);
uvel=squeeze(uvel(1,:,:));
idx=find(uvel==9.969209968386869e+36);
uvel(idx)=NaN;


lat=lat(7:12);
depth=depth(1:27);
uvel=uvel(1:27,7:12);

figure(1)
pcolor(lat,depth,uvel)
colorbar
shading interp
set(gca,'Ydir','reverse')
title('Componente de la Velocidad U')

%% Calculo del Transporte 
pp=ones([27,6]); %Matriz de uno para crear las latitudes
xx=pp.*lat'; %Matriz de latitudes
lat=xx;

mm=ones([27,6]);
dy=mm.*depth*-1;
zz=mm.*depth*-1;

dx=abs(lat(1,1)-lat(1,2)); %Diferencia entre latitudes
dx=dx*111.1*1000; %Transformar de grados a metros

A=abs(dy*dx); %Area de la celda

T=A.*uvel; 

TN = nansum(nansum(T));

cmap = colormap_cpt('Balance.cpt');


figure()
subplot(121)
hold on
pcolor(lat,zz,T)
C = contour(lat,zz,T,[-1600000 0 160000],...
            '--w','LineWidth',2);
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Transporte')
colormap(cmap)
shading interp
a=colorbar;
ylabel(a,'[m^3/s]','FontSize',17);
caxis([-1.6e+05 1.6e+05])
set(gca,'Fontsize',17)
box on
ylim([-210 0])
xlim([-43.8 -43.4])

subplot(122)
hold on
pcolor(lat,zz,uvel)
C = contour(lat,zz,uvel,[-100 0 100],...
            '--w','LineWidth',2);
%clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
xlabel('Latitud')
title('Componente U de la Velocidad')
colormap(cmap)
shading interp
a=colorbar;
ylabel(a,'[m/s]','FontSize',17);
caxis([-0.4 0.4])
set(gca,'Fontsize',17)
box on
ylim([-210 0])
xlim([-43.8 -43.4])

%% Calculo 

TN = nansum(nansum(T))  %transporte neto
idx_pos=find(T>0)
idx_neg=find(T<0)
TN_pos=nansum(nansum(T(idx_pos))) %Transporte neto entrando por la Boca del Guafo
TN_neg=nansum(nansum(T(idx_neg))) %Transporte neto saliendo por la Boca del Guafo

T_mercator = table(TN,TN_pos,TN_neg)


writetable(T_mercator,'T_mercator.txt')





