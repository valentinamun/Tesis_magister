%Calculo de los componenetes mareales y la marea residuales
clear all
close all
start

nc=netcdf('u_guafo_1.2_M1.nc','r');
h=ncread('mosa_BGQ_1.2_Y2022_h_guafo.nc','h');
lat=ncread('mosa_BGQ_lat_1.2_Y2022_M1M2_guafo.nc','lat_rho');

uvel=nc{'u'}(:,:,:,:);
uvel=squeeze(uvel);
s_rho=nc{'s_rho'}(:);

aux_uvel=squeeze(uvel(1,:,:));
residual=aux_uvel*NaN;
ampM2_mosa12=aux_uvel*NaN;
phaM2_mosa12=aux_uvel*NaN;
ampO1_mosa12=aux_uvel*NaN;
phaO1_mosa12=aux_uvel*NaN;
ampS2_mosa12=aux_uvel*NaN;
phaS2_mosa12=aux_uvel*NaN;

time1=nc{'time'}(:);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Modificar%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_des =  '/media/valentina/TOSHIBA/Tesis1/mareas/';  %Carpeta de destino
fichero_out='Armonicos_Guafo_MOSA12.txt';  %Nombre del fichero de resultados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

        residual_mosa12(z,y)=median(meteo);
        
        ampM2_mosa12(z,y)=aM2;
        ampO1_mosa12(z,y)=aO1;
        ampS2_mosa12(z,y)=aS2;
        phaM2_mosa12(z,y)=pM2;
        phaO1_mosa12(z,y)=pO1;       
        phaS2_mosa12(z,y)=pS2;
      
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
 
%  save -ascii Guafo_ampM2_mosa12.txt ampM2_mosa12
%  save -ascii Guafo_ampO1_mosa12.txt ampO1_mosa12
%  save -ascii Guafo_phaM2_mosa12.txt phaM2_mosa12
%  save -ascii Guafo_phaO1_mosa12.txt phaO1_mosa12
%  save -ascii Guafo_residual_mosa12.txt residual_mosa12

figure(1)
pcolor(flipud(ampM2_mosa12))
colorbar
title('Amplitud M2')
figure(2)
pcolor(flipud(ampS2_mosa12))
colorbar
title('Amplitud S2')
figure(3)
pcolor(flipud(ampO1_mosa12))
colorbar
title('Amplitud O1')
figure(4)
pcolor(flipud(residual_mosa12))
colorbar
title('Residual')

%% Grafico seccion Boca del Guafo
mask=s_rho*h'; %Componnetes sigmas multiplicados por la batimetria
pp=ones([42,58]); %Matriz de uno para crear las latitudes
xx=pp.*lat' %Matriz de latitudes

lat_mosa12=xx;
z_mosa12=mask;

cmap = colormap_cpt('Balance.cpt');

figure(5)
pcolor(xx,mask,flipud(residual_mosa12))
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Residual')
colormap(cmap)
shading interp
h=colorbar 
caxis([-0.4 0.4])
title(h,'[m/s]')
set(gca,'Fontsize',18)


ff=residual_mosa12(:,14:51);
yy=xx(:,14:51);
maskk=mask(:,14:51);

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

% save('residual_mosa12.mat','residual_mosa12');
% save('lat_mosa12.mat','lat_mosa12');
% save('z_mosa12.mat','z_mosa12');


%% Grafico de Residual de Ambos Modelos
clear all
close all
clc

load('residual.mat'); load('lat.mat') ; load('z.mat')
load('residual_mosa12.mat'); load('lat_mosa12.mat') ; load('z_mosa12.mat')

cmap = colormap_cpt('Balance.cpt');

figure()
subplot(121)
hold on
pcolor(lat(:,7:30),z(:,7:30),residual(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),residual(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',2);
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Residual MOSA 2.7km')
colormap(cmap)
shading interp
caxis([-0.4 0.4])
set(gca,'Fontsize',18)
ylim([-210 0])
xlim([-43.8 -43.4])
subplot(122)
hold on
pcolor(lat_mosa12(:,14:51),z_mosa12(:,14:51),residual_mosa12(:,14:51))
C = contour(lat_mosa12(:,14:51),z_mosa12(:,14:51),residual_mosa12(:,14:51),[-1600000 0 160000],...
            '--w','LineWidth',2);
xlabel('Latitud')
title('Residual MOSA 1.2km')
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


load('residual.mat'); load('lat.mat') ; load('z.mat')
load('residual_mosa12.mat'); load('lat_mosa12.mat') ; load('z_mosa12.mat')

%Calculo del largo de cada celda dl

dx=abs(lat(1,1)-lat(1,2)); %Diferencia entre latitudes
dx=dx*111.1*1000; %Transformar de grados a metros

dx2=abs(lat_mosa12(1,1)-lat_mosa12(1,2)); %Diferencia entre latitudes
dx2=dx2*111.1*1000; %Transformar de grados a metros


%Calculo del ancho de cada celda

nc=netcdf('u_Y1_M3_guafo.nc','r');
h=ncread('mosa_BGQ_h_guafo.nc','h');
s_rho=nc{'s_rho'}(:);


nc2=netcdf('u_guafo_1.2_M1.nc','r');
h2=ncread('mosa_BGQ_1.2_Y2022_h_guafo.nc','h');
s_rho2=nc2{'s_rho'}(:);


dy=s_rho*h'; %Largo de cada celda

A=abs(dy*dx); %Area de la celda

T=A.*residual; 

TN = nansum(nansum(T));


dy2=s_rho2*h2'; %Largo de cada celda

A2=abs(dy2*dx2); %Area de la celda

T2=A2.*residual_mosa12; 

TN2 = nansum(nansum(T2));


cmap = colormap_cpt('Balance.cpt'); 

figure()
subplot(121)
hold on
pcolor(lat(:,7:30),z(:,7:30),T(:,7:30))
C = contour(lat(:,7:30),z(:,7:30),T(:,7:30),[-1600000 0 160000],...
            '--w','LineWidth',2);
ylabel('Profundidad [m]')
xlabel('Latitud')
title('Transporte Neto MOSA 2.7km')
colormap(cmap)
shading interp
caxis([-5.6e+04 5.6e+04])
set(gca,'Fontsize',17)
box on
ylim([-210 0])
xlim([-43.8 -43.4])
subplot(122)
hold on
pcolor(lat_mosa12(:,14:51),z_mosa12(:,14:51),T2(:,14:51))
C = contour(lat_mosa12(:,14:51),z_mosa12(:,14:51),T2(:,14:51),[-1600000 0 160000],...
            '--w','LineWidth',2);
xlabel('Latitud')
title('Transporte Neto MOSA 1.2km')
colormap(cmap)
shading interp
a=colorbar;
ylabel(a,'[m^3/s]','FontSize',17);
caxis([-5.6e+04 5.6e+04])
set(gca,'Fontsize',17)
box on
ylim([-210 0])
xlim([-43.8 -43.4])

% figure()
% subplot(121)
% hold on
% pcolor(lat(:,7:30),z(:,7:30),T(:,7:30))
% C = contour(lat(:,7:30),z(:,7:30),T(:,7:30),[-1600000 0 160000],...
%             '--w','LineWidth',2);
% ylabel('Profundidad [m]')
% xlabel('Latitud')
% title('Transporte')
% colormap(cmap)
% shading interp
% a=colorbar;
% ylabel(a,'[m^3/s]','FontSize',17);
% caxis([-4.3e+04 4.3e+04])
% set(gca,'Fontsize',17)
% box on
% 
% subplot(122)
% hold on
% pcolor(lat(:,7:30),z(:,7:30),residual(:,7:30))
% C = contour(lat(:,7:30),z(:,7:30),residual(:,7:30),[-100 0 100],...
%             '--w','LineWidth',2);
% %clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% xlabel('Latitud')
% title('Corriente Residual')
% colormap(cmap)
% shading interp
% a=colorbar;
% ylabel(a,'[m/s]','FontSize',17);
% caxis([-0.4 0.4])
% set(gca,'Fontsize',17)
% box on

%% Histogramas de las secciones 

figure()
subplot(121)
histogram(T(:,7:30));
title('Histograma del Transporte Neto MOSA 2.7km')
set(gca,'FontSize',14)
subplot(122)
histogram(T2(:,7:30));
title('Histograma del Transporte Neto MOSA 1.2km')
set(gca,'FontSize',14)

%% Tablas de Transporte 

TN_mosa = nansum(nansum(T))  %transporte neto
idx_pos=find(T>0)
idx_neg=find(T<0)
TN_pos_mosa=nansum(nansum(T(idx_pos))) %Transporte neto entrando por la Boca del Guafo
TN_neg_mosa=nansum(nansum(T(idx_neg))) %Transporte neto saliendo por la Boca del Guafo

TN_2022 = nansum(nansum(T2))  %transporte neto
idx_pos_2022=find(T2>0)
idx_neg_2022=find(T2<0)
TN_pos_2022=nansum(nansum(T2(idx_pos_2022))) %Transporte neto entrando por la Boca del Guafo
TN_neg_2022=nansum(nansum(T2(idx_neg_2022))) %Transporte neto saliendo por la Boca del Guafo


Tt = table(TN_mosa,TN_2022,TN_pos_mosa,TN_pos_2022,TN_neg_mosa,TN_neg_2022)

writetable(Tt,'Tt.txt')




