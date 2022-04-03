#!/bin/bash

# silencing matplotlib warning
MPLCONFIGDIR="/tmp"
export MPLCONFIGDIR

python3 -m crumbs.get_gbif \
      --species "Heteronotia binoei" \
      --points sampling-points.shp \
      #--limit 30 \
      --all \
      #--year "1950,2022" \
      --margin 2.0 \
      --output occurrences.shp

mkdir occurrences
mv occurrences.* occurrences/
