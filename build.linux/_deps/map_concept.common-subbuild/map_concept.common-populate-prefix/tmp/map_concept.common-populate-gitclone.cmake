
if(NOT "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-subbuild/map_concept.common-populate-prefix/src/map_concept.common-populate-stamp/map_concept.common-populate-gitinfo.txt" IS_NEWER_THAN "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-subbuild/map_concept.common-populate-prefix/src/map_concept.common-populate-stamp/map_concept.common-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-subbuild/map_concept.common-populate-prefix/src/map_concept.common-populate-stamp/map_concept.common-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --config "advice.detachedHead=false" "http://git.sy/medical_ai/nlp/map_concept/map_concept.common.git" "map_concept.common-src"
    WORKING_DIRECTORY "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'http://git.sy/medical_ai/nlp/map_concept/map_concept.common.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout 48fb70826e960e3959ce0c215944aff9f86e200a --
  WORKING_DIRECTORY "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '48fb70826e960e3959ce0c215944aff9f86e200a'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-subbuild/map_concept.common-populate-prefix/src/map_concept.common-populate-stamp/map_concept.common-populate-gitinfo.txt"
    "/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-subbuild/map_concept.common-populate-prefix/src/map_concept.common-populate-stamp/map_concept.common-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/mnt/d/测试/oatpp-libressl-cmake/build.linux/_deps/map_concept.common-subbuild/map_concept.common-populate-prefix/src/map_concept.common-populate-stamp/map_concept.common-populate-gitclone-lastrun.txt'")
endif()

