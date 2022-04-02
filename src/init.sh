#!/bin/bash

chmod u+x ../src/DAG/generate_DAG.sh
chmod u+x ../src/DAG/3-pre-script.sh
chmod u+x ../src/DAG/3-post-script.sh

ln -s src/DAG/generate_DAG.sh generate_DAG

mkdir output-files

#./../generate_DAG 10 2 $(seq -s ' ' -1 1 20) > flow.dag

ln -s src/post-analysis/get_param_table.sh get_param_table
ln -s src/post-analysis/get_sumstats.sh get_sumstats
