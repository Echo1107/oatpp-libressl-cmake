function (get_commit_id path name)
    if(WIN32)
        execute_process(COMMAND CMD /c "git describe --tags --always --dirty" 
            WORKING_DIRECTORY "${path}"
            OUTPUT_VARIABLE VER)
    elseif(UNIX)
        execute_process(COMMAND git describe --tags --always --dirty 
            WORKING_DIRECTORY "${path}"
            OUTPUT_VARIABLE VER)
        if(APPLE)
            execute_process(COMMAND sw_vers -productVersion OUTPUT_VARIABLE MACOSX_DEPLOYMENT_TARGET)
            string(REGEX REPLACE "\n$" "" MACOSX_DEPLOYMENT_TARGET "${MACOSX_DEPLOYMENT_TARGET}")
            message(STATUS "MACOSX_DEPLOYMENT_TARGET: ${MACOSX_DEPLOYMENT_TARGET}")
        endif()
    else()
        message(fatal "Unsupported platform detected.")
    endif()

    string(REGEX REPLACE "\n$" "" VER "${VER}")
    message(STATUS "${name}：${VER}")
endfunction(get_commit_id)


