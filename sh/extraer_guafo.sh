#!/bin/bash

#Extraer seccion de la Boca del Guafo de la componente U de la velocidad
#i=246,j=357 a i=246, j=389

#ncks -v u mosa_BGQ_avg_VM_Y1_M3_HM.nc mosa_BGQ_u_Y1_M3.nc 

#ncks -d eta_rho,357,389 -d xi_u,246,246 mosa_BGQ_u_Y1_M3.nc u_Y1_M3_guafo.nc

#Extraer seccion de la Boca del Guafo de h en la grilla del modelo

#ncks -v h mosa_BGQ_grd.nc mosa_BGQ_h.nc 
#ncks -d eta_rho,357,389 -d xi_rho,246,246 mosa_BGQ_h.nc mosa_BGQ_h_guafo.nc

#Extraer las latitudes de la seccion de la Boca del Guafo

#ncks -v lat_rho mosa_BGQ_avg_VM_Y1_M3_HM.nc mosa_BGQ_lat_Y1_M3.nc
ncks -d eta_rho,357,389 -d xi_rho,246,246 mosa_BGQ_lat_Y1_M3.nc mosa_BGQ_lat_guafo.nc

