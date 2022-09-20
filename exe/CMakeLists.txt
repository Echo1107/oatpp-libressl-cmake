cmake_minimum_required(VERSION 3.1)

set(project_name ${OATPP_THIS_MODULE_NAME}-exe) ## rename your project here

project(${project_name})

file(GLOB_RECURSE src
        ${CMAKE_CURRENT_LIST_DIR}/*.h
        ${CMAKE_CURRENT_LIST_DIR}/*.hpp
        ${CMAKE_CURRENT_LIST_DIR}/*.cpp)

add_executable(${project_name} ${src})


target_link_libraries(${project_name} 
        PUBLIC ${OATPP_THIS_MODULE_NAME})
