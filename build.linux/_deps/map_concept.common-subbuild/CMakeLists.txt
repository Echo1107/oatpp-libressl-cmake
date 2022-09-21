# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.22.1)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(map_concept.common-populate NONE)


# Pass through things we've already detected in the main project to avoid
# paying the cost of redetecting them again in ExternalProject_Add()
set(GIT_EXECUTABLE [==[/usr/bin/git]==])
set(GIT_VERSION_STRING [==[2.17.1]==])
set_property(GLOBAL PROPERTY _CMAKE_FindGit_GIT_EXECUTABLE_VERSION
  [==[/usr/bin/git;2.17.1]==]
)


include(ExternalProject)
ExternalProject_Add(map_concept.common-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "http://git.sy/medical_ai/nlp/map_concept/map_concept.common.git" "GIT_TAG" "48fb70826e960e3959ce0c215944aff9f86e200a"
                    SOURCE_DIR          "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-src"
                    BINARY_DIR          "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


