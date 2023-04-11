#!/usr/bin/

import os
import opendrift
from opendrift.readers import reader_netCDF_CF_generic
from opendrift.models.oceandrift import OceanDrift
import numpy as np
from opendrift.readers import reader_ROMS_native
import os.path
from datetime import datetime, timedelta
import glob



o = opendrift.open("mosa_VM_1mes_horario_back_AS_27-31Enero.nc",elements=np.arange(0,587160,500))
o.plot(buffer=.2, vmin=-200, vmax=0, linecolor = 'z', fast=True, filename='/data3/matlab/Valentina/prueba.png')
#o.animation(filename="/data3/matlab/Valentina/prueba.mp4",linecolor="z",fast = True)

