%Digrma de dispercion de mareas entre mosa y adcp
clear all
close all
addpath('/media/valentina/TOSHIBA/Simulaciones_MOSA/Mareas/AÑO11_MOSA_Final/') 
dir='/media/valentina/TOSHIBA/Simulaciones_MOSA/Mareas/AÑO11_MOSA_Final/';


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
hold on
scatter(u_15_mar(:,12)*0.01,v_15_mar(:,12)*0.01,'filled')
scatter(u_15_mosa_mar_2,v_15_mosa_mar_2,'filled')
xlabel('Componente Zonal [m/s]')
ylabel('Componente Meridional [m/s]')
legend('ADCP','MOSA')
set(gca,'fontsize',15)


