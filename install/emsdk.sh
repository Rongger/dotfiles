#!/bin/bash

source ./functions/common.sh
source ./functions/common.sh

install_if_pkg_no_exist cmake
install_if_pkg_no_exist python3
install_if_pkg_no_exist git

# mkdir_force ~/lib

# if [ ! -d ~/lib/emsdk ]; then
#   cd ~/lib
#   # Get the emsdk repo
#   git clone https://github.com/emscripten-core/emsdk.git

#   # Enter that directory
#   cd emsdk

#   # Download and install the latest SDK tools.
#   ./emsdk install latest

#   # Make the "latest" SDK "active" for the current user. (writes .emscripten file)
#   ./emsdk activate latest

#   # Activate PATH and other environment variables in the current terminal
#   source ./emsdk_env.sh

#   echo '👌 Emsdk install done'
# else
#   source ~/lib/emsdk/emsdk_env.sh
#   echo '👽 Emsdk has existed'
# fi
