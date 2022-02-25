#!/bin/bash

python3 -m crumbs.get_gbif \
      --species "Heteronotia binoei" \
      --points input-files/sampling-points.shp \
      --all \
      --year "1950,2022" \
      --margin 2.0 \
      --output occurrences.shp

python3 -m crumbs.get_chelsa \
      --points input-files/sampling_points.shp \
      --variables "dem" \
      --timesID "20" \
      --margin 2.0 \
      --geotiff dem.tif

python3 -m crumbs.animate dem.tif \
      --gbif occurrences.shp \
      --DDD \
      --warp-scale 0.1 \
      --output occurrences.gif

mkdir 1-get-gbif-output
mv occurrences.* 1-get-gbif-output/
