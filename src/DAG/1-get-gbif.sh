#!/bin/bash

# silencing matplotlib warning
MPLCONFIGDIR="/tmp"
export MPLCONFIGDIR

python3 -m crumbs.get_gbif \
      --species "Heteronotia binoei" \
      --points sampling-points.shp \
      --all \
      --year "1900,2022" \
      --margin 2.0 \
      --output occurrences.shp

mkdir occurrences
mv occurrences.* occurrences/
