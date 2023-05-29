clear all
close all
clc

lon=ncread('etopo2.nc','lon');
lat=ncread('etopo2.nc','lat');
topo=ncread('etopo2.nc','topo');

xx=find(topo>0);
topo(xx)=NaN;

lon1=lon(3151:3211);
lat1=lat(1381:1411);
topo1=topo(3151:3211,1381:1411);


figure()
pcolor(lon1,lat1,topo1')
colorbar
shading interp

%Seccion de batimetria a -74°W
%Encontrar las el punto mas cercano a las posiciones
  
 C= repmat(lon1,[1 length(-73.8500)]);
 [valor_min,idx_cercano1] =min(abs(C-(-73.8500)'));
 lon_cercana = lon1(idx_cercano1);

 lon1=lon1(idx_cercano1)
 topo_f=topo1(idx_cercano1,:);
 lat_guafo=lat1;
 batimetria_guafo=topo_f;

%save('batimetria_guafo.mat','batimetria_guafo','lat_guafo')

 lon11=lon1(35)
 topo_ff=topo1(35,:);
 lat_guafo1=lat1;
 batimetria_guafo1=topo_ff;


save('batimetria_guafo1.mat','batimetria_guafo1','lat_guafo1')



