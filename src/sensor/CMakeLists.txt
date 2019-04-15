cmake_minimum_required(VERSION 2.8.3)
project(sensor)

add_compile_options(-std=c++11)

SET(CMAKE_VERBOSE_MAKEFILE 1)




find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
    cv_bridge
    image_transport
    sensor_msgs

)

find_package(Qt5 REQUIRED COMPONENTS
    Core
    Qml
    Quick
)
find_package(OpenCV REQUIRED)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

include_directories(${CMAKE_BINARY_DIR})

catkin_package(
    CATKIN_DEPENDS
    roscpp
    std_msgs
)

include_directories(
# include
  ${OpenCV_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
)
############################## start set to face_detector Node  ##############################

file(GLOB_RECURSE FACE_DETECTOR_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS src/face_detector/*.cpp)
file(GLOB_RECURSE FACE_DETECTOR_MOC_HDRS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS include/face_detector/*.hpp)
qt5_wrap_cpp(FACE_DETECTOR_MOC_SRCS ${FACE_DETECTOR_MOC_HDRS})

add_executable(face_detector
    ${FACE_DETECTOR_SOURCES}
    ${FACE_DETECTOR_MOC_SRCS}
    )
qt5_use_modules(face_detector Core Qml Quick)
target_link_libraries(face_detector
    ${OpenCV_LIBRARIES}
    ${catkin_LIBRARIES}
  )

############################## end set to face_detector Node  ##############################
