%Calculo de U y transporte de mosa 2.7 simulacion sin mareas

clear all
close all
clc
start
load('z.mat')
load('lat.mat')
nc=netcdf('u_M3_HSM_guafo.nc','r');
h=ncread('mosa_BGQ_h_guafo.nc','h');

s_rho=nc{'s_rho'}(:);
uvel=nc{'u'}(:,:,:,:);

uuvel=nanmean(uvel,1);
uuvel=squeeze(uuvel(1,:,:));
idx=find(uuvel==0);
uuvel(idx)=NaN;

%Figura preliminar

figure(1)
pcolor(lat,z,uuvel)
colorbar
title('Componente de la Velocidad U')


%Figura de la seccion de la Boca del Guafo utilizando una simualcion sin
%mareas

cmap = colormap_cpt('Balance.cpt');

figure()
hold on
pcolor(lat(:,7:30),z(:,7:30),uuvel(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),uuvel(:,7:30),[-100 0 100],...
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
set(gca,'Xdir','reverse')
ylim([-210 0])
xlim([-43.8 -43.4])

%u_sm_gua=uuvel;
%save('u_sm_gua.mat','u_sm_gua'); %promedio del mes de marzo de la simualcion sin mareas en la seccion de la boca del guafo

%% Calculo del Transporte en la Seccion

%Calculo del transporte de la seccion en la Boca del Guafo

dx=abs(lat(1,1)-lat(1,2)); %Diferencia entre latitudes
dx=dx*111.1*1000; %Transformar de grados a metros

dy=s_rho*h'; %Largo de cada celda

A=abs(dy*dx); %Area de la celda

T=A.*uuvel; 

TN = nansum(nansum(T));

%% Tabla de transporte

TN_mosa = nansum(nansum(T))  %transporte neto
idx_pos=find(T>0)
idx_neg=find(T<0)
TN_pos_mosa=nansum(nansum(T(idx_pos))) %Transporte neto entrando por la Boca del Guafo
TN_neg_mosa=nansum(nansum(T(idx_neg))) %Transporte neto saliendo por la Boca del Guafo

TTTT = table(TN_mosa,TN_pos_mosa,TN_neg_mosa)
writetable(T_sin_mareas,'T_sin_mareas.txt')

