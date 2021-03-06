cmake_minimum_required(VERSION 3.9)
project(hxt_tetBR CXX)

# options are inherited from hxt_core (see ../core/CMakeList.txt)

option(HXT_TETBR_OBJECT_ONLY "Do not create hxt_tetBR library" OFF)

set(HXT_TETBR_SRC
	"${CMAKE_CURRENT_SOURCE_DIR}/src/hxt_boundary_recovery.cxx"
	"${CMAKE_CURRENT_SOURCE_DIR}/include/hxt_boundary_recovery.h"
	)

if(HXT_TETBR_OBJECT_ONLY)
	add_library(hxt_tetBR OBJECT ${HXT_TETBR_SRC})
else()
	add_library(hxt_tetBR ${HXT_TETBR_SRC})
endif()

add_subdirectory(../core "${CMAKE_CURRENT_BINARY_DIR}/hxt_boundaryRecovery_core")
add_subdirectory(../predicates "${CMAKE_CURRENT_BINARY_DIR}/predicates")

target_include_directories(hxt_tetBR
                           PUBLIC include
                           PRIVATE src)
target_link_libraries(hxt_tetBR
	                  PUBLIC hxt_core
                      PRIVATE hxt_predicates)

