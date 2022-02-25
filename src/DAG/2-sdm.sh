#!/bin/bash

python3 -m crumbs.sdm \
      --points occurrences.shp \
      --variables bio \
      --background 2000 \
      --times $(seq -s ',' -50 1 20) \
      --margin 2.0 \
      --cleanup \
      --output suitability.tif

python3 -m crumbs.animate suitability.tif \
      --output suitability.gif

mkdir 2-sdm-output
mv suitability.* /2-sdm-output
