#!/bin/bash

# Defining a small function in case of error
echoerr() { echo "$@" 1>&2; }

OUTPUT_DIRECTORY=$1

# Check output directory exists, or create it
if [ ! -d "$OUTPUT_DIRECTORY" ]; then
  echo "PRE script: $OUTPUT_DIRECTORY does not exist, creating directory ..."
  mkdir $OUTPUT_DIRECTORY
fi
