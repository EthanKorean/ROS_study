# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/roskinetic/dev/ros/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/roskinetic/dev/ros/build

# Include any dependencies generated for this target.
include opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/depend.make

# Include the progress variables for this target.
include opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/progress.make

# Include the compile flags for this target's objects.
include opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/flags.make

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o: opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/flags.make
opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o: /home/roskinetic/dev/ros/src/opencv_tutorial/src/opencv_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/roskinetic/dev/ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o"
	cd /home/roskinetic/dev/ros/build/opencv_tutorial && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o -c /home/roskinetic/dev/ros/src/opencv_tutorial/src/opencv_test.cpp

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.i"
	cd /home/roskinetic/dev/ros/build/opencv_tutorial && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/roskinetic/dev/ros/src/opencv_tutorial/src/opencv_test.cpp > CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.i

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.s"
	cd /home/roskinetic/dev/ros/build/opencv_tutorial && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/roskinetic/dev/ros/src/opencv_tutorial/src/opencv_test.cpp -o CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.s

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.requires:

.PHONY : opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.requires

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.provides: opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.requires
	$(MAKE) -f opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/build.make opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.provides.build
.PHONY : opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.provides

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.provides.build: opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o


# Object files for target opencv_tutorial_node
opencv_tutorial_node_OBJECTS = \
"CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o"

# External object files for target opencv_tutorial_node
opencv_tutorial_node_EXTERNAL_OBJECTS =

/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/build.make
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_stitching3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_superres3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_videostab3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_aruco3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_bgsegm3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_bioinspired3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ccalib3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_cvv3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_dpm3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_face3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_fuzzy3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_hdf3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_img_hash3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_line_descriptor3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_optflow3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_reg3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_rgbd3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_saliency3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_stereo3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_structured_light3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_surface_matching3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_tracking3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xfeatures2d3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ximgproc3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xobjdetect3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xphoto3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libcv_bridge.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libimage_transport.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libmessage_filters.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libclass_loader.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/libPocoFoundation.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libdl.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libroslib.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/librospack.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libroscpp.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/librosconsole.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/librostime.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/libcpp_common.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_shape3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_photo3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_datasets3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_plot3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_text3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_dnn3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ml3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_video3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_calib3d3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_features2d3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_highgui3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_videoio3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_viz3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_phase_unwrapping3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_flann3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_objdetect3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1
/home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node: opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/roskinetic/dev/ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node"
	cd /home/roskinetic/dev/ros/build/opencv_tutorial && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opencv_tutorial_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/build: /home/roskinetic/dev/ros/devel/lib/opencv_tutorial/opencv_tutorial_node

.PHONY : opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/build

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/requires: opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/src/opencv_test.cpp.o.requires

.PHONY : opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/requires

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/clean:
	cd /home/roskinetic/dev/ros/build/opencv_tutorial && $(CMAKE_COMMAND) -P CMakeFiles/opencv_tutorial_node.dir/cmake_clean.cmake
.PHONY : opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/clean

opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/depend:
	cd /home/roskinetic/dev/ros/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/roskinetic/dev/ros/src /home/roskinetic/dev/ros/src/opencv_tutorial /home/roskinetic/dev/ros/build /home/roskinetic/dev/ros/build/opencv_tutorial /home/roskinetic/dev/ros/build/opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : opencv_tutorial/CMakeFiles/opencv_tutorial_node.dir/depend

