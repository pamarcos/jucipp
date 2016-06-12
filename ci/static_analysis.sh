#!/bin/bash

if [ "${make_command}" == "" ]; then
  make_command="make -j 2"
fi

if [ "${cmake_command}" == "" ]; then
  cmake_command="cmake .."
fi

mkdir -p jucipp/build || exit
cd jucipp/build || exit
sh -c "scan-build -o ../html_${distribution} --status-bugs ${cmake_command}"
exec sh -c "scan-build -o ../html_${distribution} --status-bugs ${make_command}"
