
#!/bin/bash

ncks -v u mosa_BGQ_avg_VM_Y1_M3_HM.nc u_Y1_M3.nc
ncks -v v mosa_BGQ_avg_VM_Y1_M3_HM.nc v_Y1_M3.nc

ncks -F -d time,1,3 u_Y1_M3.nc u_15_mar.nc
ncks -F -d time,1,3 v_Y1_M3.nc v_15_mar.nc
