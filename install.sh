#!/usr/bin/bash

build_path=$1
install_path=$2
vscode_version=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] VSCODE VERSION: ${vscode_version}"

cd $build_path

# We finally install VSCode
echo -e "\n"
echo -e "[INSTALL] Installing VSCode-${vscode_version}..."

# We copy the necessary files to the install directory
cp -R ./* $install_path

echo -e "[INSTALL] Finished installing VSCode-${vscode_version}!"
echo -e "\n"
