#!/bin/bash

python3 -m crumbs.sdm \
      --presence 1-gbif-occurrences/occurrences.shp \
      --variables dem,bio \
      --background 2000 \
      --times $1 \
      --margin 2.0 \
      --cleanup \
      --clip_dir 3-get-chelsa \
      --output suitability.tif
