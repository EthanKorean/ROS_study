cmake_minimum_required(VERSION 2.8.3)
project(ros_qml_pack)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  std_msgs roscpp
)

# Find Qt5 libraries
find_package(Qt5 REQUIRED COMPONENTS
  Core
  Qml
  Quick
)

# Configuration to make Qt compiles go smoother
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
include_directories( ${CMAKE_BINARY_DIR} )

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES ros_qml_pack
  CATKIN_DEPENDS std_msgs roscpp
#  DEPENDS system_lib
)

###########
## Build ##
###########

include_directories(
 include
  ${catkin_INCLUDE_DIRS}
)



######################################
# using QML gui

# Run MOC on headers of Q_OBJECT classes
set(MOC_HDRS include/qml_mediator.h)
qt5_wrap_cpp(MOC_SRCS ${MOC_HDRS})

# Run RCC on QRC file
set(RCC_FILES src/display.qrc)
qt5_add_resources(RCC_SOURCES ${RCC_FILES})


 add_executable(navi_node src/navi_node.cpp ${MOC_SRCS} ${RCC_SOURCES})
 add_executable(navi_start_node src/navi_start_node.cpp ${MOC_SRCS} ${RCC_SOURCES})

# Configure Qt5 Modules
# Equivalent to doing
# Qt += Core Qml Quick
# In Qt .pro file
qt5_use_modules(navi_node Core Qml Quick)
qt5_use_modules(navi_start_node Core Qml Quick)

## Specify libraries to link a library or executable target against
 target_link_libraries(navi_node
   ${catkin_LIBRARIES}
 )

 target_link_libraries(navi_start_node
  ${catkin_LIBRARIES}
)
