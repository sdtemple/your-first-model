#!/bin/bash
folder=$1
pfile=$2
afile=$3
notebook=$4
notebook_out=$5
papermill -p input_folder $folder \
    -p params_file $pfile \
    -p audiomentations_file $afile \
    $notebook \
    $notebook_out