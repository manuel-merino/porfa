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
CMAKE_SOURCE_DIR = /home/a/NAUDIT/pruebas/dependencies/netlib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/a/NAUDIT/pruebas/dependencies/netlib/build

# Include any dependencies generated for this target.
include CMakeFiles/srv.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/srv.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/srv.dir/flags.make

CMakeFiles/srv.dir/src/examples/srv.cpp.o: CMakeFiles/srv.dir/flags.make
CMakeFiles/srv.dir/src/examples/srv.cpp.o: ../src/examples/srv.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/srv.dir/src/examples/srv.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srv.dir/src/examples/srv.cpp.o -c /home/a/NAUDIT/pruebas/dependencies/netlib/src/examples/srv.cpp

CMakeFiles/srv.dir/src/examples/srv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srv.dir/src/examples/srv.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/src/examples/srv.cpp > CMakeFiles/srv.dir/src/examples/srv.cpp.i

CMakeFiles/srv.dir/src/examples/srv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srv.dir/src/examples/srv.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/src/examples/srv.cpp -o CMakeFiles/srv.dir/src/examples/srv.cpp.s

CMakeFiles/srv.dir/src/examples/srv.cpp.o.requires:

.PHONY : CMakeFiles/srv.dir/src/examples/srv.cpp.o.requires

CMakeFiles/srv.dir/src/examples/srv.cpp.o.provides: CMakeFiles/srv.dir/src/examples/srv.cpp.o.requires
	$(MAKE) -f CMakeFiles/srv.dir/build.make CMakeFiles/srv.dir/src/examples/srv.cpp.o.provides.build
.PHONY : CMakeFiles/srv.dir/src/examples/srv.cpp.o.provides

CMakeFiles/srv.dir/src/examples/srv.cpp.o.provides.build: CMakeFiles/srv.dir/src/examples/srv.cpp.o


# Object files for target srv
srv_OBJECTS = \
"CMakeFiles/srv.dir/src/examples/srv.cpp.o"

# External object files for target srv
srv_EXTERNAL_OBJECTS =

bin/srv: CMakeFiles/srv.dir/src/examples/srv.cpp.o
bin/srv: CMakeFiles/srv.dir/build.make
bin/srv: lib/libnetlib.a
bin/srv: lib/libssl.a
bin/srv: lib/libcrypto.a
bin/srv: CMakeFiles/srv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/srv"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/srv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/srv.dir/build: bin/srv

.PHONY : CMakeFiles/srv.dir/build

CMakeFiles/srv.dir/requires: CMakeFiles/srv.dir/src/examples/srv.cpp.o.requires

.PHONY : CMakeFiles/srv.dir/requires

CMakeFiles/srv.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/srv.dir/cmake_clean.cmake
.PHONY : CMakeFiles/srv.dir/clean

CMakeFiles/srv.dir/depend:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles/srv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/srv.dir/depend

