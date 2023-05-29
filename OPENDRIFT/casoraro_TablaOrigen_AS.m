close all; clear all

    file='casoraro_tides_10000_0-200_noDV_siVA.nc';   %0-200 m
    file='casoraro_tides_10000_0-200_siDV_noVA.nc';   %0-200 m

    file

    lon=ncread(file,'lon');
    lat=ncread(file,'lat');
    z=ncread(file,'z');
    status=ncread(file,'status');

    lon0=lon(1,:);
    lat0=lat(1,:);
    lon1=lon(end,:);
    lat1=lat(end,:);
    z_ini=z(1,:);
    z_end=z(end,:);
    s_ini=status(1,:);
    s_end=status(end,:);

    indx_mar=find(s_ini < 1);
%%%%    indx_mar_end=find(s_end < 1 | s_ini < 1 );
    s_mar=s_ini(indx_mar);
    z_i_mar=z_ini(indx_mar);

    figure(1)
    subplot(2,1,1)
    hist(z_ini(indx_mar))
    title_s=['n = ' num2str(length(indx_mar))]  ;  
    title(title_s)
    subplot(2,1,2)
    indx_mar_end=find(z_end < 0);
    hist(z_end(indx_mar_end))
    title_s=['n = ' num2str(length(indx_mar_end))]  ;  
    title(title_s)

    figure(2)
    plot(lat0(indx_mar),z_ini(indx_mar),'x')

    figure(3)
    plot(z(:,indx_mar_end))

    mindep=-0
    indx_d=find(z_ini < mindep);	

    lon2=lon1(indx_d);
    lat2=lat1(indx_d);

    z2=z_ini(indx_d);
    z3=z_end(indx_d);

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
