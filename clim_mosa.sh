#!/bin/bash

#Concatenar variables separadas por semestres 

for x in {4..9}

do

ncrcat Odette_fisica_Y${x}S1.nc  Odette_fisica_Y${x}S2.nc mosa_0${x}.nc

done

#Concatenar en una sola variable del año 4 al año 9 de simulacion

ncrcat mosa_0?.nc mosa_4-9.nc


#Climatologia

for k in {1..9}
do

ncra -F -d time,${k},72,12 mosa_4-9.nc clim_4-9_0${k}.nc

done

for k in {10..12}
do

ncra -F -d time,${k},72,12 mosa_4-9.nc clim_4-9_${k}.nc

done

ncrcat clim_4-9_??.nc clim_fisic_mosa_4-9.nc
