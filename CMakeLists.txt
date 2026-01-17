cmake_minimum_required(VERSION 3.20)

project(bimg LANGUAGES CXX)

add_library(bimg STATIC)

file(GLOB_RECURSE BIMG_SRC
    src/*.cpp
    include/*.h
    3rdparty/astc-encoder/source/*.cpp
    3rdparty/astc-codec/src/*.cc
)

list(REMOVE_ITEM BIMG_SRC
    ${CMAKE_CURRENT_SOURCE_DIR}/src/image_decode.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/image_encode.cpp
)

target_sources(bimg PRIVATE ${BIMG_SRC})

target_include_directories(bimg
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty
        ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/astc-encoder/include
        ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/astc-codec/include
        ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/tinyexr/deps/miniz
        ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/iqa/include
)

target_link_libraries(bimg PUBLIC bx)

set_target_properties(bimg PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED YES
)
