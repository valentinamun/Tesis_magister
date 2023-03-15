%Calculo de los componenetes mareales y la marea residuales
clear all
close all
start

nc=netcdf('u_Y1_M3_guafo.nc','r');

h=ncread('mosa_BGQ_h_guafo.nc','h');
lat=ncread('mosa_BGQ_lat_guafo.nc','lat_rho');

uvel=nc{'u'}(:,:,:,:);
uvel=squeeze(uvel);
s_rho=nc{'s_rho'}(:);

aux_uvel=squeeze(uvel(1,:,:));
residual=aux_uvel*NaN;
ampM2=aux_uvel*NaN;
phaM2=aux_uvel*NaN;
ampO1=aux_uvel*NaN;
phaO1=aux_uvel*NaN;
ampS2=aux_uvel*NaN;
phaS2=aux_uvel*NaN;

time1=nc{'time'}(:);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Modificar%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_des =  '/home/valentina/Escritorio/mareas/';  %Carpeta de destino
fichero_out='Armonicos_Guafo.txt';  %Nombre del fichero de resultados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

j=1; 

for y=1:33
    for z=1:42
        ts_u=uvel(:,z,y);
        nivelmar=ts_u;
        if abs(max(nivelmar))+abs(min(nivelmar)) > 0
            
        [NAME,FREQ,TIDECON,XOUT]=t_tide(nivelmar,'output',[path_des fichero_out]);

        % En NAME se guarda el nombre del armónico
        % En FREQ se guarda la frecuencia
        % En TIDECON se guarda la amplitud y fase con sus respectivos errores
        % En XOUT se guarda la serie temporal de marea astronomica

        % Tras T_TIDE especificamos: (1) variable del nivel del mar 
        %                            (2) 'output' especificamos que es una salida
        %                            (3) nombre del fichero de salida
 
        % 5. Calculamos la marea meteorológica y la guardamos

        meteo = nivelmar-XOUT; 

    
        % 7. Selección componentes más significativas

        media = mean(TIDECON(:,1)); %Calculamos la media de la amplitud
        isig = find(TIDECON(:,1) > media); %Busca la posición de valores superiores a la media

        TIDECON=round(TIDECON*1000)/1000;

        [aux indx]=sort(TIDECON(isig,1));

        indx=flipud(indx);   % Orden Decreciente

        harm_isig = [TIDECON(isig(indx),1) TIDECON(isig(indx),3)]; %Identifica los valores buscados
        name_isig = NAME(isig(indx),:); %Identifica los valores buscados
        freq_isig = FREQ(isig(indx)); %Identifica los valores buscados

        freq_isig=round(freq_isig*10000)/10000;

        TOTAL = [name_isig num2str(freq_isig) name_isig(:,4)  num2str(harm_isig)];

        aux=ismember(NAME,'K1  ','rows');
        indxK1=find(aux==1);
        aux=ismember(NAME,'O1  ','rows');
        indxO1=find(aux==1);
        aux=ismember(NAME,'M2  ','rows');
        indxM2=find(aux==1);
        aux=ismember(NAME,'S2  ','rows');
        indxS2=find(aux==1);

        aK1=TIDECON(indxK1,1);
        aO1=TIDECON(indxO1,1);
        aM2=TIDECON(indxM2,1);
        aS2=TIDECON(indxS2,1);

        pK1=TIDECON(indxK1,3);
        pO1=TIDECON(indxO1,3);
        pM2=TIDECON(indxM2,3);
        pS2=TIDECON(indxS2,3);

        residual(z,y)=median(meteo);
        
        ampM2(z,y)=aM2;
        ampO1(z,y)=aO1;
        ampS2(z,y)=aS2;
        phaM2(z,y)=pM2;
        phaO1(z,y)=pO1;       
        phaS2(z,y)=pS2;
      
        F=(aK1+aO1)/(aM2+aS2);

        if F <0.26 
            disp('Marea Semidiurna')
        elseif 0.25 < F  & F < 1.5
           disp('Marea mixta con predominio semidiurno')
        elseif 1.50 < F  & F < 3
            disp('Marea mixta con predominio diurno')
        else
            disp('Marea Diurna')
        end 
        j=j+1;
%        keyboard
        end     
    end
end
 
 save -ascii Guafo_ampM2.txt ampM2
 save -ascii Guafo_ampO1.txt ampO1
 save -ascii Guafo_phaM2.txt phaM2
 save -ascii Guafo_phaO1.txt phaO1
 save -ascii Guafo_residual.txt residual

figure(1)
pcolor(flipud(ampM2))
colorbar
title('Amplitud M2')
figure(2)
pcolor(flipud(ampS2))
colorbar
title('Amplitud S2')
figure(3)
pcolor(flipud(ampO1))
colorbar
title('Amplitud O1')
figure(4)
pcolor(flipud(residual))
colorbar
title('Residual')

%% Grafico seccion Boca del Guafo
mask=s_rho*h'; %Componnetes sigmas multiplicados por la batimetria
pp=ones([42,33]); %Matriz de uno para crear las latitudes
xx=pp.*lat' %Matriz de latitudes

cmap = colormap_cpt('Balance.cpt');

figure(5)
pcolor(xx,mask,flipud(residual))
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Residual')
colormap(cmap)
shading interp
h=colorbar 
caxis([-0.4 0.4])
title(h,'[m/s]')
set(gca,'Fontsize',18)


ff=residual(:,7:30);
yy=xx(:,7:30);
maskk=mask(:,7:30);

cmap = colormap_cpt('Balance.cpt');

figure(6)
pcolor(yy,maskk,flipud(ff))
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Residual')
colormap(cmap)
shading interp
h=colorbar 
caxis([-0.4 0.4])
title(h,'[m/s]')
set(gca,'Fontsize',18)

%   lat=xx;
%   z=mask;
%   save('lat.mat','lat');
%   save('z.mat','z');
%   save('residual.mat','residual');

%% Calculo del area de cada celda
clear all
close all
clc

load('residual.mat'); load('lat.mat') ; load('z.mat')

%Calculo del largo de cada celda dl

dx=abs(lat(1,1)-lat(1,2)); %Diferencia entre latitudes
dx=dx*111.1*1000; %Transformar de grados a metros

%Calculo del ancho de cada celda

nc=netcdf('u_Y1_M3_guafo.nc','r');
h=ncread('mosa_BGQ_h_guafo.nc','h');
s_rho=nc{'s_rho'}(:);

dy=s_rho*h'; %Largo de cada celda

A=abs(dy*dx); %Area de la celda

T=A.*residual; 

TN = nansum(nansum(T));

cmap = colormap_cpt('Balance.cpt'); 

figure()
subplot(121)
pcolor(lat,z,T)
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Transporte')
colormap(cmap)
shading interp
colorbar
caxis([-4.2543e+04 4.2543e+04])
set(gca,'Fontsize',18)

subplot(122)
pcolor(lat,z,residual)
xlabel('Latitud')
title(' Corriente Residual')
colormap(cmap)
shading interp
colorbar
caxis([-0.4 0.4])
set(gca,'Fontsize',18)
