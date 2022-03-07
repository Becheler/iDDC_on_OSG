#!/bin/bash

python3 -m crumbs.get_chelsa \
      --points sampling-points.shp \
      --variables dem,bio \
      --timesID $1 \
      --margin 2.0 \
      --clip_dir 3-get-chelsa \
      --cleanup
