start
nc=netcdf('back_opendrift.nc','r');
status=nc{'status'}(:,1);
lon=nc{'lon'}(:,1);
lat=nc{'lat'}(:,1);
z=nc{'z'}(:,1);
close(nc)

indx=find(status < 1);      % 0 :active, 1 : seafloor
g_lon=lon(indx);
g_lat=lat(indx);
g_z=z(indx);

plot(g_lat,g_z,'x')

%
% 4893 of 1000
%

all=[g_lon g_lat g_z];
save -ascii vert_section_BGuafo.txt all
