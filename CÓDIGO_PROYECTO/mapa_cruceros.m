
%Estaciones primavera mes octubre, noviembre
clear all
close all
clc
load('e1.mat')

%Posicion de las estaciones
 e111=[e1(1,1) e1(1,2)];
 e2=[e1(2,1) e1(2,2)];
 e3=[e1(3,1) e1(3,2)];
 e4=[e1(4,1) e1(4,2)];
 e5=[e1(5,1) e1(5,2)];
 e6=[e1(6,1) e1(6,2)];
 e7=[e1(7,1) e1(7,2)];
 e8=[e1(8,1) e1(8,2)];
 e9=[e1(9,1) e1(9,2)];
 e10=[e1(10,1) e1(10,2)];
 e11=[e1(11,1) e1(11,2)];
 e12=[e1(12,1) e1(12,2)];
 e13=[e1(13,1) e1(13,2)];
 e14=[e1(14,1) e1(14,2)];
 e15=[e1(15,1) e1(15,2)];
 e16=[e1(16,1) e1(16,2)];
 e17=[e1(17,1) e1(17,2)];
 e18=[e1(18,1) e1(18,2)];
 e19=[e1(19,1) e1(19,2)];

figure('Position',[969,93,579,807])
 m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
 m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Estaciones de Primavera')
 hold on
 l= colorbar 
 colormap(m_colmap('blues')); 
 ylabel(l,'Profundidad [m]','fontsize',15)
 set(gca, 'FontSize', 17)
m_line(e111(2),e111(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e2(2),e2(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e3(2),e3(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e4(2),e4(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e5(2),e5(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e6(2),e6(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e7(2),e7(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e8(2),e8(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e9(2),e9(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e10(2),e10(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e11(2),e11(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e12(2),e12(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e13(2),e13(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e14(2),e14(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e15(2),e15(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e16(2),e16(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e17(2),e17(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e18(2),e18(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
m_line(e19(2),e19(1),'marker','o','color','k','markerfacecolor','r','markersize',8);

%% Estacion de verano, febrero

load('e2.mat');

e1=[e2(1,1) e2(1,2)]         
e22=[e2(2,1) e2(2,2)];
e3=[e2(3,1) e2(3,2)];
e4=[e2(4,1) e2(4,2)];
e5=[e2(5,1) e2(5,2)];


figure('Position',[969,93,579,807])
 m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
 m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Estaciones de Verano')
 hold on
 l= colorbar 
 colormap(m_colmap('blues')); 
 ylabel(l,'Profundidad [m]','fontsize',15)
 set(gca, 'FontSize', 17)
 m_line(e1(2),e1(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e22(2),e22(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e3(2),e3(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e4(2),e4(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e5(2),e5(1),'marker','o','color','k','markerfacecolor','r','markersize',8);

%% Estacion  invierno
clear all
close all

load('e3.mat')

e1=[e3(1,1)  e3(1,2)];
e2=[e3(2,1)  e3(2,2)];
e33=[e3(3,1) e3(3,2)];
e4=[e3(4,1)  e3(4,2)];
e5=[e3(5,1)  e3(5,2)];
e6=[e3(6,1)  e3(6,2)];
e7=[e3(7,1)  e3(7,2)];
e8=[e3(8,1)  e3(8,2)];


figure('Position',[969,93,579,807])
 m_proj('miller','lon',[-76 -72],'lat',[-46 -38.99])
 m_etopo2('contourf',[-6000:10:0 -6000 10 0 ],'edgecolor','none');
 m_gshhs_f('patch',[0.9 0.9 0.9]);    % Coastline...
 m_gshhs_f('speckle','color','k');    % with speckle added
 m_grid('linewi',2,'linest','none','tickdir','out','fontsize',12);
 xlabel('Longitud','FontSize',16)
 ylabel('Latitud','FontSize',16)
 title('Estaciones Invierno')
 hold on
 l= colorbar 
 colormap(m_colmap('blues')); 
 ylabel(l,'Profundidad [m]','fontsize',15)
 set(gca, 'FontSize', 17)
 m_line(e1(2),e1(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e2(2),e2(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e33(2),e33(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e4(2),e4(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e5(2),e5(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e6(2),e6(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e7(2),e7(1),'marker','o','color','k','markerfacecolor','r','markersize',8);
 m_line(e8(2),e8(1),'marker','o','color','k','markerfacecolor','r','markersize',8);



 