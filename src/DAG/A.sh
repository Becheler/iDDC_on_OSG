#!/bin/bash

# prior sampling
N=$(python3 -m crumbs.sample "uniform_integer" 10 1000000)
K=$(python3 -m crumbs.sample "uniform_integer" 10 1000000)
r=$(python3 -m crumbs.sample "uniform_real" 1 100)
m=$(python3 -m crumbs.sample "uniform_real" 0.0 1.0)
g=$(python3 -m crumbs.sample "uniform_integer" 1000 5000)
p=$(python3 -m crumbs.sample "uniform_real" 0.0 1.0)
latlon=($(python3 -m crumbs.sample "uniform_latlon" "suitability.tif" | tr -d '[],'))

angle=$(python3 -m crumbs.sample "uniform_real" 0.0 360.0)
factor=$(python3 -m crumbs.sample "uniform_real" 0.01 0.99)

python3 -m crumbs.resample 6b-suitability-circular.tif $angle $factor -o suitability-rotated-resampled.tif
python3 -m crumbs.animate suitability-rotated-resampled.tif -o suitability-rotated-resampled.gif

# simulation
/usr/local/quetzal-EGGS/EGG1 \
--config "EGG1.conf" \
--tips "sample.csv" \
--suitability "suitability-rotated-resampled.tif" \
--output "output.db" \
--reuse 10 \
--n_loci 1 \
--lat_0 ${latlon[0]} \
--lon_0 ${latlon[1]} \
--N_0 $N \
--duration $g \
--K_suit $K \
--K_min 0 \
--K_max 1 \
--p_K $p \
--r $r \
--emigrant_rate $m
