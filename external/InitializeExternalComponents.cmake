include(FetchContent)

# map_concept.common
set(MAP_CONCEPT_COMMON_LOGGING_BUILD OFF CACHE BOOL "Build Map Concept Common For Logging." FORCE)
set(MAP_CONCEPT_COMMON_GTEST_BUILD OFF CACHE BOOL "Build Map Concept Common For GTEST." FORCE)
set(MAP_CONCEPT_COMMON_CRYPTO_BUILD OFF CACHE BOOL "Build Map Concept Common For Crypto." FORCE)
set(MAP_CONCEPT_COMMON_JSON_BUILD OFF CACHE BOOL "Build Map Concept Common For Json." FORCE)
set(MAP_CONCEPT_COMMON_TEXT_BUILD OFF CACHE BOOL "Build Map Concept Common For Text." FORCE)
set(MAP_CONCEPT_COMMON_NETWORK_AWS_BUILD OFF CACHE BOOL "Build Map Concept Common For Network Aws." FORCE)
set(MAP_CONCEPT_COMMON_NETWORK_OATPP_BUILD ON CACHE BOOL "Build Map Concept Common For Network Oatpp." FORCE)
set(MAP_CONCEPT_COMMON_COMPRESSION_BUILD OFF CACHE BOOL "Build Map Concept Common For compression or decompression." FORCE)
if(DEFINED ENV{CI_REGISTRY_USER} AND DEFINED ENV{CI_REGISTRY_PASSWORD})
  FetchContent_Declare(map_concept.common
    GIT_REPOSITORY "http://$ENV{CI_REGISTRY_USER}:$ENV{CI_REGISTRY_PASSWORD}@git.sy/medical_ai/nlp/map_concept/map_concept.common.git"
    GIT_TAG d79b410a6f0d210e652d534635711273324b5442)
else()
  FetchContent_Declare(map_concept.common
    GIT_REPOSITORY http://git.sy/medical_ai/nlp/map_concept/map_concept.common.git
    GIT_TAG d79b410a6f0d210e652d534635711273324b5442)
endif()

FetchContent_GetProperties(map_concept.common)
if(NOT map_concept.common_POPULATED)
  FetchContent_Populate(map_concept.common)
  add_subdirectory(${map_concept.common_SOURCE_DIR} ${map_concept.common_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()

get_commit_id(${map_concept.common_SOURCE_DIR} "map_concept.common")