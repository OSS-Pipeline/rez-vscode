#!/usr/bin/bash

EXTRACT_PATH=$1
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
VSCODE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${EXTRACT_PATH}"
echo -e "[INSTALL][ARGS] VSCODE VERSION: ${VSCODE_VERSION}"

cd ${EXTRACT_PATH}

# We finally install VSCode
echo -e "\n"
echo -e "[INSTALL] Installing VSCode-${VSCODE_VERSION}..."

# We copy the necessary files to the install directory
cp -R ./* ${INSTALL_PATH}

echo -e "[INSTALL] Finished installing VSCode-${VSCODE_VERSION}!"
echo -e "\n"
