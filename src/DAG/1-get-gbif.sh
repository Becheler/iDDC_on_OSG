#!/bin/bash

python3 -m crumbs.get_gbif \
      --species "Heteronotia binoei" \
      --points sampling-points/sampling-points.shp \
      --limit 30 \
      --year "1950,2022" \
      --margin 2.0 \
      --output occurrences.shp

mkdir occurrences
mv occurrences.* occurrences/
