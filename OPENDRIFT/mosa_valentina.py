

#!/usr/bin/env python
"""
Back and forth
==============
"""


import os
import opendrift
from opendrift.readers import reader_netCDF_CF_generic
from opendrift.models.oceandrift import OceanDrift
import numpy as np
from opendrift.readers import reader_ROMS_native
import os.path

# Objeto
os.chdir("/data2/matlab/MOSA_BGQ/")
o = OceanDrift(loglevel=0)
filename_nc = 'mosa_BGQ_avg_VM_M1_HM.nc';
mosa_native = reader_ROMS_native.Reader(filename_nc)
o.add_reader([mosa_native])

o.set_config('general:coastline_action', 'previous')

# Seeding some particles
time = mosa_native.end_time;
lon = np.linspace(-74, -74, 10000); 
lat = np.linspace(-43.8, -43.26, 10000);  
z = -(np.random.rand(10000)*150 + 50);
o.seed_elements(lon, lat, z=z, number=10000, time=time)
o.disable_vertical_motion()

#o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='back_opendrift.nc')
o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_VM_10000.nc')

#%%
# Print and plot results
# print(o)
o.plot(buffer=.2, fast=True, linecolor = 'z',filename='/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_VM_10000.png')
o.animation(filename="/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_VM_10000.mp4",linecolor="z",fast = True)

