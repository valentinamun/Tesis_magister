#!/bin/bash

#ncks -v u mosa_BGQ_avg_VM_Y1_M3_HM.nc u_Y1_M3.nc 

ncks -d eta_rho,357,389 -d xi_u,246,246 u_Y1_M3.nc u_Y1_M3_guafo.nc
