#!/bin/bash

OUTPUT_DIRECTORY=$1

echo "POST script: moving tif files to directory $OUTPUT_DIRECTORY ..."

# Silencing "no such file or directory" and return normally
mv *tif $OUTPUT_DIRECTORY 2>/dev/null || true
