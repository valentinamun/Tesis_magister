#!/usr/bin/env python

import os
import opendrift
from opendrift.readers import reader_netCDF_CF_generic
from opendrift.models.oceandrift import OceanDrift
import numpy as np
from opendrift.readers import reader_ROMS_native
import os.path
from datetime import datetime, timedelta
import glob

# Objeto
#os.chdir("/data2/matlab/MOSA_BGQ/")
o = OceanDrift(loglevel=0)
filename_nc = 'mosa_VM_dic_y1_M1_ene_Y2_M2.nc';
mosa_native = reader_ROMS_native.Reader(filename_nc)
o.add_reader([mosa_native])

o.set_config('general:coastline_action', 'previous')

# Seeding some particles
ini_time = mosa_native.end_time;

lon = []
lat = []
z   = []

for filename in glob.glob('vert_section_BGuafo.txt'):
          print(filename)
          with open(filename, 'r') as f:
             lines = f.readlines()
          for line in lines:
                  line_split = line.split()
                  lon.append(float(line_split[0]))
                  lat.append(float(line_split[1]))
                  z.append(float(line_split[2]))
                  f.close()


###lon = np.linspace(-74, -74, 10000); 
###lat = np.linspace(-43.8, -43.26,10000); 
#Profundidad de liberacion de particula
###np.random.seed(0); #las profundidades "random" son siempre las misma
###z = -(np.random.rand(10000)*200);

#o.disable_vertical_motion()
o.vertical_advection()

o.set_config('general:seafloor_action','deactivate') # previous, or lift_to_seafloor, or deactivate
o.set_config('general:use_auto_landmask', True)

for i in range(1,122):  # 5 days
   o.seed_elements(lon, lat, z=z, number=4893, time=(ini_time-timedelta(hours=i)))
#   o.seed_elements(lon, lat, z=z, number=10000, time=(time-timedelta(seconds=i*3600)))

# 30240 = 35 days
o.run(steps=30240, time_step=-100, time_step_output=3600, outfile='mosa_VM_1mes_horario_back_AS_D1-5.nc')

#
# Print and plot results
#
#o.plot(buffer=.2, fast=True, linecolor = 'z',filename='mosa_VM_2meses_horario_AS.png')
#o.animation(filename="/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_sup_VM_100000.mp4",linecolor="z",fast = True)

