#!/bin/bash

# ./MonteCarlo_poissonV2 repeat theta drift-velocity dy savename

#./MonteCarlo_poissonV2 10000 30 0.043 0.4 TF_th30_Vd100_dy04.root
#sleep 2m
#./MonteCarlo_poissonV2 10000 30 0.044 0.4 TF_th30_Vd300_dy04.root
#sleep 2m

./MonteCarlo_poissonV2 10000 30 0.040 0.0 TF_th30_Vd500_dy00.root
sleep 2m
./MonteCarlo_poissonV2 10000 30 0.040 0.1 TF_th30_Vd500_dy01.root
sleep 2m
./MonteCarlo_poissonV2 10000 30 0.040 0.2 TF_th30_Vd500_dy02.root
sleep 2m
./MonteCarlo_poissonV2 10000 30 0.040 0.3 TF_th30_Vd500_dy03.root
sleep 2m
./MonteCarlo_poissonV2 10000 30 0.040 0.4 TF_th30_Vd500_dy04.root

echo "FInish!!!"
