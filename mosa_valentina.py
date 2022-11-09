

#!/usr/bin/env python
"""
Back and forth
==============
"""

#Agregar paquetes de lectura
import os
import opendrift
from opendrift.readers import reader_netCDF_CF_generic
from opendrift.models.oceandrift import OceanDrift
import numpy as np
from opendrift.readers import reader_ROMS_native
import os.path
from datetime import datetime, timedelta

#Cargar simualción y directorio
os.chdir("/data2/matlab/MOSA_BGQ/")
o = OceanDrift(loglevel=0)
filename_nc = 'mosa_BGQ_avg_VM_M1_HM.nc';
mosa_native = reader_ROMS_native.Reader(filename_nc)
o.add_reader([mosa_native])

#Que ocurre con la perticula al llegar a la costa
#previus: mantiene la partı́cula en la costa hasta que se muevan mar adentro en un momento posterior.
o.set_config('general:coastline_action', 'previous')

#Posicion inicial, tiempo inicial y profundidad de liberación
time = mosa_native.end_time;
lon = np.linspace(-74, -74, 10000); 
lat = np.linspace(-43.8, -43.26, 10000);  
z = -(np.random.rand(10000)*150 + 50);

#Rango de liberación de particulas 
for i in range(1,25):
    ini_date=time-timedelta(hours=i)
    o.seed_elements(lon, lat, z=z, number=10000, time=ini_time)
##    o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_VM_.nc')

o.disable_vertical_motion()

#Lanzar simulación
#o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='back_opendrift.nc')
o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_VM_240000.nc')

#%%
# Graficar y guardar resultados
# print(o)
o.plot(buffer=.2, fast=True, linecolor = 'z',filename='/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_VM_10000.png')
o.animation(filename="/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_VM_10000.mp4",linecolor="z",fast = True)

