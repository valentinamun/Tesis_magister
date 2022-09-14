#!/bin/bash


#Correccion de la variable tiempo

for x in {0..9}

do

ncks --mk_rec_dmn time bio_200${x}.nc bio200${x}a.nc

done

for x in {10..11}

do

ncks --mk_rec_dmn time bio_20${x}.nc bio20${x}a.nc

done

#Descomprimir archivos

for j in {0..9}

do

ncpdq -U bio200${j}a.nc bio200${j}b.nc

done

for j in {10..11}

do

ncpdq -U bio20${j}a.nc bio20${j}b.nc

done


#Concatenar variables

ncrcat bio20??b.nc bio2000-2011.nc

#Climatologia

for k in {1..9}
do

ncra -F -d time,${k},144,12 bio2000-2011.nc clim_2000-2011_0${k}.nc

done

for k in {10..12}
do

ncra -F -d time,${k},144,12 bio2000-2011.nc clim_2000-2011_${k}.nc

done


ncrcat clim_2000-2011_??.nc clim_bio_2000-20011.nc

