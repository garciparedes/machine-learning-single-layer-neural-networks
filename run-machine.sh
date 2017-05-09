#! /bin/bash

CALLING_PATH=`pwd -P`
SCRIPT_PATH="`dirname \"$0\"`"
SRC_PATH=${SCRIPT_PATH}/src
MAIN_SCRIPT="./main.sh"

echo '--------------------------------------------------------------------------------'
echo 'Title: Adaline of 5000 seasons and 0.1 alpha learning rate over Machine Dataset'
echo 'Author: Sergio García Prado (garciparedes.me)'
echo 'Author: Óscar Fernández Angulo'
echo '--------------------------------------------------------------------------------'
cd ${SRC_PATH}
  octave Machine.m --no-gui
cd ${CALLING_PATH}
echo '--------------------------------------------------------------------------------'
