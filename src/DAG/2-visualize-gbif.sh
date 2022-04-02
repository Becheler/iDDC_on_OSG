#!/bin/bash

python3 -m crumbs.get_chelsa \
      --points sampling-points.shp \
      --variables "dem" \
      --timesID "20" \
      --margin 2.0

python3 -m crumbs.animate chelsa_stack_dem.tif \
      --gbif occurrences.shp \
      --no-DDD \
      --output occurrences.gif
