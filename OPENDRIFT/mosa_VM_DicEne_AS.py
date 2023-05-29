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

#o.disable_vertical_motion()
o.vertical_advection()

o.set_config('general:seafloor_action','previous') # previous, or lift_to_seafloor, or deactivate
o.set_config('general:use_auto_landmask', True)
o.set_config('drift:max_age_seconds',2592000) # 30 days

#for i in range(1,121):     #  27-31 Enero
#for i in range(121,241):  #  22-26 Enero
#for i in range(241,361):  #  17-21 Enero 
#for i in range(361,481):  #  12-16 Enero
#for i in range(481,601):  #  07-11 Enero
for i in range(601,745):  #  01-06 Enero

  o.seed_elements(lon, lat, z=z, number=4893, time=(ini_time-timedelta(hours=i)))

#o.run(steps=10080, time_step=-300, time_step_output=3600, outfile='mosa_VM_1mes_horario_back_AS_27-31Enero.nc')  # 27-31 Ene
#o.run(steps=10080, time_step=-300, time_step_output=3600, outfile='mosa_VM_1mes_horario_back_AS_22-26Enero.nc')  # 22-26 Ene
#o.run(steps=10080, time_step=-300, time_step_output=3600, outfile='mosa_VM_1mes_horario_back_AS_17-21Enero.nc')  # 17-21 Ene
#o.run(steps=10080, time_step=-300, time_step_output=3600, outfile='mosa_VM_1mes_horario_back_AS_12-16Enero.nc')  # 12-16 Ene
#o.run(steps=10080, time_step=-300, time_step_output=3600, outfile='mosa_VM_1mes_horario_back_AS_07-11Enero.nc')  # 07-11 Ene
o.run(steps=10080, time_step=-300, time_step_output=3600, outfile='mosa_VM_1mes_horario_back_AS_01-06Enero.nc')  # 01-06 Ene



