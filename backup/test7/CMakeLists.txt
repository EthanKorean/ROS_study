cmake_minimum_required(VERSION 2.8.3)
project(test7)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
)
find_package(Qt5 REQUIRED COMPONENTS
    Core
    Qml
    Quick
)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

include_directories(${CMAKE_BINARY_DIR})

catkin_package(
    CATKIN_DEPENDS
    roscpp
    std_msgs
)

include_directories(
    include
    ${catkin_INCLUDE_DIRS}
)

set(MOC_HDRS include/mainwindow.h)
qt5_wrap_cpp(MOC_SRCS ${MOC_HDRS})
set(RCC_FILES qml/test7.qrc)
qt5_add_resources(RCC_SOURCES ${RCC_FILES})

file(GLOB_RECURSE QT_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS src/*.cpp)
add_executable(test7 ${QT_SOURCES} ${MOC_SRCS} ${RCC_SOURCES})

qt5_use_modules(test7 Core Qml Quick)
target_link_libraries(test7 ${catkin_LIBRARIES})
