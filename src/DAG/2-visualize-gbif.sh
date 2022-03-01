#!/bin/bash

python3 -m crumbs.get_chelsa \
      --points sampling-points.shp \
      --variables "dem" \
      --timesID "20" \
      --margin 2.0 \
      --geotiff dem.tif

python3 -m crumbs.animate dem.tif \
      --gbif 1-gbif-occurrences/occurrences.shp \
      --no-DDD \
      --output occurrences.gif
