
import os
import opendrift
from opendrift.readers import reader_netCDF_CF_generic
from opendrift.models.oceandrift import OceanDrift
import numpy as np
from opendrift.readers import reader_ROMS_native
import os.path
import matplotlib.pyplot as plt
from datetime import datetime, timedelta

# Objeto
os.chdir("/data2/matlab/MOSA_BGQ/")
o = OceanDrift(loglevel=0)
filename_nc = 'mosa_BGQ_avg_VM_M1_HM.nc';
mosa_native = reader_ROMS_native.Reader(filename_nc)
o.add_reader([mosa_native])

o.set_config('general:coastline_action', 'previous')

# Seeding some particles
time = mosa_native.end_time;
lon = np.linspace(-74, -74, 1000); 
lat = np.linspace(-43.8, -43.26,1000); 
#Profundidad de liberacion de particula
np.random.seed(0); #las profundidades "random" son siempre las misma
z = -(np.random.rand(1000)*200);

##plt.hist(z)
##plt.show()

for i in range(1,25):
  ini_time=time-timedelta(hours=i)
  o.seed_elements(lon, lat, z=z, number=1000, time=ini_time)
#o.disable_vertical_motion()
o.vertical_advection()

o.set_config('general:seafloor_action','deactivate')

#o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='back_opendrift.nc')
o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='/data2/matlab/MOSA_BGQ/casoraro_tides_10000_0-200_siVA_1000x24h.nc')

#%%
# Print and plot results
# print(o)
o.plot(buffer=.2, fast=True, linecolor = 'z',filename='/data2/matlab/MOSA_BGQ/casoraro_tides_10000_0-200_siVA_1000x24h.png')
#o.animation(filename="/data2/matlab/MOSA_BGQ/Valentina/mosa_opendrift_sup_VM_100000.mp4",linecolor="z",fast = True)
