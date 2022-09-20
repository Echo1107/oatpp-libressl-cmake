
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        message(STATUS "using external lib in dir /lib/x64")
        set(LIBRESSL_LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/x64")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        message(STATUS "using external lib in dir /lib/x86")
        set(LIBRESSL_LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/x86")
endif()

add_library(LibreSSL::TLS SHARED IMPORTED)
set_target_properties(LibreSSL::TLS PROPERTIES
    IMPORTED_GLOBAL TRUE
    IMPORTED_IMPLIB "${LIBRESSL_LIB_DIR}/libtls-15.lib"
    IMPORTED_LOCATION "${LIBRESSL_LIB_DIR}/libtls-15.dll")

add_library(LibreSSL::SSL SHARED IMPORTED)
set_target_properties(LibreSSL::SSL PROPERTIES
        IMPORTED_GLOBAL TRUE
        IMPORTED_IMPLIB "${LIBRESSL_LIB_DIR}/libssl-43.lib"
        IMPORTED_LOCATION "${LIBRESSL_LIB_DIR}/libssl-43.dll")

add_library(LibreSSL::Crypto SHARED IMPORTED)
set_target_properties(LibreSSL::Crypto PROPERTIES
        IMPORTED_GLOBAL TRUE
        IMPORTED_IMPLIB "${LIBRESSL_LIB_DIR}/libcrypto-41.lib"
        IMPORTED_LOCATION "${LIBRESSL_LIB_DIR}/libcrypto-41.dll")     

configure_file(${LIBRESSL_LIB_DIR}/libtls-15.dll ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/libtls-15.dll COPYONLY)
configure_file(${LIBRESSL_LIB_DIR}/libssl-43.dll ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/libssl-43.dll COPYONLY)
configure_file(${LIBRESSL_LIB_DIR}/libcrypto-41.dll ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/libcrypto-41.dll COPYONLY)