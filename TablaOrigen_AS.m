close all; clear all

     file='./Valentina/mosa_opendrift_VM_10000.nc';
     file='./Valentina/mosa_opendrift_VM_50000.nc';
     file='./Valentina/mosa_opendrift_VM_100000.nc';
%     file='./Valentina/mosa_opendrift_sup_VM_10000.nc';
%    file='./Valentina/mosa_opendrift_sup_VM_100000.nc';
%    file='mosa_opendrift_AS_100000_0-50m.nc';
%    file='mosa_opendrift_AS_100000.nc';  %0-200 m
%    file='mosa_opendrift_AS_50000.nc';   %0-200 m
%    file='mosa_opendrift_AS_10000.nc';   %0-200 m

    file

    lon=ncread(file,'lon');
    lat=ncread(file,'lat');
    z=ncread(file,'z');
    lon1=lon(end,:);
    lat1=lat(end,:);
    z_ini=z(1,:);
    z_end=z(end,:);

    mindep=-50
    indx_d=find(z_ini < mindep);	

    lon2=lon1(indx_d);
    lat2=lat1(indx_d);

    z2=z_ini(indx_d);
    z3=z_end(indx_d);

    % 
    %            
    %
    depths = [min(z_ini) max(z_ini) min(z_end) max(z_end) min(z2)  max(z2)   min(z3)   max(z3)]

    ene=length(lat2)
    indx_in=find(lon2  > -74.00);
    in=length(indx_in)/ene*100;
    lon_in=lon2(indx_in);
    min(lon_in);
    max(lon_in);

    indx_out=find(lon2  < -74.00);
    lat3=lat2;
    lat3(indx_in)=[];
    lon3=lon2;
    lon3(indx_in)=[];

    min(lon3);
    max(lon3);

    indx_up=find(lat3    >  -43.5);
    indx_down=find(lat3  <  -43.5);
    
    in=length(indx_in)/ene*100;
    up=length(indx_up)/ene*100;
    down=length(indx_down)/ene*100;

    total=up+down+in;

    disp(['in ' 'up ' 'down ' 'total '])
    procentajes=[in up down total]
