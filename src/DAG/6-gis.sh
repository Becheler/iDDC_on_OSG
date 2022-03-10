#!/bin/bash

chelsaTimes=$1
generations=$chelsaTimes

# remap chelsa times to year before present
for i in "${#generations[@]}"
do
    generations[i]=$((20*100-generations[i]*100))
done

# From space delimited to comma separated
generations=${generations// /,}

python3 -m crumbs.interpolate suitability.tif --timesID $generations -o 6a-interpolated.tif
python3 -m crumbs.animate 6a-suitability-interpolated.tif -o 6a-suitability-interpolated.gif

python3 -m crumbs.circle_mask 6a-suitability-interpolated.tif -o 6b-suitability-circular.tif
python3 -m crumbs.animate 6b-suitability-circular.tif -o 6b-suitability-circular.gif
