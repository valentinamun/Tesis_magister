%Graficos mercator 2020 todos los meses de año
clear all
close all
addpath= '/home/valentina/Escritorio/Tesis1/Avance_Tesis/';

% Cargar datos modelo Mercator
dir='/home/valentina/Escritorio/Tesis1/Mercator/';

% reading NCEP2 files
file1 = [dir 'PCUC_2019_01.nc'];
file2 = [dir 'PCUC_2021_01.nc'];
ncdisp(file1);
ncdisp(file2);

%Cargar los datos 2020
lon=ncread([file1],'longitude');
lat=ncread([file1],'latitude');
time1=ncread([file1],'time');
sal1=ncread([file1],'so');
temp1=ncread([file1],'thetao');
depth=ncread([file1],'depth');
vo1=ncread([file1],'vo');
uo1=ncread([file1],'uo');

%Cargar los datos 2021
time2=ncread([file2],'time');
sal2=ncread([file2],'so');
temp2=ncread([file2],'thetao');
depth2=ncread([file1],'depth');
vo2=ncread([file2],'vo');
uo2=ncread([file2],'uo');

%Tiempo de datos
T1 = datetime(1950,1,1) + hours(time1);
T1.Format = 'yyyy-MM-dd';
T2 = datetime(1950,1,1) + hours(time2);
T2.Format = 'yyyy-MM-dd';

%Promedio mensual de febrero,mayo,julio,noviembre 2020

% %Enero
% ene_t=temp1(:,:,:,1:31);
% ene_s=sal1(:,:,:,1:31);
% ene_v=vo1(:,:,:,1:31);
% ene_tt=mean(ene_t,4);
% ene_ss=mean(ene_s,4);
% ene_vv=mean(ene_v,4);

%Febrero
feb_t=temp1(:,:,:,32:60);
feb_s=sal1(:,:,:,32:60);
feb_v=vo1(:,:,:,32:60);
feb_tt=mean(feb_t,4);
feb_ss=mean(feb_s,4);
feb_vv=mean(feb_v,4);

% %Marzo
% mar_t=temp1(:,:,:,61:91);
% mar_s=sal1(:,:,:,61:91);
% mar_v=vo1(:,:,:,61:91);
% mar_tt=mean(mar_t,4);
% mar_ss=mean(mar_s,4);
% mar_vv=mean(mar_v,4);

% %Abril
% abr_t=temp1(:,:,:,92:121);
% abr_s=sal1(:,:,:,92:121);
% abr_v=vo1(:,:,:,92:121);
% abr_tt=mean(abr_t,4);
% abr_ss=mean(abr_s,4);
% abr_vv=mean(abr_v,4);

%Mayo
may_t=temp1(:,:,:,122:152);
may_s=sal1(:,:,:,122:152);
may_v=vo1(:,:,:,122:152);
may_tt=mean(may_t,4);
may_ss=mean(may_s,4);
may_vv=mean(may_v,4);

% %Junio
% jun_t=temp1(:,:,:,153:182);
% jun_s=sal1(:,:,:,153:182);
% jun_v=vo1(:,:,:,153:182);
% jun_tt=mean(jun_t,4);
% jun_ss=mean(jun_s,4);
% jun_vv=mean(jun_v,4);

%Julio
jul_t=temp1(:,:,:,183:213);
jul_s=sal1(:,:,:,183:213);
jul_v=vo1(:,:,:,183:213);
jul_tt=mean(jul_t,4);
jul_ss=mean(jul_s,4);
jul_vv=mean(jul_v,4);

% %Agosto
% ago_t=temp1(:,:,:,214:244);
% ago_s=sal1(:,:,:,214:244);
% ago_v=vo1(:,:,:,214:244);
% ago_tt=mean(ago_t,4);
% ago_ss=mean(ago_s,4);
% ago_vv=mean(ago_v,4);

% %Septiembre
% sep_t=temp1(:,:,:,245:274);
% sep_s=sal1(:,:,:,245:274);
% sep_v=vo1(:,:,:,245:274);
% sep_tt=mean(sep_t,4);
% sep_ss=mean(sep_s,4);
% sep_vv=mean(sep_v,4);

% %Octubre
% oct_t=temp1(:,:,:,275:305);
% oct_s=sal1(:,:,:,275:305);
% oct_v=vo1(:,:,:,275:305);
% oct_tt=mean(oct_t,4);
% oct_ss=mean(oct_s,4);
% oct_vv=mean(oct_v,4);

%Noviembre
nov_t=temp1(:,:,:,306:335);
nov_s=sal1(:,:,:,306:335);
nov_v=vo1(:,:,:,306:335);
nov_tt=mean(nov_t,4);
nov_ss=mean(nov_s,4);
nov_vv=mean(nov_v,4);

% %Diciembre
% dic_t=temp1(:,:,:,336:365);
% dic_s=sal1(:,:,:,336:365);
% dic_v=vo1(:,:,:,336:365);
% dic_tt=mean(dic_t,4);
% dic_ss=mean(dic_s,4);
% dic_vv=mean(dic_v,4);


%Promedio mensual de febrero,mayo,julio,noviembre 2021

%Enero
% ene_t2=temp2(:,:,:,2:32);
% ene_s2=sal2(:,:,:,2:32);
% ene_v2=vo2(:,:,:,2:32);
% ene_tt2=mean(ene_t2,4);
% ene_ss2=mean(ene_s2,4);
% ene_vv2=mean(ene_v2,4);

%Febrero
feb_t2=temp2(:,:,:,33:60);
feb_s2=sal2(:,:,:,33:60);
feb_v2=vo2(:,:,:,33:60);
feb_tt2=mean(feb_t2,4);
feb_ss2=mean(feb_s2,4);
feb_vv2=mean(feb_v2,4);

% %Marzo
% mar_t2=temp2(:,:,:,61:91);
% mar_s2=sal2(:,:,:,61:91);
% mar_v2=vo2(:,:,:,61:91);
% mar_tt2=mean(mar_t2,4);
% mar_ss2=mean(mar_s2,4);
% mar_vv2=mean(mar_v2,4);

% %Abril
% abr_t2=temp2(:,:,:,92:121);
% abr_s2=sal2(:,:,:,92:121);
% abr_v2=vo2(:,:,:,92:121);
% abr_tt2=mean(abr_t2,4);
% abr_ss2=mean(abr_s2,4);
% abr_vv2=mean(abr_v2,4);

%Mayo
may_t2=temp2(:,:,:,122:152);
may_s2=sal2(:,:,:,122:152);
may_v2=vo2(:,:,:,122:152);
may_tt2=mean(may_t2,4);
may_ss2=mean(may_s2,4);
may_vv2=mean(may_v2,4);
% 
% %Junio
% jun_t2=temp2(:,:,:,153:182);
% jun_s2=sal2(:,:,:,153:182);
% jun_v2=vo2(:,:,:,153:182);
% jun_tt2=mean(jun_t2,4);
% jun_ss2=mean(jun_s2,4);
% jun_vv2=mean(jun_v2,4);

%Julio
jul_t2=temp2(:,:,:,183:213);
jul_s2=sal2(:,:,:,183:213);
jul_v2=vo2(:,:,:,183:213);
jul_tt2=mean(jul_t2,4);
jul_ss2=mean(jul_s2,4);
jul_vv2=mean(jul_v2,4);
% 
% %Agosto
% ago_t2=temp2(:,:,:,214:244);
% ago_s2=sal2(:,:,:,214:244);
% ago_v2=vo2(:,:,:,214:244);
% ago_tt2=mean(ago_t2,4);
% ago_ss2=mean(ago_s2,4);
% ago_vv2=mean(ago_v2,4);
% 
% %Septiembre
% sep_t2=temp2(:,:,:,245:274);
% sep_s2=sal2(:,:,:,245:274);
% sep_v2=vo2(:,:,:,245:274);
% sep_tt2=mean(sep_t2,4);
% sep_ss2=mean(sep_s2,4);
% sep_vv2=mean(sep_v2,4);
% 
% %Octubre
% oct_t2=temp2(:,:,:,275:305);
% oct_s2=sal2(:,:,:,275:305);
% oct_v2=vo2(:,:,:,275:305);
% oct_tt2=mean(oct_t2,4);
% oct_ss2=mean(oct_s2,4);
% oct_vv2=mean(oct_v2,4);

%Noviembre
nov_t2=temp2(:,:,:,306:335);
nov_s2=sal2(:,:,:,306:335);
nov_v2=vo2(:,:,:,306:335);
nov_tt2=mean(nov_t2,4);
nov_ss2=mean(nov_s2,4);
nov_vv2=mean(nov_v2,4);

% %Diciembre
% dic_t2=temp2(:,:,:,336:365);
% dic_s2=sal2(:,:,:,336:365);
% dic_v2=vo2(:,:,:,336:365);
% dic_tt2=mean(dic_t2,4);
% dic_ss2=mean(dic_s2,4);
% dic_vv2=mean(dic_v2,4);

%% Secciones a 40.5°S
%Año 2020

% t_ene=squeeze(ene_tt(:,55,:));
% s_ene=squeeze(ene_ss(:,55,:));
% v_ene=squeeze(ene_vv(:,55,:));

t_feb=squeeze(feb_tt(:,55,:));
s_feb=squeeze(feb_ss(:,55,:));
v_feb=squeeze(feb_vv(:,55,:));
% 
% t_mar=squeeze(mar_tt(:,55,:));
% s_mar=squeeze(mar_ss(:,55,:));
% v_mar=squeeze(mar_vv(:,55,:));
% 
% t_abr=squeeze(abr_tt(:,55,:));
% s_abr=squeeze(abr_ss(:,55,:));
% v_abr=squeeze(abr_vv(:,55,:));

t_may=squeeze(may_tt(:,55,:));
s_may=squeeze(may_ss(:,55,:));
v_may=squeeze(may_vv(:,55,:));
% 
% t_jun=squeeze(jun_tt(:,55,:));
% s_jun=squeeze(jun_ss(:,55,:));
% v_jun=squeeze(jun_vv(:,55,:));

t_jul=squeeze(jul_tt(:,55,:));
s_jul=squeeze(jul_ss(:,55,:));
v_jul=squeeze(jul_vv(:,55,:));
% 
% t_ago=squeeze(ago_tt(:,55,:));
% s_ago=squeeze(ago_ss(:,55,:));
% v_ago=squeeze(ago_vv(:,55,:));
% 
% t_sep=squeeze(sep_tt(:,55,:));
% s_sep=squeeze(sep_ss(:,55,:));
% v_sep=squeeze(sep_vv(:,55,:));
% 
% t_oct=squeeze(oct_tt(:,55,:));
% s_oct=squeeze(oct_ss(:,55,:));
% v_oct=squeeze(oct_vv(:,55,:));

t_nov=squeeze(nov_tt(:,55,:));
s_nov=squeeze(nov_ss(:,55,:));
v_nov=squeeze(nov_vv(:,55,:));

% t_dic=squeeze(dic_tt(:,55,:));
% s_dic=squeeze(dic_ss(:,55,:));
% v_dic=squeeze(dic_vv(:,55,:));

%Año 2021

% t_ene2=squeeze(ene_tt2(:,55,:));
% s_ene2=squeeze(ene_ss2(:,55,:));
% v_ene2=squeeze(ene_vv2(:,55,:));

t_feb2=squeeze(feb_tt2(:,55,:));
s_feb2=squeeze(feb_ss2(:,55,:));
v_feb2=squeeze(feb_vv2(:,55,:));
% 
% t_mar2=squeeze(mar_tt2(:,55,:));
% s_mar2=squeeze(mar_ss2(:,55,:));
% v_mar2=squeeze(mar_vv2(:,55,:));
% 
% t_abr2=squeeze(abr_tt2(:,55,:));
% s_abr2=squeeze(abr_ss2(:,55,:));
% v_abr2=squeeze(abr_vv2(:,55,:));

t_may2=squeeze(may_tt2(:,55,:));
s_may2=squeeze(may_ss2(:,55,:));
v_may2=squeeze(may_vv2(:,55,:));
% 
% t_jun2=squeeze(jun_tt2(:,55,:));
% s_jun2=squeeze(jun_ss2(:,55,:));
% v_jun2=squeeze(jun_vv2(:,55,:));

t_jul2=squeeze(jul_tt2(:,55,:));
s_jul2=squeeze(jul_ss2(:,55,:));
v_jul2=squeeze(jul_vv2(:,55,:));
% 
% t_ago2=squeeze(ago_tt2(:,55,:));
% s_ago2=squeeze(ago_ss2(:,55,:));
% v_ago2=squeeze(ago_vv2(:,55,:));
% 
% t_sep2=squeeze(sep_tt2(:,55,:));
% s_sep2=squeeze(sep_ss2(:,55,:));
% v_sep2=squeeze(sep_vv2(:,55,:));
% 
% t_oct2=squeeze(oct_tt2(:,55,:));
% s_oct2=squeeze(oct_ss2(:,55,:));
% v_oct2=squeeze(oct_vv2(:,55,:));

t_nov2=squeeze(nov_tt2(:,55,:));
s_nov2=squeeze(nov_ss2(:,55,:));
v_nov2=squeeze(nov_vv2(:,55,:));
% 
% t_dic2=squeeze(dic_tt2(:,55,:));
% s_dic2=squeeze(dic_ss2(:,55,:));
% v_dic2=squeeze(dic_vv2(:,55,:));

%Transformar a Distancia las longitudes.
%Convertir de grados a km seccion 1

lon1=double(lon(1:31));
lat1=-40.5;
%lon1=flipud(lon1);
    
for i=1:length(lon1)-1
        DISTANCIA(i)=deg2km(distance(lat1,lon(i),lat1,lon(i+1)));
       %DISTANCIA(i)=deg2km(distance(lon1(i),lat,lon1(i+1),lat));
end

DISTANCIA_ACUMULADA=cumsum(DISTANCIA);    
Dis=[0;DISTANCIA_ACUMULADA'];
Dis=flipud(Dis)


%% Grafica mensual de Mercator 2020-2021 

%temp= colormap_cpt('TEMP.cpt');
% 
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:31),t_ene(1:31,1:31)')
% shading interp
% C = contour(Dis,depth(1:31),t_ene(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([5 17])
% box on
% sgtitle('Temperatura MERCATOR 40.5°S','FontWeight','bold')
% 
% subplot(342)
% hold on
% pcolor(Dis,depth(1:31),t_feb(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_feb(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(343)
% hold on
% pcolor(Dis,depth(1:31),t_mar(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_mar(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(344)
% hold on
% pcolor(Dis,depth(1:31),t_abr(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_abr(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(345)
% hold on
% pcolor(Dis,depth(1:31),t_may(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_may(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(346)
% hold on
% pcolor(Dis,depth(1:31),t_jun(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_jun(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(347)
% hold on
% pcolor(Dis,depth(1:31),t_jul(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_jul(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% 
% subplot(348)
% hold on
% pcolor(Dis,depth(1:31),t_ago(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_ago(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(349)
% hold on
% pcolor(Dis,depth(1:31),t_sep(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_sep(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Septiembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:31),t_oct(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_oct(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:31),t_nov(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_nov(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:31),t_dic(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_dic(1:31,1:31)',[5:2:17],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% h=colorbar;
% h.Title.String = "[°C]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% 
% %Temperatura datos 2021
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:31),t_ene2(1:31,1:31)')
% shading interp
% C = contour(Dis,depth(1:31),t_ene2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% sgtitle('Temperatura MERCATOR 2021 40.5°S','FontWeight','bold')
% subplot(342)
% hold on
% pcolor(Dis,depth(1:31),t_feb2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_feb2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:31),t_mar2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_mar2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:31),t_abr2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_abr2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:31),t_may2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_may2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:31),t_jun2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_jun2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:31),t_jul2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_jul2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% colorbar
% subplot(348)
% hold on
% pcolor(Dis,depth(1:31),t_ago2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_ago2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:31),t_sep2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_sep2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Septiembre','FontSize',12)
% xlabel('Distancia [km]')
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:31),t_oct2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_oct2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:31),t_nov2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_nov2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:31),t_dic2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),t_dic2(1:31,1:31)',[6:2:16],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% h=colorbar;
% h.Title.String = "[°C]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% box on


%% Salinidad
% %Salinidad mercator datos 2020
% 
% sal= colormap_cpt('SAL.cpt');
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:31),s_ene(1:31,1:31)')
% shading interp
% C = contour(Dis,depth(1:31),s_ene(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% sgtitle('Salinidad MERCATOR 2020 40.5°S','FontWeight','bold')
% subplot(342)
% hold on
% pcolor(Dis,depth(1:31),s_feb(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_feb(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:31),s_mar(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_mar(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:31),s_abr(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_abr(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:31),s_may(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_may(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:31),s_jun(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_jun(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:31),s_jul(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_jul(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(348)
% hold on
% pcolor(Dis,depth(1:31),s_ago(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_ago(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:31),s_sep(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_sep(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Septiembre','FontSize',12)
% ylabel('Profundidad [m]')
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:31),s_oct(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_oct(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:31),s_nov(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_nov(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:31),s_dic(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_dic(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% h=colorbar;
% h.Title.String = "[PSU]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% 
% %Salinidad datos 2021
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:31),s_ene2(1:31,1:31)')
% shading interp
% C = contour(Dis,depth(1:31),s_ene2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% sgtitle('Salinidad MERCATOR 2021 40.5°S','FontWeight','bold')
% subplot(342)
% hold on
% pcolor(Dis,depth(1:31),s_feb2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_feb2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:31),s_mar2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_mar2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:31),s_abr2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_abr2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:31),s_may2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_may2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% axis tight
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:31),s_jun2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_jun2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:31),s_jul2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_jul2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(348)
% hold on
% pcolor(Dis,depth(1:31),s_ago2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_ago2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:31),s_sep2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_sep2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Septiembre','FontSize',12)
% ylabel('Profundidad [m]')
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:31),s_oct2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_oct2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:31),s_nov2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_nov2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:31),s_dic2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),s_dic2(1:31,1:31)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% h=colorbar;
% h.Title.String = "[PSU]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% box on

%% Velocidad V
%Datos de 2020
% vel= colormap_cpt('Balance.cpt');
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:31),v_ene(1:31,1:31)')
% shading interp
% C = contour(Dis,depth(1:31),v_ene(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% sgtitle('Velocidad MERCATOR 2020 40.5°S','FontWeight','bold')
% subplot(342)
% hold on
% pcolor(Dis,depth(1:31),v_feb(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_feb(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:31),v_mar(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_mar(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:31),v_abr(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_abr(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:31),v_may(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_may(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:31),v_jun(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_jun(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:31),v_jul(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_jul(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(348)
% hold on
% pcolor(Dis,depth(1:31),v_ago(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_ago(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:31),v_sep(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_sep(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Septiembre','FontSize',12)
% ylabel('Profundidad [m]')
% xlabel('Distancia [km]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:31),v_oct(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_oct(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:31),v_nov(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_nov(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:31),v_dic(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_dic(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(vel)
% h=colorbar;
% h.Title.String = "[PSU]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% 
% %Velocidad datos 2021
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:31),v_ene2(1:31,1:31)')
% shading interp
% C = contour(Dis,depth(1:31),v_ene2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% sgtitle('Velocidad MERCATOR 2021 40.5°S','FontWeight','bold')
% 
% subplot(342)
% hold on
% pcolor(Dis,depth(1:31),v_feb2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_feb2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:31),v_mar2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_mar2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:31),v_abr2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_abr2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:31),v_may2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_may2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% axis tight
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:31),v_jun2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_jun2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:31),v_jul2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_jul2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(348)
% hold on
% pcolor(Dis,depth(1:31),v_ago2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_ago2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:31),v_sep2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_sep2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Septiembre','FontSize',12)
% ylabel('Profundidad [m]')
% xlabel('Distancia [km]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:31),v_oct2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_oct2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:31),v_nov2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_nov2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(vel)
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:31),v_dic2(1:31,1:31)')
% shading interp 
% C = contour(Dis,depth(1:31),v_dic2(1:31,1:31)',[-0.1:0.1:0.1],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(vel)
% h=colorbar;
% h.Title.String = "[m/s]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'Xdir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([-0.3 0.3])
% box on
%% Comparacion MERCATOR 2020-2021 feb,may,jun,nov

temp= colormap_cpt('TEMP.cpt');

figure()
subplot(241)
hold on
pcolor(Dis,depth(1:31),t_feb(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),t_feb(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Febrero 2020','FontSize',12)
ylabel('Profundidad [m]')
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on
sgtitle('Temperatura MERCATOR 40.5°S','FontWeight','bold')
subplot(242)
hold on
pcolor(Dis,depth(1:31),t_may(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),t_may(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Mayo 2020','FontSize',12)
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on
subplot(243)
hold on
pcolor(Dis,depth(1:31),t_jul(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),t_jul(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Julio 2020','FontSize',12)
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on
subplot(244)
hold on
pcolor(Dis,depth(1:31),t_nov(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),t_nov(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Noviembre 2020','FontSize',12)
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on
subplot(245)
hold on
pcolor(Dis,depth(1:31),t_feb2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),t_feb2(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Febrero 2021','FontSize',12)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
text(20,520,'Costa','Fontsize',14,...
        'FontName','Courier','Color','k') 
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on
subplot(246)
hold on
pcolor(Dis,depth(1:31),t_may2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),t_may2(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Mayo 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on
subplot(247)
hold on
pcolor(Dis,depth(1:31),t_jul2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),t_jul2(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Julio 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on
subplot(248)
hold on
pcolor(Dis,depth(1:31),t_nov2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),t_nov2(1:31,1:31)',[6:2:16],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Noviembre 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(temp)
h=colorbar;
h.Title.String = "[°C]";
set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
box on

%Salinidad
sal= colormap_cpt('SAL.cpt');

figure()
subplot(241)
hold on
pcolor(Dis,depth(1:31),s_feb(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),s_feb(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2020','FontSize',12)
ylabel('Profundidad [m]')
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
sgtitle('Salinidad MERCATOR 40.5°S','FontWeight','bold')
subplot(242)
hold on
pcolor(Dis,depth(1:31),s_may(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),s_may(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2020','FontSize',12)
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
subplot(243)
hold on
pcolor(Dis,depth(1:31),s_jul(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),s_jul(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Julio 2020','FontSize',12)
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
subplot(244)
hold on
pcolor(Dis,depth(1:31),s_nov(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),s_nov(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2020','FontSize',12)
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
subplot(245)
hold on
pcolor(Dis,depth(1:31),s_feb2(1:31,1:31)')
shading interp
C = contour(Dis,depth(1:31),s_feb2(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2021','FontSize',12)
ylabel('Profundidad [m]')
xlabel('Distancia [km]')
text(20,520,'Costa','Fontsize',14,...
        'FontName','Courier','Color','k') 
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
subplot(246)
hold on
pcolor(Dis,depth(1:31),s_may2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),s_may2(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
subplot(247)
hold on
pcolor(Dis,depth(1:31),s_jul2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),s_jul2(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Julio 2021','FontSize',12)
colormap(sal)
xlabel('Distancia [km]')
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
subplot(248)
hold on
pcolor(Dis,depth(1:31),s_nov2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),s_nov2(1:31,1:31)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
axis tight
box on
h=colorbar;
h.Title.String = "[PSU]";
set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
set(h,'FontSize',14);

%Velocidad

vel= colormap_cpt('Balance.cpt');

figure()
subplot(241)
hold on
pcolor(Dis,depth(1:31),v_feb(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_feb(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2020','FontSize',12)
ylabel('Profundidad [m]')
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
sgtitle('Velocidad V MERCATOR 40.5°S','FontWeight','bold')
box on
subplot(242)
hold on
pcolor(Dis,depth(1:31),v_may(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_may(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2020','FontSize',12)
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(243)
hold on
pcolor(Dis,depth(1:31),v_jul(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_jul(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Julio 2020','FontSize',12)
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(244)
hold on
pcolor(Dis,depth(1:31),v_nov(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_nov(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2020','FontSize',12)
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(245)
hold on
pcolor(Dis,depth(1:31),v_feb2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_feb2(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2021','FontSize',12)
ylabel('Profundidad [m]')
xlabel('Distancia [km]')
text(20,520,'Costa','Fontsize',14,...
        'FontName','Courier','Color','k') 
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(246)
hold on
pcolor(Dis,depth(1:31),v_may2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_may2(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(247)
hold on
pcolor(Dis,depth(1:31),v_jul2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_jul2(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Julio 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(248)
hold on
pcolor(Dis,depth(1:31),v_nov2(1:31,1:31)')
shading interp 
C = contour(Dis,depth(1:31),v_nov2(1:31,1:31)',[-0.1:0.1:0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(vel)
h=colorbar;
h.Title.String = "[m/s]";
set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'Xdir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on


%% Seccion Boca del Guafo

clear all
close all
addpath= '/home/valentina/Escritorio/Tesis1/Avance_Tesis/';

% Cargar datos modelo Mercator
dir='/home/valentina/Escritorio/Tesis1/Mercator/';

% reading NCEP2 files
file1 = [dir 'PCUC_2019_01.nc'];
file2 = [dir 'PCUC_2021_01.nc'];
ncdisp(file1);
ncdisp(file2);

%Cargar los datos 2020
lon=ncread([file1],'longitude');
lat=ncread([file1],'latitude');
time1=ncread([file1],'time');
sal1=ncread([file1],'so');
temp1=ncread([file1],'thetao');
depth=ncread([file1],'depth');
uo1=ncread([file1],'uo');

%Cargar los datos 2021
time2=ncread([file2],'time');
sal2=ncread([file2],'so');
temp2=ncread([file2],'thetao');
depth2=ncread([file1],'depth');
uo2=ncread([file2],'uo');
% 
% %Enero
% ene_t=temp1(:,:,:,1:31);
% ene_s=sal1(:,:,:,1:31);
% ene_u=uo1(:,:,:,1:31);
% ene_tt=mean(ene_t,4);
% ene_ss=mean(ene_s,4);
% ene_uu=mean(ene_u,4);

%Febrero
feb_t=temp1(:,:,:,32:60);
feb_s=sal1(:,:,:,32:60);
feb_u=uo1(:,:,:,32:60);
feb_tt=mean(feb_t,4);
feb_ss=mean(feb_s,4);
feb_uu=mean(feb_u,4);
% 
% %Marzo
% mar_t=temp1(:,:,:,61:91);
% mar_s=sal1(:,:,:,61:91);
% mar_u=uo1(:,:,:,61:91);
% mar_tt=mean(mar_t,4);
% mar_ss=mean(mar_s,4);
% mar_uu=mean(mar_u,4);

% %Abril
% abr_t=temp1(:,:,:,92:121);
% abr_s=sal1(:,:,:,92:121);
% abr_u=uo1(:,:,:,92:121);
% abr_tt=mean(abr_t,4);
% abr_ss=mean(abr_s,4);
% abr_uu=mean(abr_u,4);

%Mayo
may_t=temp1(:,:,:,122:152);
may_s=sal1(:,:,:,122:152);
may_u=uo1(:,:,:,122:152);
may_tt=mean(may_t,4);
may_ss=mean(may_s,4);
may_uu=mean(may_u,4);
% 
% %Junio
% jun_t=temp1(:,:,:,153:182);
% jun_s=sal1(:,:,:,153:182);
% jun_u=uo1(:,:,:,153:182);
% jun_tt=mean(jun_t,4);
% jun_ss=mean(jun_s,4);
% jun_uu=mean(jun_u,4);

%Julio
jul_t=temp1(:,:,:,183:213);
jul_s=sal1(:,:,:,183:213);
jul_u=uo1(:,:,:,183:213);
jul_tt=mean(jul_t,4);
jul_ss=mean(jul_s,4);
jul_uu=mean(jul_u,4);
% 
% %Agosto
% ago_t=temp1(:,:,:,214:244);
% ago_s=sal1(:,:,:,214:244);
% ago_u=uo1(:,:,:,214:244);
% ago_tt=mean(ago_t,4);
% ago_ss=mean(ago_s,4);
% ago_uu=mean(ago_u,4);
% 
% %Septiembre
% sep_t=temp1(:,:,:,245:274);
% sep_s=sal1(:,:,:,245:274);
% sep_u=uo1(:,:,:,245:274);
% sep_tt=mean(sep_t,4);
% sep_ss=mean(sep_s,4);
% sep_uu=mean(sep_u,4);
% 
% %Octubre
% oct_t=temp1(:,:,:,275:305);
% oct_s=sal1(:,:,:,275:305);
% oct_u=uo1(:,:,:,275:305);
% oct_tt=mean(oct_t,4);
% oct_ss=mean(oct_s,4);
% oct_uu=mean(oct_u,4);

%Noviembre
nov_t=temp1(:,:,:,306:335);
nov_s=sal1(:,:,:,306:335);
nov_u=uo1(:,:,:,306:335);
nov_tt=mean(nov_t,4);
nov_ss=mean(nov_s,4);
nov_uu=mean(nov_u,4);
% 
% %Diciembre
% dic_t=temp1(:,:,:,336:365);
% dic_s=sal1(:,:,:,336:365);
% dic_u=uo1(:,:,:,336:365);
% dic_tt=mean(dic_t,4);
% dic_ss=mean(dic_s,4);
% dic_uu=mean(dic_u,4);


%Promedio mensual de febrero,mayo,julio,noviembre 2021
% 
% %Enero
% ene_t2=temp2(:,:,:,2:32);
% ene_s2=sal2(:,:,:,2:32);
% ene_u2=uo2(:,:,:,2:32);
% ene_tt2=mean(ene_t2,4);
% ene_ss2=mean(ene_s2,4);
% ene_uu2=mean(ene_u2,4);

%Febrero
feb_t2=temp2(:,:,:,33:60);
feb_s2=sal2(:,:,:,33:60);
feb_u2=uo2(:,:,:,33:60);
feb_tt2=mean(feb_t2,4);
feb_ss2=mean(feb_s2,4);
feb_uu2=mean(feb_u2,4);
% 
% %Marzo
% mar_t2=temp2(:,:,:,61:91);
% mar_s2=sal2(:,:,:,61:91);
% mar_u2=uo2(:,:,:,61:91);
% mar_tt2=mean(mar_t2,4);
% mar_ss2=mean(mar_s2,4);
% mar_uu2=mean(mar_u2,4);
% 
% %Abril
% abr_t2=temp2(:,:,:,92:121);
% abr_s2=sal2(:,:,:,92:121);
% abr_u2=uo2(:,:,:,92:121);
% abr_tt2=mean(abr_t2,4);
% abr_ss2=mean(abr_s2,4);
% abr_uu2=mean(abr_u2,4);

%Mayo
may_t2=temp2(:,:,:,122:152);
may_s2=sal2(:,:,:,122:152);
may_u2=uo2(:,:,:,122:152);
may_tt2=mean(may_t2,4);
may_ss2=mean(may_s2,4);
may_uu2=mean(may_u2,4);
% 
% %Junio
% jun_t2=temp2(:,:,:,153:182);
% jun_s2=sal2(:,:,:,153:182);
% jun_u2=uo2(:,:,:,153:182);
% jun_tt2=mean(jun_t2,4);
% jun_ss2=mean(jun_s2,4);
% jun_uu2=mean(jun_u2,4);

%Julio
jul_t2=temp2(:,:,:,183:213);
jul_s2=sal2(:,:,:,183:213);
jul_u2=uo2(:,:,:,183:213);
jul_tt2=mean(jul_t2,4);
jul_ss2=mean(jul_s2,4);
jul_uu2=mean(jul_u2,4);
% 
% %Agosto
% ago_t2=temp2(:,:,:,214:244);
% ago_s2=sal2(:,:,:,214:244);
% ago_u2=uo2(:,:,:,214:244);
% ago_tt2=mean(ago_t2,4);
% ago_ss2=mean(ago_s2,4);
% ago_uu2=mean(ago_u2,4);
% 
% %Septiembre
% sep_t2=temp2(:,:,:,245:274);
% sep_s2=sal2(:,:,:,245:274);
% sep_u2=uo2(:,:,:,245:274);
% sep_tt2=mean(sep_t2,4);
% sep_ss2=mean(sep_s2,4);
% sep_uu2=mean(sep_u2,4);
% 
% %Octubre
% oct_t2=temp2(:,:,:,275:305);
% oct_s2=sal2(:,:,:,275:305);
% oct_u2=uo2(:,:,:,275:305);
% oct_tt2=mean(oct_t2,4);
% oct_ss2=mean(oct_s2,4);
% oct_uu2=mean(oct_u2,4);

%Noviembre
nov_t2=temp2(:,:,:,306:335);
nov_s2=sal2(:,:,:,306:335);
nov_u2=uo2(:,:,:,306:335);
nov_tt2=mean(nov_t2,4);
nov_ss2=mean(nov_s2,4);
nov_uu2=mean(nov_u2,4);
% 
% %Diciembre
% dic_t2=temp2(:,:,:,336:365);
% dic_s2=sal2(:,:,:,336:365);
% dic_u2=uo2(:,:,:,336:365);
% dic_tt2=mean(dic_t2,4);
% dic_ss2=mean(dic_s2,4);
% dic_uu2=mean(dic_u2,4);

%Seccion Boca del Guafo

%Año 2020
% 
% t_ene=squeeze(ene_tt(23,:,:));
% s_ene=squeeze(ene_ss(23,:,:));
% u_ene=squeeze(ene_uu(23,:,:));

t_feb=squeeze(feb_tt(23,:,:));
s_feb=squeeze(feb_ss(23,:,:));
u_feb=squeeze(feb_uu(23,:,:));
% 
% t_mar=squeeze(mar_tt(23,:,:));
% s_mar=squeeze(mar_ss(23,:,:));
% u_mar=squeeze(mar_uu(23,:,:));
% 
% t_abr=squeeze(abr_tt(23,:,:));
% s_abr=squeeze(abr_ss(23,:,:));
% u_abr=squeeze(abr_uu(23,:,:));

t_may=squeeze(may_tt(23,:,:));
s_may=squeeze(may_ss(23,:,:));
u_may=squeeze(may_uu(23,:,:));
% 
% t_jun=squeeze(jun_tt(23,:,:));
% s_jun=squeeze(jun_ss(23,:,:));
% u_jun=squeeze(jun_uu(23,:,:));

t_jul=squeeze(jul_tt(23,:,:));
s_jul=squeeze(jul_ss(23,:,:));
u_jul=squeeze(jul_uu(23,:,:));
% 
% t_ago=squeeze(ago_tt(23,:,:));
% s_ago=squeeze(ago_ss(23,:,:));
% u_ago=squeeze(ago_uu(23,:,:));
% 
% t_sep=squeeze(sep_tt(23,:,:));
% s_sep=squeeze(sep_ss(23,:,:));
% u_sep=squeeze(sep_uu(23,:,:));
% 
% t_oct=squeeze(oct_tt(23,:,:));
% s_oct=squeeze(oct_ss(23,:,:));
% u_oct=squeeze(oct_uu(23,:,:));

t_nov=squeeze(nov_tt(23,:,:));
s_nov=squeeze(nov_ss(23,:,:));
u_nov=squeeze(nov_uu(23,:,:));
% 
% t_dic=squeeze(dic_tt(23,:,:));
% s_dic=squeeze(dic_ss(23,:,:));
% u_dic=squeeze(dic_uu(23,:,:));

%Año 2021
% 
% t_ene2=squeeze(ene_tt2(23,:,:));
% s_ene2=squeeze(ene_ss2(23,:,:));
% u_ene2=squeeze(ene_uu2(23,:,:));

t_feb2=squeeze(feb_tt2(23,:,:));
s_feb2=squeeze(feb_ss2(23,:,:));
u_feb2=squeeze(feb_uu2(23,:,:));
% 
% t_mar2=squeeze(mar_tt2(23,:,:));
% s_mar2=squeeze(mar_ss2(23,:,:));
% u_mar2=squeeze(mar_uu2(23,:,:));
% 
% t_abr2=squeeze(abr_tt2(23,:,:));
% s_abr2=squeeze(abr_ss2(23,:,:));
% u_abr2=squeeze(abr_uu2(23,:,:));

t_may2=squeeze(may_tt2(23,:,:));
s_may2=squeeze(may_ss2(23,:,:));
u_may2=squeeze(may_uu2(23,:,:));
% 
% t_jun2=squeeze(jun_tt2(23,:,:));
% s_jun2=squeeze(jun_ss2(23,:,:));
% u_jun2=squeeze(jun_uu2(23,:,:));

t_jul2=squeeze(jul_tt2(23,:,:));
s_jul2=squeeze(jul_ss2(23,:,:));
u_jul2=squeeze(jul_uu2(23,:,:));
% 
% t_ago2=squeeze(ago_tt2(23,:,:));
% s_ago2=squeeze(ago_ss2(23,:,:));
% u_ago2=squeeze(ago_uu2(23,:,:));
% 
% t_sep2=squeeze(sep_tt2(23,:,:));
% s_sep2=squeeze(sep_ss2(23,:,:));
% u_sep2=squeeze(sep_uu2(23,:,:));
% 
% t_oct2=squeeze(oct_tt2(23,:,:));
% s_oct2=squeeze(oct_ss2(23,:,:));
% u_oct2=squeeze(oct_uu2(23,:,:));

t_nov2=squeeze(nov_tt2(23,:,:));
s_nov2=squeeze(nov_ss2(23,:,:));
u_nov2=squeeze(nov_uu2(23,:,:));
% 
% t_dic2=squeeze(dic_tt2(23,:,:));
% s_dic2=squeeze(dic_ss2(23,:,:));
% u_dic2=squeeze(dic_uu2(23,:,:));

%Transformar a Distancia las longitudes.
%Convertir de grados a km seccion 1
lat1=double(lat(15:21));
lon1=lon(23);
    
for i=1:length(lat1)-1
        DISTANCIA(i)=deg2km(distance(lat1(i),lon1,lat1(i+1),lon1));
       %DISTANCIA(i)=deg2km(distance(lon1(i),lat,lon1(i+1),lat));
end

DISTANCIA_ACUMULADA=cumsum(DISTANCIA);    
Dis=[0;DISTANCIA_ACUMULADA'];
Dis=flipud(Dis)

%% Graficos de temperatura
% 
% temp= colormap_cpt('TEMP.cpt');
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:27),t_ene(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_ene(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% xlim([0 58])
% ylim([0 230])
% caxis([5 17])
% box on
% sgtitle('Temperatura MERCATOR 2020 Boca del Gaufo','FontWeight','bold')
% 
% subplot(342)
% hold on
% pcolor(Dis,depth(1:27),t_feb(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_feb(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(343)
% hold on
% pcolor(Dis,depth(1:27),t_mar(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_mar(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(344)
% hold on
% pcolor(Dis,depth(1:27),t_abr(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_abr(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(345)
% hold on
% pcolor(Dis,depth(1:27),t_may(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_may(15:21,1:27)',[5:1:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(346)
% hold on
% pcolor(Dis,depth(1:27),t_jun(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_jun(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(347)
% hold on
% pcolor(Dis,depth(1:27),t_jul(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_jul(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% 
% subplot(348)
% hold on
% pcolor(Dis,depth(1:27),t_ago(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_ago(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(349)
% hold on
% pcolor(Dis,depth(1:27),t_sep(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_sep(15:21,1:27)',[5:0.4:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Septiembre','FontSize',12)
% xlabel('Distancia [km]')
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:27),t_oct(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_oct(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:27),t_nov(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_nov(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:27),t_dic(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_dic(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% h=colorbar;
% h.Title.String = "[°C]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
%Temperatura mercator 2021
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:27),t_ene2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_ene2(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% xlim([0 58])
% ylim([0 230])
% caxis([5 17])
% box on
% sgtitle('Temperatura MERCATOR 2021 Boca del Gaufo','FontWeight','bold')
% subplot(342)
% hold on
% pcolor(Dis,depth(1:27),t_feb2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_feb2(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:27),t_mar2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_mar2(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Marzo','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:27),t_abr2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_abr2(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:27),t_may2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_may2(15:21,1:27)',[5:1:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:27),t_jun2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_jun2(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:27),t_jul2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_jul2(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(348)
% hold on
% pcolor(Dis,depth(1:27),t_ago2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_ago2(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:27),t_sep2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_sep2(15:21,1:27)',[5:0.4:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Septiembre','FontSize',12)
% xlabel('Distancia [km]')
% ylabel('Profundidad [m]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:27),t_oct2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_oct2(15:21,1:27)',[5:0.5:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:27),t_nov2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_nov2(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:27),t_dic2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),t_dic2(15:21,1:27)',[5:2:17],...
%             '--w','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(temp)
% h=colorbar;
% h.Title.String = "[°C]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([6 16])
% xlim([0 58])
% ylim([0 230])
% box on


%% Salinidad Boca del Gufo
% 
% %Salinidad datos 2020
% sal= colormap_cpt('SAL.cpt');
% 
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:27),s_ene(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_ene(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% sgtitle('Salinidad MERCATOR 2020 40.5°S','FontWeight','bold')
% subplot(342)
% hold on
% pcolor(Dis,depth(1:27),s_feb(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_feb(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:27),s_mar(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_mar(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
% title('Marzo','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:27),s_abr(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_abr(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:27),s_may(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_may(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:27),s_jun(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_jun(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:27),s_jul(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_jul(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(348)
% hold on
% pcolor(Dis,depth(1:27),s_ago(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_ago(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:27),s_sep(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_sep(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Septiembre','FontSize',12)
% ylabel('Profundidad [m]')
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:27),s_oct(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_oct(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:27),s_nov(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_nov(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:27),s_dic(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_dic(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% h=colorbar;
% h.Title.String = "[PSU]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% 
% %Salinidad datos 2021
% 
% figure()
% subplot(341)
% hold on
% pcolor(Dis,depth(1:27),s_ene2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_ene2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title(' Enero','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% sgtitle('Salinidad MERCATOR 2021 Boca del Guafo','FontWeight','bold')
% subplot(342)
% hold on
% pcolor(Dis,depth(1:27),s_feb2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_feb2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Febrero','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(343)
% hold on
% pcolor(Dis,depth(1:27),s_mar2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_mar2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
% title('Marzo','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(344)
% hold on
% pcolor(Dis,depth(1:27),s_abr2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_abr2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Abril','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(345)
% hold on
% pcolor(Dis,depth(1:27),s_may2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_may2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Mayo','FontSize',12)
% ylabel('Profundidad [m]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(346)
% hold on
% pcolor(Dis,depth(1:27),s_jun2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_jun2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Junio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(347)
% hold on
% pcolor(Dis,depth(1:27),s_jul2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_jul2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Julio','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(348)
% hold on
% pcolor(Dis,depth(1:27),s_ago2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_ago2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Agosto','FontSize',12)
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(349)
% hold on
% pcolor(Dis,depth(1:27),s_sep2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_sep2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Septiembre','FontSize',12)
% ylabel('Profundidad [m]')
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,10)
% hold on
% pcolor(Dis,depth(1:27),s_oct2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_oct2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Octubre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,11)
% hold on
% pcolor(Dis,depth(1:27),s_nov2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_nov2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
% title('Noviembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on
% subplot(3,4,12)
% hold on
% pcolor(Dis,depth(1:27),s_dic2(15:21,1:27)')
% shading interp
% C = contour(Dis,depth(1:27),s_dic2(15:21,1:27)',[34.2:0.1:34.6],...
%             '--k','LineWidth',2);
% clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
% title('Diciembre','FontSize',12)
% xlabel('Distancia [km]')
% colormap(sal)
% h=colorbar;
% h.Title.String = "[PSU]";
% set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
% set(h,'FontSize',14);
% set(gca,'Ydir','reverse')
% set(gca,'TickDir','out')
% set(gca,'Fontsize',14)
% caxis([33.0 34.6])
% xlim([0 58])
% ylim([0 230])
% box on


%% Boca del Guafo Comparacion Mercator 2020-2021 

temp= colormap_cpt('TEMP.cpt');


figure()
subplot(241)
hold on
pcolor(Dis,depth(1:27),t_feb(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_feb(15:21,1:27)',[5:2:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Febrero 2020','FontSize',12)
ylabel('Profundidad [m]')
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
sgtitle('Temperatura MERCATOR  Boca del Gaufo','FontWeight','bold')
box on
subplot(242)
hold on
pcolor(Dis,depth(1:27),t_may(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_may(15:21,1:27)',[5:1:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Mayo 2020','FontSize',12)
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
box on
subplot(243)
hold on
pcolor(Dis,depth(1:27),t_jul(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_jul(15:21,1:27)',[5:0.5:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Julio 2020','FontSize',12)
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
box on
subplot(244)
hold on
pcolor(Dis,depth(1:27),t_nov(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_nov(15:21,1:27)',[5:2:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Noviembre 2020','FontSize',12)
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
box on
subplot(245)
hold on
pcolor(Dis,depth(1:27),t_feb2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_feb2(15:21,1:27)',[5:2:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Febrero 2021','FontSize',12)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
text(-1,262,'N','Fontsize',14,...
        'FontName','Courier','Color','k')
text(56,262,'S','Fontsize',14,...
        'FontName','Courier','Color','k') 
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
box on
subplot(246)
hold on
pcolor(Dis,depth(1:27),t_may2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_may2(15:21,1:27)',[5:1:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Mayo 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
box on
subplot(247)
hold on
pcolor(Dis,depth(1:27),t_jul2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_jul2(15:21,1:27)',[5:0.5:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Julio 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(temp)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
box on
subplot(248)
hold on
pcolor(Dis,depth(1:27),t_nov2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),t_nov2(15:21,1:27)',[5:2:17],...
            '--w','LineWidth',2);
clabel(C,'FontWeight','bold','Color','w','FontSize',12) 
title('Noviembre 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(temp)
h=colorbar;
h.Title.String = "[°C]";
set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([6 16])
xlim([0 58])
ylim([0 230])
box on

%Salinidad 

sal= colormap_cpt('SAL.cpt');

figure()
subplot(241)
hold on
pcolor(Dis,depth(1:27),s_feb(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_feb(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2020','FontSize',12)
ylabel('Profundidad [m]')
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
sgtitle('Salinidad MERCATOR Boca del Guafo','FontWeight','bold')
box on
subplot(242)
hold on
pcolor(Dis,depth(1:27),s_may(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_may(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2020','FontSize',12)
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
box on
subplot(243)
hold on
pcolor(Dis,depth(1:27),s_jul(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_jul(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Julio 2020','FontSize',12)
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
box on
subplot(244)
hold on
pcolor(Dis,depth(1:27),s_nov(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_nov(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2020','FontSize',12)
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
box on
subplot(245)
hold on
pcolor(Dis,depth(1:27),s_feb2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_feb2(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2021','FontSize',12)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
text(-1,262,'N','Fontsize',14,...
        'FontName','Courier','Color','k')
text(56,262,'S','Fontsize',14,...
        'FontName','Courier','Color','k') 
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
box on
subplot(246)
hold on
pcolor(Dis,depth(1:27),s_may2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_may2(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
box on
subplot(247)
hold on
pcolor(Dis,depth(1:27),s_jul2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_jul2(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Julio 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(sal)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
box on
subplot(248)
hold on
pcolor(Dis,depth(1:27),s_nov2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),s_nov2(15:21,1:27)',[34.2:0.1:34.6],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(sal)
h=colorbar;
h.Title.String = "[PSU]";
set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
set(h,'FontSize',14);
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([33.0 34.6])
xlim([0 58])
ylim([0 230])
box on

%Velocidad

vel= colormap_cpt('Balance.cpt');

figure()
subplot(241)
hold on
pcolor(Dis,depth(1:27),u_feb(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_feb(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2020','FontSize',12)
ylabel('Profundidad [m]')
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
axis tight
box on
sgtitle('Velocidad MERCATOR Boca del Guafo','FontWeight','bold')
subplot(242)
hold on
pcolor(Dis,depth(1:27),u_may(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_may(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2020','FontSize',12)
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
axis tight
box on
subplot(243)
hold on
pcolor(Dis,depth(1:27),u_jul(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_jul(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Julio 2020','FontSize',12)
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
axis tight
box on
subplot(244)
hold on
pcolor(Dis,depth(1:27),u_nov(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_nov(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2020','FontSize',12)
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
axis tight
box on
subplot(245)
hold on
pcolor(Dis,depth(1:27),u_feb2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_feb2(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Febrero 2021','FontSize',12)
xlabel('Distancia [km]')
ylabel('Profundidad [m]')
text(-1,262,'N','Fontsize',14,...
        'FontName','Courier','Color','k')
text(54,262,'S','Fontsize',14,...
        'FontName','Courier','Color','k') 
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
axis tight
box on
subplot(246)
hold on
pcolor(Dis,depth(1:27),u_may2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_may2(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Mayo 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(247)
hold on
pcolor(Dis,depth(1:27),u_jul2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_jul2(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12)  
title('Julio 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(vel)
set(gca,'Ydir','reverse')
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on
subplot(248)
hold on
pcolor(Dis,depth(1:27),u_nov2(15:21,1:27)')
shading interp
C = contour(Dis,depth(1:27),u_nov2(15:21,1:27)',[-0.1,-0.05,0,0.05,0.1],...
            '--k','LineWidth',2);
clabel(C,'FontWeight','bold','Color','k','FontSize',12) 
title('Noviembre 2021','FontSize',12)
xlabel('Distancia [km]')
colormap(vel)
set(gca,'Ydir','reverse')
h=colorbar;
h.Title.String = "[m/s]";
set(h,'Position',[0.921 0.1 0.015 0.810])% To change size
set(h,'FontSize',14);
set(gca,'TickDir','out')
set(gca,'Fontsize',14)
caxis([-0.4 0.4])
box on


