CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(vscode_version 1.x.x)

# VSCode
rez_set_archive(
    # This is a relative path from the ${REZ_REPO_PAYLOAD_DIR} environment variable,
    # that is pointing to the root directory where we can find all the archives of the package
    # we can build, using the following hierarchy:
    # "${REZ_REPO_PAYLOAD_DIR}/project_name/archive.what.ever"
    vscode_url vscode/code-stable-1568209119.tar.gz
    https://go.microsoft.com/fwlink/?LinkID=620884
)

# The environment variable REZ_TMP_PATH is meant to point to a location such as "/tmp/rez".
set(EXTRACT_DIR $ENV{REZ_TMP_PATH}/vscode/${vscode_version})
set(BUILD_DIR ${EXTRACT_DIR}/build)

# We configure/build/install VSCode through the ExternalProject_Add macro,
# using three different shell scripts for each of these steps.
# If necessary, it is possible to skip one of these steps by replacing the command
# by "", an empty string.
ExternalProject_Add(
    build_vscode
    URL ${vscode_url}
    PREFIX vscode
    SOURCE_DIR ${EXTRACT_DIR}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND bash ${CMAKE_SOURCE_DIR}/install.sh ${EXTRACT_DIR} ${CMAKE_INSTALL_PREFIX} ${vscode_version}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] VSCode-${vscode_version} PACKAGE SETUP FINISHED!\n\"
    )"
)
