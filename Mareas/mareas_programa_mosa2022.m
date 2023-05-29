%Calculo de los componenetes mareales y la marea residuales del modelo MOSA
%12km

clear all
close all
start

nc=netcdf('croco_Y2022_u_M3_guafo.nc','r');
hh=ncread('croco_h_12_guafo.nc','h');
lat=ncread('croco_lat_M3_12_guafo.nc','lat_rho');
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
% for j=1:720
%     A=uvel(j,:,:);
%     A=squeeze(A(1,:,:));
% for i=1:15
%     A(:,i)=NaN;
% end
% B(j,:,:)=A;
% end
% 
% for j=1:720
%     C=B(j,:,:);
%     C=squeeze(C(1,:,:));
% for i=50:58  
%    C(:,i)=NaN;
% end
% D(j,:,:)=C;
% end
% 
% 
% uvel=D;

j=1; 

for y=1:58
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

        meteo = nivelmar-XOUT; %Residual 
                               %nivel del mar corresponde a la componente u de la seccion de la Boca del Guafo 

    
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
 
%  save -ascii Guafo_ampM2.txt ampM2
%  save -ascii Guafo_ampO1.txt ampO1
%  save -ascii Guafo_phaM2.txt phaM2
%  save -ascii Guafo_phaO1.txt phaO1
%  save -ascii Guafo_residual.txt residual

% for i=1:15
%     residual(:,i)=NaN;
% end
% 
% for i=50:58
%     residual(:,i)=NaN;
% end


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


%% 
mask=s_rho*hh'; %Componnetes sigmas multiplicados por la batimetria
pp=ones([42,58]); %Matriz de uno para crear las latitudes
xx=pp.*lat'; %Matriz de latitudes

cmap = colormap_cpt('Balance.cpt');

figure(6)
hold on
pcolor(xx(:,12:53),mask(:,12:53),residual(:,12:53))
C = contour(xx(:,12:53),mask(:,12:53),residual(:,12:53),[-1600000 0 160000],...
            '--w','LineWidth',2);
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Residual')
colormap(cmap)
shading interp
h=colorbar 
caxis([-0.4 0.4])
title(h,'[m/s]')
set(gca,'Xdir','reverse')
set(gca,'Fontsize',18)


% ff=residual(:,12:53);
% yy=xx(:,12:53);
% maskk=mask(:,12:53);
% 
% cmap = colormap_cpt('Balance.cpt');
% 
% figure(7)
% pcolor(yy,maskk,flipud(ff))
% ylabel('Profundidad [m]')
% xlabel('Latitud')
% title('Residual')
% colormap(cmap)
% shading interp
% h=colorbar 
% caxis([-0.4 0.4])
% title(h,'[m/s]')
% set(gca,'Fontsize',18)

% residual_mosa12=residual;
% z_mosa12=mask;
% lat_mosa12=xx;
%  
% save('residual_mosa12.mat','residual_mosa12');
% save('lat_mosa12.mat','lat_mosa12');
% save('z_mosa12.mat','z_mosa12');

%% Grafico de la Residual 
clear all
close all
clc

load('residual_mosa12.mat'); load('lat_mosa12.mat') ; load('z_mosa12.mat')

cmap = colormap_cpt('Balance.cpt');

figure()
hold on
pcolor(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53))
C = contour(lat_mosa12(:,12:53),z_mosa12(:,12:53),residual_mosa12(:,12:53),[-1600000 0 160000],...
            '--w','LineWidth',2);  
xlabel('Latitud')
title('Residual MOSA 1.2km')
set(gca,'Xdir','reverse')
colormap(cmap)
shading interp
h=colorbar 
caxis([-0.4 0.4])
title(h,'[m/s]')
set(gca,'Fontsize',18)
ylim([-210 0])
xlim([-43.8 -43.4])

%% Calculo del area de cada celda
clear all
close all
clc
start

load('residual_mosa12.mat'); load('lat_mosa12.mat') ; load('z_mosa12.mat')
nc=netcdf('croco_Y2022_u_M3_guafo.nc','r');
h=ncread('croco_h_12_guafo.nc','h');
s_rho=nc{'s_rho'}(:);

%Calculo del largo de cada celda dl

dx=abs(lat_mosa12(1,1)-lat_mosa12(1,2)); %Diferencia entre latitudes
dx=dx*111.1*1000; %Transformar de grados a metros

%Calculo del ancho de cada celda

dy=s_rho*h'; %Largo de cada celda

A=abs(dy*dx); %Area de la celda

T=A.*residual_mosa12; 

TN = nansum(nansum(T));
 
%Tablas de Transporte 
idx_pos=find(T>0)
idx_neg=find(T<0)
TN_pos=nansum(nansum(T(idx_pos))) %Transporte neto entrando por la Boca del Guafo
TN_neg=nansum(nansum(T(idx_neg))) %Transporte neto saliendo por la Boca del Guafo

Tt = table(TN,TN_pos,TN_neg)

%% Histogramas de las secciones 
% figure()
% subplot(121)
% histogram(T(:,7:30));
% title('Histograma del Transporte Neto MOSA 2.7km')
% set(gca,'FontSize',14)
% subplot(122)
% histogram(T2(:,7:30));
% title('Histograma del Transporte Neto MOSA 1.2km')
% set(gca,'FontSize',14)

%% Calculo de la seccion U y transporte de la simulacion con mareas sin usar el t_tides

clear all
close all
clc
start

load('lat_mosa12.mat')
load('z_mosa12.mat')
nc=netcdf('croco_Y2022_u_M3_guafo.nc','r');
h=ncread('croco_h_12_guafo.nc','h');
uvel=nc{'u'}(:,:,:,:);
s_rho=nc{'s_rho'}(:);

uvel=nanmean(uvel,1);
uvel=squeeze(uvel(1,:,:));

for i=1:15
    uvel(:,i)=NaN;
end

for i=50:58
    uvel(:,i)=NaN;
end

% for j=1:720
%     A=uvel(j,:,:);
%     A=squeeze(A(1,:,:));
% for i=1:15
%     A(:,i)=NaN;
% end
% B(j,:,:)=A;
% end
% 
% for j=1:720
%     C=B(j,:,:);
%     C=squeeze(C(1,:,:));
% for i=50:58  
%    C(:,i)=NaN;
% end
% D(j,:,:)=C;
% end
% 
% D=nanmean(D,1);
% D=squeeze(D(1,:,:));


cmap = colormap_cpt('Balance.cpt');

figure()
hold on
pcolor(lat_mosa12(:,12:53),z_mosa12(:,12:53),uvel(:,12:53))
C = contour(lat_mosa12(:,12:53),z_mosa12(:,12:53),uvel(:,12:53),[-100 0 100],...
            '--w','LineWidth',2);
%clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
xlabel('Latitud')
title('Componente U de la Velocidad MOSA 2.7 km')
colormap(cmap)
shading interp
a=colorbar;
ylabel(a,'[m/s]','FontSize',17);
caxis([-0.4 0.4])
set(gca,'Fontsize',17)
set(gca,'Xdir','reverse')
box on

% u_mar_gua_12=uuvel;
% save('u_mar_gua_12.mat','u_mar_gua_12'); %promedio mesual de marzo de simulacion con mareas modelo 1.2 km

%Calculo del Transporte 

dx=abs(lat_mosa12(1,1)-lat_mosa12(1,2)); %Diferencia entre latitudes
dx=dx*111.1*1000; %Transformar de grados a metros

%Calculo del ancho de cada celda

dy=s_rho*h'; %Largo de cada celda

A=abs(dy*dx); %Area de la celda

T=A.*uvel; %Transporte

TN = nansum(nansum(T)); %Transporte neto
idx_pos=find(T>0) %Valores positivos
idx_neg=find(T<0) %Valores negativos
TN_pos=nansum(nansum(T(idx_pos))) %Transporte neto entrando por la Boca del Guafo
TN_neg=nansum(nansum(T(idx_neg))) %Transporte neto saliendo por la Boca del Guafo

Tt = table(TN,TN_pos,TN_neg)


