#!/bin/bash

#Correccion de la variable tiempo

for x in {0..9}

do

ncks --mk_rec_dmn time data_200${x}.nc data200${x}a.nc

done

for x in {10..11}

do

ncks --mk_rec_dmn time data_20${x}.nc data20${x}a.nc

done

#Descomprimir archivos

for j in {0..9}

do

ncpdq -U data200${j}a.nc data200${j}b.nc

done

for j in {10..11}

do

ncpdq -U data20${j}a.nc data20${j}b.nc

done


#Concatenar variables

ncrcat data20??b.nc data2000-2011.nc


#Climatologia

ncra -F -d time,1,144,12 data2000-2011.nc clim_2000-2011.nc
