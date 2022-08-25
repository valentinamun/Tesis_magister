function [x1,y1,prom_est_sec_hor,lon_cercana1,lon_cercana2,lat_cercana] =secp(lon1,lon2,lat1,filename1,filename2,grd,var)

%Secciones Horizontales

%INPUT
%lon1: longitud de la sección
%lat1: latitud 1 de la sección
%lat2: latitud 2 de la sección
%filename: nombre del archivo (string)
%grd: grilla del archivo  (string)
%var: variable a obtener (string)

%OUTPUT
%Distancia en kilometros 
%Profundidad

  mosa1=filename1;
  mosa2=filename2;
  grd=grd;
  var=var;
  lat=ncread(mosa1,'lat_rho');
  lat=lat(1,240:end);
  lon=ncread(mosa1,'lon_rho');
  lon=lon(161:end,1);
  
 %Encontrar las el punto mas cercano a las posiciones
 C= repmat(lon,[1 length(lon1)]);
 [valor_min,idx_cercano1] =min(abs(C-(lon1)'));
 lon_cercana1 = lon(idx_cercano1);

 C= repmat(lon,[1 length(lon2)]);
 [valor_min,idx_cercano2] =min(abs(C-(lon2)'));
 lon_cercana2 = lon(idx_cercano2);
% 
%    lon_cercana2=-76.5000; %valor fijo para todas las secciones

 C= repmat(lat,[1 length(lat1)]);
 [valor_min,idx_cercano3] = min(abs(C-(lat1)'));
 lat_cercana = lat(idx_cercano3);
 
 %Secciones Horizontales
 for i=1:6
 [x1,y1,sech1(:,:,i)]=get_section(mosa1,grd,[lon_cercana1 -76.700],[lat_cercana lat_cercana],var,i);
 [x1,y1,sech2(:,:,i)]=get_section(mosa2,grd,[lon_cercana1 -76.700],[lat_cercana lat_cercana],var,i);
 end 
 
 %Promedios Estacionales
 
 %Promedio Verano

for k=1:2
    ver(:,:,k)=sech1(:,:,k);
end
ver(:,:,3)=sech2(:,:,6);
prom_ver=nanmean(ver,3);

%Promedio Otoño

for k=1:3
    oto(:,:,k)=sech1(:,:,k+2);
end
prom_oto=nanmean(oto,3);

%Promedio Invierno

for k=1:2
    inv(:,:,k)=sech2(:,:,k);
end
inv(:,:,3)=sech1(:,:,6);

prom_inv=nanmean(inv,3);

%Promedio Primavera
for k=1:3
    pri(:,:,k)=sech2(:,:,k+2);
end
prom_pri=nanmean(pri,3);
 
prom_est_sec_hor=prom_ver;
prom_est_sec_hor(:,:,2)=prom_oto;
prom_est_sec_hor(:,:,3)=prom_inv;
prom_est_sec_hor(:,:,4)=prom_pri;

%Graficos
% y1=-1*y1;
% 
% for k=1:4
% figure(k)
% hold on
% pcolor(x1,y1,prom_est_sec_hor(:,:,k))
% colormap(jet)
% shading interp
% set(gca,'ydir','reverse')
% xlabel('Distancia [km]')
% ylabel('Profundidad [m]')     
% axis tight
% set(gca,'Fontsize',13)
% colorbar
% end 
end