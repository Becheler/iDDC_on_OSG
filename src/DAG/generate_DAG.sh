#!/bin/bash

############################################################
# Help                                                     #
############################################################
dislay_help()
{
   # Display Help
   echo "Generates a DAGMan workflow to organize the iDDC multiple jobs into a single workflow."
   echo
   echo "Syntax: scriptTemplate [-h|]"
   echo "positional parameters:"
   echo "<integer>   The number of demogenetic simulations."
   echo "<integer>   The number of repetitions if simulation failed."
   echo "options:"
   echo "h     Print this Help."
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

if [ "$1" == "-h" ]; then
  dislay_help
  exit 0
fi


echo "JOB GBIF src/DAG/1-get-gbif.condor DIR output"
echo "JOB SDM src/DAG/2-sdm.condor DIR output"
echo "PARENT GBIF CHILD SDM"

for i in $(seq "$1")
do
   echo "JOB A$i ../src/DAG/A.condor NOOP"
   echo "VARS A$i i=\"$i\""
   echo "PARENT SDM CHILD A$i"

   echo "Retry A$i $2"

   echo "JOB B$i ../src/DAG/B.condor NOOP"
   echo "VARS B$i i=\"$i\""
   echo "PARENT A$i CHILD B$i"

done
