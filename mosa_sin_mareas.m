%Calculo de u y transporte de mosa 2.7 simulacion sin mareas

clear all
close all
clc
start
load('z.mat')
load('lat.mat')
nc=netcdf('u_Y1_M2_HSM_guafo.nc','r');
h=ncread('mosa_BGQ_h_guafo.nc','h');

s_rho=nc{'s_rho'}(:);
uvel=nc{'u'}(:,:,:,:);
uvel=squeeze(uvel(1,:,:));
idx=find(uvel==0);
uvel(idx)=NaN;

figure(1)
pcolor(uvel)
colorbar
title('Componente de la Velocidad U')

dx=abs(lat(1,1)-lat(1,2)); %Diferencia entre latitudes
dx=dx*111.1*1000; %Transformar de grados a metros

dy=s_rho*h'; %Largo de cada celda

A=abs(dy*dx); %Area de la celda

T=A.*uvel; 

TN = nansum(nansum(T));

cmap = colormap_cpt('Balance.cpt');


figure()
subplot(121)
hold on
pcolor(lat(:,7:30),z(:,7:30),T(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),T(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',2);
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Transporte')
colormap(cmap)
shading interp
a=colorbar;
ylabel(a,'[m^3/s]','FontSize',17);
caxis([-5.6e+04 5.6e+04])
set(gca,'Fontsize',17)
box on
ylim([-210 0])
xlim([-43.8 -43.4])
subplot(122)
hold on
pcolor(lat(:,7:30),z(:,7:30),uvel(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),uvel(:,7:30),[-100 0 100],...
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

%% 

TN_mosa = nansum(nansum(T))  %transporte neto
idx_pos=find(T>0)
idx_neg=find(T<0)
TN_pos_mosa=nansum(nansum(T(idx_pos))) %Transporte neto entrando por la Boca del Guafo
TN_neg_mosa=nansum(nansum(T(idx_neg))) %Transporte neto saliendo por la Boca del Guafo

T_sin_mareas = table(TN_mosa,TN_pos_mosa,TN_neg_mosa)
writetable(T_sin_mareas,'T_sin_mareas.txt')
