%Comparacion ADCP y Modelo MOSA

% Obetener del MODELO MOSA 15 dias del mes de marzo (360 horas)
clear all
close all
start
addpath('/media/valentina/TOSHIBA EXT/Simulaciones_MOSA/Mareas/AÑO11_MOSA_Final/') 
ncdisp('u_15_mar.nc')

%Velocidad u y v a 22 metros de profundidad

u_15_mosa_mar=[];
v_15_mosa_mar=[];

for i=1:360
u_15_mosa_mar(:,:,i)=get_hslice('u_15_mar.nc','mosa_BGQ_grd.nc','u',i,-22,'u');
v_15_mosa_mar(:,:,i)=get_hslice('v_15_mar.nc','mosa_BGQ_grd.nc','v',i,-22,'v');
end

%Transferir el campo de velocidad del los puntos u y v al los puntos rho

for j=1:360
idx_u(:,:,j)=squeeze(u_15_mosa_mar(:,:,j));
u_15_mosa_mar_2(:,:,j)=u2rho_2d(idx_u(:,:,j));
end

for j=1:360
idx_v(:,:,j)=squeeze(v_15_mosa_mar(:,:,j));
v_15_mosa_mar_2(:,:,j)=v2rho_2d(idx_v(:,:,j));
end

 %save('u_15_mosa_mar_2.mat','u_15_mosa_mar_2');
 %save('v_15_mosa_mar_2.mat','v_15_mosa_mar_2');

%% Comparacion ADCP y Modelo MOSA
clear all
close all
addpath('/media/valentina/TOSHIBA/Simulaciones_MOSA/Mareas/AÑO11_MOSA_Final/') 
dir='/media/valentina/TOSHIBA/Simulaciones_MOSA/Mareas/AÑO11_MOSA_Final/';

% reading NCEP2 files
file1 = [dir 'mosa_BGQ_avg_VM_Y1_M3_HM.nc'];
ncdisp(file1);
load('u_15_mosa_mar_2.mat')
load('v_15_mosa_mar_2.mat')

%Cargar los datos de mosa año 11 mes de marzo

lon=ncread([file1],'lon_rho');
lat=ncread([file1],'lat_rho');
time_mosa=ncread([file1],'time');
lat=lat(1,:);
lon=lon(:,1);

%Posicion del ADCP en el MODELO %guafo lonG= -73.75881 latG= -43.58976
  
 A= repmat(lon,[1 length(-73.75881)]);
 [valor_min,idx_cercano1] =min(abs(A-(-73.75881)'));
 lon_cercana1= lon(idx_cercano1);

 B= repmat(lat,[1 length(-43.58976)]);
 [valor_min,idx_cercano2] = min(abs(B-(-43.58976)'));
 lat_cercana1 = lat(idx_cercano2);

%Obtener la misma posicion del anclaje y modelo
u_15_mosa_mar_2=squeeze(u_15_mosa_mar_2(idx_cercano2,idx_cercano1,:));
v_15_mosa_mar_2=squeeze(v_15_mosa_mar_2(idx_cercano2,idx_cercano1,:));

%Datos del ADCP 

load('Guafo1819_sinrotar_h_T_F.mat')

%Cargar la fecha de los datos
fecha=datevec(Fh);
ano=fecha(:,1);
mes=fecha(:,2);
dia=fecha(:,3);
hora=fecha(:,4);

%Extraer el mes de marzo
time_adcp=Fh(4638:5381);
u_mar_adcp=U(4638:5381,:);
v_mar_adcp=V(4638:5381,:);

%Extraer 15 dias del mes de marzo

indx=datevec(time_adcp);
time_15_mar=time_adcp(1:360);
u_15_mar=u_mar_adcp(1:360,:);
v_15_mar=v_mar_adcp(1:360,:);


%Grafico preliminar

figure()
subplot(211)
plot(time_15_mar,u_15_mar(:,12)*0.01,'LineWidth',2)
datetick('x','dd/mm/yy','keeplimits','keepticks')
set(gca,'fontsize',15)
hold on
plot(time_15_mar,u_15_mosa_mar_2,'r','LineWidth',2)
xlabel('Días')
ylabel('[m]')
legend('ADCP','MOSA')
title('Componente U a 22 metros de profundidad')

subplot(212)
plot(time_15_mar,v_15_mar(:,12)*0.01,'LineWidth',2)
datetick('x','dd/mm/yy','keeplimits','keepticks')
set(gca,'fontsize',15)
hold on
plot(time_15_mar,v_15_mosa_mar_2,'r','LineWidth',2)
xlabel('Días')
ylabel('[m]')
legend('ADCP','MOSA')
title('Componente V a 22 metros de profundidad')
